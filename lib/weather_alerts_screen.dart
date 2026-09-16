import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:m3e_core/m3e_core.dart';

import 'l10n/app_localizations.dart';
import 'models/location_alert_config.dart';
import 'services/global_data.dart';
import 'services/notification_service.dart';
import 'services/preferences_service.dart';
import 'services/weather_alert_engine.dart';

class WeatherAlertsScreen extends StatefulWidget {
  final String? initialLocationId;

  const WeatherAlertsScreen({
    super.key,
    this.initialLocationId,
  });

  @override
  State<WeatherAlertsScreen> createState() => _WeatherAlertsScreenState();
}

class _WeatherAlertsScreenState extends State<WeatherAlertsScreen> {
  List<String> _locationIds = ['current_location'];
  Map<String, String> _locationNames = {'current_location': 'Current Location'};
  String _selectedLocationId = 'current_location';
  LocationAlertConfig? _currentConfig;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLocationsAndConfig();
  }

  Future<void> _loadLocationsAndConfig() async {
    try {
      final saved = await PreferencesService.loadSavedLocations();
      final allIds = ['current_location', ...saved];
      final names = <String, String>{
        'current_location': 'Current Location',
      };

      for (final loc in saved) {
        names[loc] = loc;
      }

      final initialId = widget.initialLocationId != null && allIds.contains(widget.initialLocationId)
          ? widget.initialLocationId!
          : 'current_location';

      final config = await PreferencesService.loadLocationAlertConfig(
        initialId,
        defaultName: names[initialId],
      );

      if (mounted) {
        setState(() {
          _locationIds = allIds;
          _locationNames = names;
          _selectedLocationId = initialId;
          _currentConfig = config;
        });
      }
    } catch (e, st) {
      debugPrint('Error loading weather alert locations and config: $e\n$st');
      if (mounted) {
        setState(() {
          _currentConfig ??= const LocationAlertConfig(
            locationId: 'current_location',
            locationName: 'Current Location',
          );
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _selectLocation(String id) async {
    if (id == _selectedLocationId) return;

    final config = await PreferencesService.loadLocationAlertConfig(
      id,
      defaultName: _locationNames[id],
    );

    if (mounted) {
      setState(() {
        _selectedLocationId = id;
        _currentConfig = config;
      });
    }
  }

  Future<void> _updateConfig(LocationAlertConfig newConfig) async {
    setState(() {
      _currentConfig = newConfig;
    });
    await PreferencesService.saveLocationAlertConfig(newConfig);

    // If enabling alerts, proactively ensure permissions are requested
    if (newConfig.enabled) {
      await NotificationService().requestPermissions();
    }
  }

  Future<void> _pickBriefingTime() async {
    if (_currentConfig == null) return;
    final initial = TimeOfDay(
      hour: _currentConfig!.dailyBriefingHour,
      minute: _currentConfig!.dailyBriefingMinute,
    );

    final picked = await showTimePicker(
      context: context,
      initialTime: initial,
    );

    if (picked != null) {
      _updateConfig(_currentConfig!.copyWith(
        dailyBriefingHour: picked.hour,
        dailyBriefingMinute: picked.minute,
      ));
    }
  }

  Future<void> _pickQuietHoursTime({required bool isStart}) async {
    if (_currentConfig == null) return;
    final initialHour = isStart
        ? _currentConfig!.quietHoursStartHour
        : _currentConfig!.quietHoursEndHour;

    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: initialHour, minute: 0),
    );

    if (picked != null) {
      if (isStart) {
        _updateConfig(_currentConfig!.copyWith(quietHoursStartHour: picked.hour));
      } else {
        _updateConfig(_currentConfig!.copyWith(quietHoursEndHour: picked.hour));
      }
    }
  }

  String _formatHour(int hour) {
    final dt = DateTime(2026, 1, 1, hour, 0);
    final is24 = MediaQuery.of(context).alwaysUse24HourFormat;
    return is24 ? DateFormat('HH:00').format(dt) : DateFormat('h a').format(dt);
  }

  String _formatTime(int hour, int minute) {
    final dt = DateTime(2026, 1, 1, hour, minute);
    final is24 = MediaQuery.of(context).alwaysUse24HourFormat;
    return is24 ? DateFormat('HH:mm').format(dt) : DateFormat('h:mm a').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final cardTheme = Theme.of(context).cardTheme;
    final cardColor = ElevationOverlay.applySurfaceTint(
      cardTheme.color ?? colorScheme.surface,
      cardTheme.surfaceTintColor,
      cardTheme.elevation ?? 2.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.weatherAlerts),
        centerTitle: false,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                // Horizontal Location Selector Chips
                SliverToBoxAdapter(
                  child: _buildLocationSelector(colorScheme),
                ),

                if (_currentConfig != null) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Beta Notice Banner
                          _buildBetaBanner(colorScheme, l10n),

                          // Master Toggle Card
                          _buildMasterToggleCard(cardColor, colorScheme, l10n),
                          const SizedBox(height: 16),

                          // If enabled, display rich customization options
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 250),
                            opacity: _currentConfig!.enabled ? 1.0 : 0.45,
                            child: AbsorbPointer(
                              absorbing: !_currentConfig!.enabled,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 1. Severe Weather & Floods
                                  _buildSectionHeader(l10n.floodAndSevere, colorScheme),
                                  const SizedBox(height: 8),
                                  _buildSevereGroup(cardColor, colorScheme, l10n),
                                  const SizedBox(height: 20),

                                  // 2. Rain & Precipitation
                                  _buildSectionHeader(l10n.rainAlertsTitle, colorScheme),
                                  const SizedBox(height: 8),
                                  _buildRainGroup(cardColor, colorScheme, l10n),
                                  const SizedBox(height: 20),

                                  // 3. Temperature & Sun
                                  _buildSectionHeader(l10n.temperatureAndSun, colorScheme),
                                  const SizedBox(height: 8),
                                  _buildTempGroup(cardColor, colorScheme, l10n),
                                  const SizedBox(height: 20),

                                  // 4. Air Quality
                                  _buildSectionHeader(l10n.airQualityTitle, colorScheme),
                                  const SizedBox(height: 8),
                                  _buildAqiGroup(cardColor, colorScheme, l10n),
                                  const SizedBox(height: 20),

                                  // 5. Daily Briefing
                                  _buildSectionHeader(l10n.dailyBriefingTitle, colorScheme),
                                  const SizedBox(height: 8),
                                  _buildBriefingGroup(cardColor, colorScheme, l10n),
                                  const SizedBox(height: 20),

                                  // 6. Quiet Hours
                                  _buildSectionHeader(l10n.quietHours, colorScheme),
                                  const SizedBox(height: 8),
                                  _buildQuietHoursGroup(cardColor, colorScheme, l10n),
                                  const SizedBox(height: 24),

                                  // Test Notification Action
                                  Center(
                                    child: M3EFilledButton.tonal(
                                      onPressed: () async {
                                        await WeatherAlertEngine().sendTestAlert(_currentConfig!);
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text(l10n.testAlertSent)),
                                          );
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.notifications_active_outlined, size: 18),
                                          const SizedBox(width: 8),
                                          Text(l10n.sendTestAlert),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
    );
  }

  Widget _buildLocationSelector(ColorScheme colorScheme) {
    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: _locationIds.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final id = _locationIds[index];
          final isSelected = id == _selectedLocationId;
          final isCurrent = id == 'current_location';
          final name = isCurrent
              ? (AppLocalizations.of(context)?.currentLocation ?? 'Current Location')
              : (_locationNames[id] ?? id);

          return FilterChip(
            selected: isSelected,
            showCheckmark: false,
            avatar: Icon(
              isCurrent ? Icons.my_location_rounded : Icons.location_on_rounded,
              size: 16,
              color: isSelected ? colorScheme.onPrimaryContainer : colorScheme.onSurfaceVariant,
            ),
            label: Text(
              name,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? colorScheme.onPrimaryContainer : colorScheme.onSurface,
              ),
            ),
            backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            selectedColor: colorScheme.primaryContainer,
            side: BorderSide(
              color: isSelected ? colorScheme.primary : colorScheme.outlineVariant.withValues(alpha: 0.5),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onSelected: (_) => _selectLocation(id),
          );
        },
      ),
    );
  }

  Widget _buildBetaBanner(ColorScheme colorScheme, AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.tertiary.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'BETA',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: colorScheme.onTertiaryContainer,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.weatherAlertsBetaNotice,
              style: TextStyle(
                fontSize: 13,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMasterToggleCard(Color cardColor, ColorScheme colorScheme, AppLocalizations l10n) {
    final cfg = _currentConfig!;
    return M3ECard(
      index: 0,
      position: M3ECardPosition.single,
      outerRadius: 18,
      innerRadius: 18,
      gap: 0,
      color: cardColor,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: SwitchListTile(
        secondary: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: cfg.enabled ? colorScheme.primaryContainer : colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            cfg.enabled ? Icons.notifications_active_rounded : Icons.notifications_off_outlined,
            color: cfg.enabled ? colorScheme.onPrimaryContainer : colorScheme.onSurfaceVariant,
          ),
        ),
        title: Text(
          l10n.enableAlertsForLocation,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(l10n.enableAlertsForLocationDesc),
        value: cfg.enabled,
        onChanged: (val) => _updateConfig(cfg.copyWith(enabled: val)),
      ),
    );
  }

  Widget _buildSectionHeader(String title, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, top: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: colorScheme.primary,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _buildSevereGroup(Color cardColor, ColorScheme colorScheme, AppLocalizations l10n) {
    final cfg = _currentConfig!;
    final windUnit = GlobalData.windUnit;
    final displayWind = windUnit == 'mph'
        ? (cfg.windSpeedThreshold * 0.621371).round()
        : cfg.windSpeedThreshold.round();

    return M3ECardColumn(
      innerRadius: 12.0,
      color: cardColor,
      children: [
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.flood_rounded, color: colorScheme.error, size: 22),
          ),
          title: Text(l10n.floodAlertsTitle),
          subtitle: Text(l10n.floodAlertsDesc),
          value: cfg.floodAlerts,
          onChanged: (val) => _updateConfig(cfg.copyWith(floodAlerts: val)),
        ),
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.thunderstorm_rounded, color: colorScheme.onPrimaryContainer, size: 22),
          ),
          title: Text(l10n.severeStormsTitle),
          subtitle: Text(l10n.severeStormsDesc),
          value: cfg.severeWeather,
          onChanged: (val) => _updateConfig(cfg.copyWith(severeWeather: val)),
        ),
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.air_rounded, color: colorScheme.onTertiaryContainer, size: 22),
          ),
          title: Text(l10n.highWindTitle),
          subtitle: Text(l10n.highWindDesc('$displayWind $windUnit')),
          value: cfg.highWind,
          onChanged: (val) => _updateConfig(cfg.copyWith(highWind: val)),
        ),
        if (cfg.highWind) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wind Threshold',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: SegmentedButton<double>(
                    showSelectedIcon: false,
                    segments: [
                      ButtonSegment(value: 35.0, label: Text(windUnit == 'mph' ? '22 mph' : '35 km/h')),
                      ButtonSegment(value: 50.0, label: Text(windUnit == 'mph' ? '31 mph' : '50 km/h')),
                      ButtonSegment(value: 65.0, label: Text(windUnit == 'mph' ? '40 mph' : '65 km/h')),
                    ],
                    selected: {cfg.windSpeedThreshold},
                    onSelectionChanged: (set) {
                      if (set.isNotEmpty) {
                        _updateConfig(cfg.copyWith(windSpeedThreshold: set.first));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildRainGroup(Color cardColor, ColorScheme colorScheme, AppLocalizations l10n) {
    final cfg = _currentConfig!;
    return M3ECardColumn(
      innerRadius: 12.0,
      color: cardColor,
      children: [
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.grain_rounded, color: colorScheme.primary, size: 22),
          ),
          title: Text(l10n.rainAlertsTitle),
          subtitle: Text(l10n.rainAlertsDesc),
          value: cfg.rainAlerts,
          onChanged: (val) => _updateConfig(cfg.copyWith(rainAlerts: val)),
        ),
        if (cfg.rainAlerts) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.rainChanceThresholdTitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: SegmentedButton<int>(
                    showSelectedIcon: false,
                    segments: const [
                      ButtonSegment(value: 30, label: Text('30%')),
                      ButtonSegment(value: 50, label: Text('50%')),
                      ButtonSegment(value: 70, label: Text('70%')),
                    ],
                    selected: {cfg.rainChanceThreshold},
                    onSelectionChanged: (set) {
                      if (set.isNotEmpty) {
                        _updateConfig(cfg.copyWith(rainChanceThreshold: set.first));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTempGroup(Color cardColor, ColorScheme colorScheme, AppLocalizations l10n) {
    final cfg = _currentConfig!;
    final useFahrenheit = GlobalData.useFahrenheit;
    final heatStr = useFahrenheit
        ? '${(cfg.heatThresholdC * 9 / 5 + 32).round()}°F'
        : '${cfg.heatThresholdC.round()}°C';
    final coldStr = useFahrenheit
        ? '${(cfg.coldThresholdC * 9 / 5 + 32).round()}°F'
        : '${cfg.coldThresholdC.round()}°C';

    return M3ECardColumn(
      innerRadius: 12.0,
      color: cardColor,
      children: [
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.orange.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.whatshot_rounded, color: Colors.orange, size: 22),
          ),
          title: Text(l10n.extremeHeatTitle),
          subtitle: Text(l10n.extremeHeatDesc(heatStr)),
          value: cfg.extremeHeat,
          onChanged: (val) => _updateConfig(cfg.copyWith(extremeHeat: val)),
        ),
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.lightBlue.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.ac_unit_rounded, color: Colors.lightBlue, size: 22),
          ),
          title: Text(l10n.coldSnapTitle),
          subtitle: Text(l10n.coldSnapDesc(coldStr)),
          value: cfg.coldSnap,
          onChanged: (val) => _updateConfig(cfg.copyWith(coldSnap: val)),
        ),
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.wb_sunny_rounded, color: Colors.amber, size: 22),
          ),
          title: Text(l10n.uvAlertTitle),
          subtitle: Text(l10n.uvAlertDesc(cfg.uvThreshold.toStringAsFixed(0))),
          value: cfg.uvAlert,
          onChanged: (val) => _updateConfig(cfg.copyWith(uvAlert: val)),
        ),
      ],
    );
  }

  Widget _buildAqiGroup(Color cardColor, ColorScheme colorScheme, AppLocalizations l10n) {
    final cfg = _currentConfig!;
    return M3ECardColumn(
      innerRadius: 12.0,
      color: cardColor,
      children: [
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.masks_rounded, color: colorScheme.onSecondaryContainer, size: 22),
          ),
          title: Text(l10n.airQualityTitle),
          subtitle: Text(l10n.airQualityDesc),
          value: cfg.aqiAlert,
          onChanged: (val) => _updateConfig(cfg.copyWith(aqiAlert: val)),
        ),
        if (cfg.aqiAlert) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sensitivity Level',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: SegmentedButton<int>(
                    showSelectedIcon: false,
                    segments: const [
                      ButtonSegment(value: 50, label: Text('> 50')),
                      ButtonSegment(value: 100, label: Text('> 100')),
                      ButtonSegment(value: 150, label: Text('> 150')),
                    ],
                    selected: {cfg.aqiThreshold},
                    onSelectionChanged: (set) {
                      if (set.isNotEmpty) {
                        _updateConfig(cfg.copyWith(aqiThreshold: set.first));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildBriefingGroup(Color cardColor, ColorScheme colorScheme, AppLocalizations l10n) {
    final cfg = _currentConfig!;
    final timeStr = _formatTime(cfg.dailyBriefingHour, cfg.dailyBriefingMinute);

    return M3ECardColumn(
      innerRadius: 12.0,
      color: cardColor,
      children: [
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.today_rounded, color: colorScheme.onTertiaryContainer, size: 22),
          ),
          title: Text(l10n.dailyBriefingTitle),
          subtitle: Text(l10n.dailyBriefingDesc),
          value: cfg.dailyBriefing,
          onChanged: (val) => _updateConfig(cfg.copyWith(dailyBriefing: val)),
        ),
        if (cfg.dailyBriefing) ...[
          ListTile(
            leading: const Icon(Icons.schedule_rounded),
            title: Text(l10n.briefingTime),
            trailing: Chip(
              label: Text(timeStr, style: const TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor: colorScheme.surfaceContainerHighest,
            ),
            onTap: _pickBriefingTime,
          ),
        ],
      ],
    );
  }

  Widget _buildQuietHoursGroup(Color cardColor, ColorScheme colorScheme, AppLocalizations l10n) {
    final cfg = _currentConfig!;
    final startStr = _formatHour(cfg.quietHoursStartHour);
    final endStr = _formatHour(cfg.quietHoursEndHour);

    return M3ECardColumn(
      innerRadius: 12.0,
      color: cardColor,
      children: [
        SwitchListTile(
          secondary: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.bedtime_rounded, color: colorScheme.onSurfaceVariant, size: 22),
          ),
          title: Text(l10n.quietHours),
          subtitle: Text(l10n.quietHoursDesc),
          value: cfg.quietHoursEnabled,
          onChanged: (val) => _updateConfig(cfg.copyWith(quietHoursEnabled: val)),
        ),
        if (cfg.quietHoursEnabled) ...[
          ListTile(
            leading: const Icon(Icons.nightlight_outlined),
            title: const Text('Mute Window'),
            subtitle: Text('$startStr to $endStr'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ActionChip(
                  label: Text(startStr),
                  onPressed: () => _pickQuietHoursTime(isStart: true),
                ),
                const SizedBox(width: 6),
                const Text('–'),
                const SizedBox(width: 6),
                ActionChip(
                  label: Text(endStr),
                  onPressed: () => _pickQuietHoursTime(isStart: false),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
