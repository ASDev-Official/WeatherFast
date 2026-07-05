import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'l10n/app_localizations.dart';
import 'services/global_data.dart';
import 'services/weather_insights_service.dart';
import 'services/preferences_service.dart';
import 'weather_service.dart';
import 'services/calendar_service.dart';
import 'package:m3e_core/m3e_core.dart';
import 'ui/animated_weather_backdrop.dart';

class CalendarEventDetailsScreen extends StatefulWidget {
  final CalendarEventItem event;

  const CalendarEventDetailsScreen({super.key, required this.event});

  @override
  State<CalendarEventDetailsScreen> createState() => _CalendarEventDetailsScreenState();
}

class _CalendarEventDetailsScreenState extends State<CalendarEventDetailsScreen>
    with SingleTickerProviderStateMixin {
  final WeatherService _weatherService = WeatherService();
  final WeatherInsightsService _insightsService = WeatherInsightsService();

  bool _isLoading = true;
  String? _errorMessage;

  String _condition = 'Clear';
  bool _isDaytime = true;
  int? _tempC;
  int? _hiC;
  int? _loC;
  String? _resolvedAreaName;
  int? _aqi;

  String _meetingType = 'outdoor';

  String get _eventKey => '${widget.event.title.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '')}_${widget.event.startTime.millisecondsSinceEpoch}';

  // Insights data
  String _insightsSummary = '';
  Map<String, String> _clothingAdvice = {};
  List<Map<String, dynamic>> _hourlyInsights = [];

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _loadMeetingPreference();
    _fetchEventWeather();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadMeetingPreference() async {
    final saved = await PreferencesService.loadMeetingType(_eventKey);
    if (mounted) {
      setState(() {
        _meetingType = saved;
      });
    }
  }

  Future<void> _saveMeetingTypePreference(String value) async {
    await PreferencesService.saveMeetingType(_eventKey, value);
    setState(() {
      _meetingType = value;
    });
  }

  String _formatEventTime() {
    final start = widget.event.startTime;
    final end = widget.event.endTime;
    final startStr = DateFormat('EEEE, MMMM d • h:mm a').format(start);
    if (end == null) {
      return startStr;
    }
    
    // Check if end is on the same day
    if (start.year == end.year && start.month == end.month && start.day == end.day) {
      return '$startStr - ${DateFormat('h:mm a').format(end)}';
    } else {
      return '$startStr - ${DateFormat('EEEE, MMMM d • h:mm a').format(end)}';
    }
  }

  Future<void> _fetchEventWeather() async {
    final loc = widget.event.location.trim();
    if (loc.isEmpty) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'No location provided for this event.';
      });
      return;
    }

    try {
      final data = await _weatherService.fetchAllWeatherData(loc, forceGlobalOpenMeteo: true);
      final weather = data['weather'] ?? {};
      final forecast = data['forecast'] ?? {};

      final current = weather['current'] ?? {};
      final locationData = weather['location'] ?? {};
      final offsetSec = (locationData['utc_offset_seconds'] as num?)?.toInt() ?? 0;

      // Find the hourly forecast closest to the event start time in UTC
      final eventTimeUtc = widget.event.startTime.toUtc();
      final eventLocalTimeAtLocation = widget.event.startTime.toUtc().add(Duration(seconds: offsetSec));
      
      Map<String, dynamic>? closestHourForecast;
      Duration closestDuration = const Duration(days: 365);
      
      final dailyForecasts = (forecast['forecast']?['forecastday'] as List?) ?? [];
      for (var day in dailyForecasts) {
        final hourlyList = (day['hour'] as List?) ?? [];
        for (var hourData in hourlyList) {
          final timeStr = hourData['time']?.toString();
          if (timeStr != null) {
            final parsedTimeLocal = DateTime.tryParse(timeStr);
            if (parsedTimeLocal != null) {
              // Convert this local forecast time to UTC using the location's offset
              final parsedTimeUtc = DateTime.utc(
                parsedTimeLocal.year,
                parsedTimeLocal.month,
                parsedTimeLocal.day,
                parsedTimeLocal.hour,
                parsedTimeLocal.minute,
              ).subtract(Duration(seconds: offsetSec));
              
              final diff = parsedTimeUtc.difference(eventTimeUtc).abs();
              if (diff < closestDuration) {
                closestDuration = diff;
                closestHourForecast = hourData;
              }
            }
          }
        }
      }

      // If the closest hourly forecast is more than 6 hours away, we consider it out of range
      if (closestDuration > const Duration(hours: 6)) {
        closestHourForecast = null;
      }

      // Determine daytime status for the event's local time at the location
      final isDaytime = eventLocalTimeAtLocation.hour >= 6 && eventLocalTimeAtLocation.hour < 18;

      // Extract matched day from daily forecasts based on the event's local date at the location
      Map<String, dynamic>? matchedDay;
      final eventDateStr = DateFormat('yyyy-MM-dd').format(eventLocalTimeAtLocation);
      matchedDay = dailyForecasts.firstWhere(
        (d) => d['date']?.toString() == eventDateStr,
        orElse: () => null,
      );
      matchedDay ??= dailyForecasts.firstOrNull as Map<String, dynamic>?;

      // Extract high/low values for the event day
      final int? hiVal = matchedDay != null
          ? (matchedDay['day']?['maxtemp_c'] as num?)?.round()
          : (current['temp_c'] as num?)?.round(); // fallback

      final int? loVal = matchedDay != null
          ? (matchedDay['day']?['mintemp_c'] as num?)?.round()
          : (current['temp_c'] as num?)?.round(); // fallback

      // Use closest hour forecast if found, otherwise fall back to matched day's daily forecast or current weather
      final String resolvedCondition = closestHourForecast != null
          ? (closestHourForecast['condition']?['text'] ?? 'Clear')
          : (matchedDay?['day']?['condition']?['text'] ?? current['condition']?['text'] ?? 'Clear');

      final int? resolvedTemp = closestHourForecast != null
          ? (closestHourForecast['temp_c'] as num?)?.round()
          : (matchedDay != null && hiVal != null && loVal != null
             ? ((hiVal + loVal) / 2).round()
             : (current['temp_c'] as num?)?.round());

      final int? resolvedAqi = (current['aqi'] as num?)?.toInt(); // AQI is usually current/general

      if (!mounted) return;
      setState(() {
        _condition = resolvedCondition;
        _tempC = resolvedTemp;
        _hiC = hiVal;
        _loC = loVal;
        _resolvedAreaName = locationData['name'] ?? locationData['region'];
        _isDaytime = isDaytime;
        _aqi = resolvedAqi;
        _isLoading = false;
      });
      _controller.forward(from: 0);

      // Generate insights using values from the event time
      final country = locationData['country']?.toString() ?? '';
      
      final int resolvedHumidity = closestHourForecast != null
          ? ((closestHourForecast['humidity'] ?? closestHourForecast['relative_humidity_2m']) as num?)?.toInt() ?? 0
          : (matchedDay != null
             ? (matchedDay['day']?['humidity']?['high'] as num?)?.toInt() ?? (current['humidity'] as num?)?.toInt() ?? 0
             : (current['humidity'] as num?)?.toInt() ?? 0);

      final double resolvedWind = closestHourForecast != null
          ? ((closestHourForecast['wind_kph'] ?? closestHourForecast['wind_speed_10m']) as num?)?.toDouble() ?? 0.0
          : (matchedDay != null
             ? (matchedDay['day']?['wind']?['high_kph'] as num?)?.toDouble() ?? (current['wind_kph'] as num?)?.toDouble() ?? 0.0
             : (current['wind_kph'] as num?)?.toDouble() ?? 0.0);

      final double resolvedUv = closestHourForecast != null
          ? (closestHourForecast['uv'] as num?)?.toDouble() ?? (current['uv'] as num?)?.toDouble() ?? 0.0
          : (current['uv'] as num?)?.toDouble() ?? 0.0;

      final insights = _insightsService.generateInsights(
        l10n: AppLocalizations.of(context)!,
        condition: _condition,
        currentTemp: _tempC ?? 0,
        highTemp: _hiC ?? 0,
        lowTemp: _loC ?? 0,
        humidity: resolvedHumidity,
        windSpeed: resolvedWind,
        uvIndex: resolvedUv,
        aqi: _aqi ?? 0,
        dailyForecasts: dailyForecasts.cast<Map<String, dynamic>>(),
        country: country,
      );

      if (mounted) {
        setState(() {
          _insightsSummary = insights['summary'] as String;
          _clothingAdvice = (insights['clothingAdvice'] as Map).cast<String, String>();
          _hourlyInsights = (insights['hourlyInsights'] as List).cast<Map<String, dynamic>>();
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final brightness = Theme.of(context).brightness;

    final cardColor = ElevationOverlay.applySurfaceTint(
      Theme.of(context).cardTheme.color ?? Theme.of(context).colorScheme.surface,
      Theme.of(context).cardTheme.surfaceTintColor,
      Theme.of(context).cardTheme.elevation ?? 2.0,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.eventDetails),
        iconTheme: IconThemeData(
          color: brightness == Brightness.dark ? Colors.white : Colors.black87,
        ),
      ),
      body: Stack(
        children: [
          if (!_isLoading && _errorMessage == null)
            AnimatedWeatherBackdrop(
              condition: _condition,
              isDaytime: _isDaytime,
              height: 320,
              intensity: 0.6,
            ),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: [
                // Event details card
                Card(
                  elevation: 2.0,
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.event.title,
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.schedule_rounded, size: 20, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _formatEventTime(),
                                style: textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on_rounded, size: 20, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                widget.event.location,
                                style: textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                        if (widget.event.description != null && widget.event.description!.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          const Divider(),
                          const SizedBox(height: 8),
                          Text(
                            AppLocalizations.of(context)!.description,
                            style: textTheme.labelLarge?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.event.description!,
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Meeting Environment Card (Indoor vs Outdoor selector)
                Card(
                  elevation: 2.0,
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.meetingEnvironment,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: SegmentedButton<String>(
                            segments: [
                              ButtonSegment<String>(
                                value: 'indoor',
                                label: Text(AppLocalizations.of(context)!.indoor),
                                icon: const Icon(Icons.business_rounded),
                              ),
                              ButtonSegment<String>(
                                value: 'outdoor',
                                label: Text(AppLocalizations.of(context)!.outdoor),
                                icon: const Icon(Icons.forest_rounded),
                              ),
                            ],
                            selected: {_meetingType},
                            onSelectionChanged: (Set<String> newSelection) {
                              _saveMeetingTypePreference(newSelection.first);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Weather section
                if (_isLoading)
                  _buildLoadingSkeleton()
                else if (_errorMessage != null)
                  _buildErrorCard(colorScheme, textTheme)
                else
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.weatherForArea(_resolvedAreaName ?? 'Area'),
                          style: textTheme.titleSmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        
                        // Main area weather summary card
                        Card(
                          elevation: 2.0,
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _tempDisplay(),
                                      style: textTheme.displayMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _condition,
                                      style: textTheme.titleMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                    if (_hiC != null && _loC != null) ...[
                                      const SizedBox(height: 4),
                                      Text(
                                        'H: ${_tempValue(_hiC!)}° • L: ${_tempValue(_loC!)}°',
                                        style: textTheme.bodyMedium?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                // Displays condition icon
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: colorScheme.primaryContainer,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    _getConditionIcon(),
                                    size: 48,
                                    color: colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Smart Recommendations Card
                        Card(
                          elevation: 2.0,
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.tips_and_updates_rounded, color: colorScheme.primary),
                                    const SizedBox(width: 8),
                                    Text(
                                      AppLocalizations.of(context)!.smartRecommendations,
                                      style: textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  _getMeetingSuggestions(),
                                  style: textTheme.bodyMedium?.copyWith(
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Clothing & Insights Advice Card
                        if (_insightsSummary.isNotEmpty || _clothingAdvice.isNotEmpty)
                          M3ECardColumn(
                            innerRadius: 12.0,
                            color: cardColor,
                            children: [
                              if (_insightsSummary.isNotEmpty)
                                ListTile(
                                  leading: Icon(Icons.lightbulb_outline_rounded, color: colorScheme.primary),
                                  title: Text(
                                    _insightsSummary,
                                    style: textTheme.bodyMedium?.copyWith(
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              if (_clothingAdvice.isNotEmpty)
                                ListTile(
                                  leading: Icon(Icons.checkroom_rounded, color: colorScheme.primary),
                                  title: Text(
                                    _clothingAdvice['advice'] ?? 'Wear appropriate layers.',
                                    style: textTheme.bodyMedium?.copyWith(
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        const SizedBox(height: 16),

                        // Hourly timeline row
                        if (_hourlyInsights.isNotEmpty) ...[
                          Text(
                            AppLocalizations.of(context)!.todaysTimeline,
                            style: textTheme.titleSmall?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _hourlyInsights.length,
                              itemBuilder: (context, index) {
                                final hour = _hourlyInsights[index];
                                final tempVal = (hour['temp'] as num?)?.toDouble() ?? 0.0;
                                final displayTemp = GlobalData.useFahrenheit
                                    ? ((tempVal * 9 / 5) + 32).round()
                                    : tempVal.round();
                                
                                return Card(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          hour['time'] ?? '',
                                          style: textTheme.labelMedium,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '$displayTemp°',
                                          style: textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getMeetingSuggestions() {
    final tempC = _tempC ?? 20;
    final tempDisplay = _tempValue(tempC);
    final isRainy = _condition.toLowerCase().contains('rain') ||
                    _condition.toLowerCase().contains('drizzle') ||
                    _condition.toLowerCase().contains('shower') ||
                    _condition.toLowerCase().contains('storm');
    
    final l10n = AppLocalizations.of(context)!;
    
    if (_meetingType == 'indoor') {
      List<String> commuteSuggestions = [];
      if (isRainy) {
        commuteSuggestions.add(l10n.recCommuteRain);
      }
      if (tempC > 30) {
        commuteSuggestions.add(l10n.recCommuteHot(tempDisplay));
      } else if (tempC < 15) {
        commuteSuggestions.add(l10n.recCommuteCold(tempDisplay));
      }
      
      if (commuteSuggestions.isEmpty) {
        return l10n.recIndoorAllClear;
      } else {
        return "${l10n.recIndoorCommuteHeader}• ${commuteSuggestions.join('\n• ')}";
      }
    } else {
      // Outdoor
      List<String> outdoorSuggestions = [];
      if (isRainy) {
        outdoorSuggestions.add(l10n.recOutdoorRain);
      }
      if (tempC > 30) {
        outdoorSuggestions.add(l10n.recOutdoorHot(tempDisplay));
      } else if (tempC < 15) {
        outdoorSuggestions.add(l10n.recOutdoorCold(tempDisplay));
      }
      
      // If wind is available and high
      final windVal = _hourlyInsights.isNotEmpty ? (_hourlyInsights[0]['wind_kph'] as num?)?.toDouble() : null;
      if (windVal != null && windVal > 25) {
        outdoorSuggestions.add(l10n.recOutdoorWindy(windVal.toStringAsFixed(0)));
      }
      
      if (outdoorSuggestions.isEmpty) {
        return l10n.recOutdoorAllClear;
      } else {
        return "${l10n.recOutdoorHeader}• ${outdoorSuggestions.join('\n• ')}";
      }
    }
  }

  String _tempDisplay() {
    if (_tempC == null) return '--°';
    return '${_tempValue(_tempC!)}°';
  }

  int _tempValue(int c) {
    if (GlobalData.useFahrenheit) {
      return ((c * 9 / 5) + 32).round();
    }
    return c;
  }

  IconData _getConditionIcon() {
    final lower = _condition.toLowerCase();
    if (lower.contains('rain') || lower.contains('drizzle') || lower.contains('shower')) {
      return Icons.umbrella_rounded;
    }
    if (lower.contains('snow') || lower.contains('ice') || lower.contains('sleet')) {
      return Icons.ac_unit_rounded;
    }
    if (lower.contains('thunder') || lower.contains('storm')) {
      return Icons.thunderstorm_rounded;
    }
    if (lower.contains('cloud') || lower.contains('overcast') || lower.contains('fog')) {
      return Icons.cloud_rounded;
    }
    if (lower.contains('wind') || lower.contains('breeze')) {
      return Icons.air_rounded;
    }
    return Icons.wb_sunny_rounded;
  }

  Widget _buildLoadingSkeleton() {
    return Skeletonizer(
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.loadingWeather,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Card(
            child: SizedBox(
              height: 120,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorCard(ColorScheme colorScheme, TextTheme textTheme) {
    return Card(
      color: colorScheme.errorContainer,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.error_outline_rounded, color: colorScheme.onErrorContainer),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.noWeatherAvailable,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onErrorContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _errorMessage ?? '',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
