import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'l10n/app_localizations.dart';
import 'services/global_data.dart';
import 'services/weather_cache_service.dart';
import 'time_utils.dart';

class SavedLocationsScreen extends StatefulWidget {
  const SavedLocationsScreen({
    super.key,
    required this.savedLocations,
    required this.onSelectLocation,
    required this.onRemoveLocation,
  });

  final List<String> savedLocations;
  final Function(String) onSelectLocation;
  final Function(String) onRemoveLocation;

  @override
  State<SavedLocationsScreen> createState() => _SavedLocationsScreenState();
}

class _SavedLocationsScreenState extends State<SavedLocationsScreen> {
  late final List<String> _displayLocations;
  final Map<String, Map<String, dynamic>> _weatherDataMap = {};
  final Map<String, Map<String, dynamic>> _forecastDataMap = {};
  final Map<String, DateTime> _localTimesMap = {};

  @override
  void initState() {
    super.initState();
    _displayLocations = ['current_location', ...widget.savedLocations];
    _loadAllWeatherData();
  }

  Future<void> _loadAllWeatherData() async {
    final currentSnap = await WeatherCacheService.loadSnapshot();
    if (currentSnap != null && mounted) {
      setState(() {
        _weatherDataMap['current_location'] = currentSnap.weatherData;
        _forecastDataMap['current_location'] = currentSnap.forecastData;
        _localTimesMap['current_location'] =
            _resolveLocalTime(currentSnap.weatherData);
      });
    }
    for (final loc in widget.savedLocations) {
      final snap = await WeatherCacheService.loadSnapshotFor(loc);
      if (snap != null && mounted) {
        setState(() {
          _weatherDataMap[loc] = snap.weatherData;
          _forecastDataMap[loc] = snap.forecastData;
          _localTimesMap[loc] = _resolveLocalTime(snap.weatherData);
        });
      }
    }
  }

  DateTime _resolveLocalTime(Map<String, dynamic> weatherData) {
    final tzId = weatherData['location']?['tz_id']?.toString() ?? '';
    if (tzId.isNotEmpty) return TimeUtils.getLocalTime(tzId);
    final localtime = weatherData['location']?['localtime']?.toString() ?? '';
    return DateTime.tryParse(localtime) ?? DateTime.now();
  }

  String _insightForCondition(String condition, bool isDaytime, BuildContext context) {
    final lower = condition.toLowerCase();
    final localizations = AppLocalizations.of(context)!;
    if (lower.contains('rain') || lower.contains('drizzle')) return localizations.adviceRain;
    if (lower.contains('snow') || lower.contains('blizzard') || lower.contains('sleet')) return localizations.adviceSnow;
    if (lower.contains('storm') || lower.contains('thunder')) {
      return localizations.adviceStorm;
    }
    if (lower.contains('clear') || lower.contains('sunny')) {
      return isDaytime
          ? localizations.adviceClear
          : localizations.adviceClearNight;
    }
    if (lower.contains('cloud') || lower.contains('overcast')) {
      return localizations.adviceCloud;
    }
    return localizations.adviceDefault;
  }

  IconData _iconForCondition(String condition) {
    final c = condition.toLowerCase();
    if (c.contains('thunder') || c.contains('storm')) return Icons.thunderstorm_rounded;
    if (c.contains('rain') || c.contains('drizzle') || c.contains('shower')) return Icons.grain_rounded;
    if (c.contains('snow') || c.contains('blizzard') || c.contains('sleet')) return Icons.ac_unit_rounded;
    if (c.contains('fog') || c.contains('mist') || c.contains('haze')) return Icons.foggy;
    if (c.contains('cloud') || c.contains('overcast')) return Icons.cloud_rounded;
    if (c.contains('partly') || c.contains('mostly cloudy')) return Icons.cloud_queue_rounded;
    if (c.contains('sunny') || c.contains('clear')) return Icons.wb_sunny_rounded;
    return Icons.wb_sunny_rounded;
  }

  Widget _buildCard(BuildContext context, String loc) {
    final scheme = Theme.of(context).colorScheme;
    final isCurrent = loc == 'current_location';
    final weather = _weatherDataMap[loc];
    final forecast = _forecastDataMap[loc];
    final localTime = _localTimesMap[loc];

    final displayName = weather?['location']?['name'] ??
        (isCurrent ? AppLocalizations.of(context)!.currentLocation : loc);
    final condition =
        weather?['current']?['condition']?['text']?.toString() ?? '';
    final isDaytime = weather?['current']?['is_day'] == 1;

    final currentData = weather?['current'] as Map?;
    final tempVal = currentData == null
        ? null
        : (GlobalData.useFahrenheit
            ? currentData['temp_f']
            : currentData['temp_c']);
    final tempText = tempVal != null
        ? '${tempVal.round()}°${GlobalData.useFahrenheit ? 'F' : 'C'}'
        : '--';

    final today =
        _firstOrNull(forecast?['forecast']?['forecastday'] as List?) as Map?;
    final dayData = today?['day'] as Map?;
    final maxVal = dayData == null
        ? null
        : (GlobalData.useFahrenheit ? dayData['maxtemp_f'] : dayData['maxtemp_c']);
    final minVal = dayData == null
        ? null
        : (GlobalData.useFahrenheit ? dayData['mintemp_f'] : dayData['mintemp_c']);
    final highLowText = (maxVal != null && minVal != null)
        ? AppLocalizations.of(context)!.highLowTemp(
            maxVal.round().toString(), minVal.round().toString())
        : '--';

    final dateText = localTime != null
        ? DateFormat('EEE, MMM d \u2022 h:mm a').format(localTime)
        : '';

    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          widget.onSelectLocation(loc);
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Location name ──────────────────────────────────────────
              Row(
                children: [
                  Icon(
                    isCurrent
                        ? Icons.my_location_rounded
                        : Icons.location_on_rounded,
                    size: 16,
                    color: scheme.primary,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      displayName,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: scheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              // ── Condition icon + text + day/night chip ─────────────────
              Row(
                children: [
                  Icon(
                    _iconForCondition(condition),
                    size: 32,
                    color: scheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          condition.isNotEmpty ? condition : '…',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (dateText.isNotEmpty)
                          Text(
                            dateText,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: scheme.onSurfaceVariant),
                          ),
                      ],
                    ),
                  ),
                  if (weather != null)
                    Chip(
                      label: Text(
                        isDaytime
                            ? AppLocalizations.of(context)!.daytime
                            : AppLocalizations.of(context)!.night,
                      ),
                      avatar: Icon(
                        isDaytime ? Icons.wb_sunny_rounded : Icons.nights_stay,
                        size: 18,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              // ── Large temp + H/L + insight ─────────────────────────────
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    tempText,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          highLowText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: scheme.onSurfaceVariant),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _insightForCondition(condition, isDaytime, context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: scheme.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.locations),
      ),
      body: _displayLocations.length <= 1
          ? Center(
              child: Text(
                AppLocalizations.of(context)!.noSavedLocations,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            )
          : ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _displayLocations.length,
              itemBuilder: (context, index) {
                final loc = _displayLocations[index];
                final isCurrent = loc == 'current_location';
                final card = _buildCard(context, loc);

                if (isCurrent) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: card,
                  );
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Dismissible(
                    key: Key('dismiss_$loc'),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    onDismissed: (_) {
                      widget.onRemoveLocation(loc);
                      setState(() => _displayLocations.remove(loc));
                    },
                    child: card,
                  ),
                );
              },
            ),
    );
  }
}

dynamic _firstOrNull(List? list) {
  if (list == null || list.isEmpty) return null;
  return list.first;
}
