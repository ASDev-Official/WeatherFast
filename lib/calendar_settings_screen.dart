import 'package:flutter/material.dart';
import 'package:m3e_core/m3e_core.dart';
import 'services/preferences_service.dart';
import 'services/calendar_service.dart';
import 'package:device_calendar/device_calendar.dart';
import 'l10n/app_localizations.dart';

class CalendarSettingsScreen extends StatefulWidget {
  const CalendarSettingsScreen({super.key});

  @override
  State<CalendarSettingsScreen> createState() => _CalendarSettingsScreenState();
}

class _CalendarSettingsScreenState extends State<CalendarSettingsScreen> {
  bool _isEnabled = false;
  List<String> _enabledCalendarIds = [];
  List<Calendar> _calendars = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _isEnabled = await PreferencesService.loadCalendarEnabled();
    _enabledCalendarIds = await PreferencesService.loadEnabledCalendarIds();
    
    if (_isEnabled) {
      await _fetchCalendars();
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchCalendars() async {
    setState(() {
      _isLoading = true;
    });
    
    final calendars = await CalendarService.getCalendars();
    
    setState(() {
      _calendars = calendars;
      _isLoading = false;
    });
  }

  Future<void> _toggleEnabled(bool value) async {
    if (value) {
      final hasPermissions = await CalendarService.requestPermissions();
      if (!hasPermissions) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Calendar permission denied.')),
          );
        }
        return;
      }
    }

    await PreferencesService.saveCalendarEnabled(value);
    setState(() {
      _isEnabled = value;
    });
    
    if (value) {
      await _fetchCalendars();
    }
  }

  Future<void> _toggleCalendar(String id, bool value) async {
    setState(() {
      if (value) {
        if (!_enabledCalendarIds.contains(id)) {
          _enabledCalendarIds.add(id);
        }
      } else {
        _enabledCalendarIds.remove(id);
      }
    });
    await PreferencesService.saveEnabledCalendarIds(_enabledCalendarIds);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cardColor = ElevationOverlay.applySurfaceTint(
      Theme.of(context).cardTheme.color ?? Theme.of(context).colorScheme.surface,
      Theme.of(context).cardTheme.surfaceTintColor,
      Theme.of(context).cardTheme.elevation ?? 2.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.calendarSettingsTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month_rounded, color: colorScheme.onSecondaryContainer),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.calendarSettingsSubtitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.calendarSettingsDescription,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          M3ECardColumn(
            innerRadius: 12.0,
            color: cardColor,
            children: [
              SwitchListTile(
                title: Text(AppLocalizations.of(context)!.enableChoreographer),
                subtitle: Text(AppLocalizations.of(context)!.showWeatherForCalendarEvents),
                value: _isEnabled,
                onChanged: _toggleEnabled,
              ),
            ],
          ),
          if (_isEnabled) ...[
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)!.selectCalendars,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_calendars.isEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(AppLocalizations.of(context)!.noCalendarsFound),
              )
            else
              M3ECardColumn(
                innerRadius: 12.0,
                color: cardColor,
                children: _calendars.map((calendar) {
                  return SwitchListTile(
                    title: Text(calendar.name ?? AppLocalizations.of(context)!.unnamedCalendar),
                    subtitle: Text(calendar.accountName ?? ''),
                    value: _enabledCalendarIds.contains(calendar.id),
                    onChanged: (value) => _toggleCalendar(calendar.id ?? '', value),
                  );
                }).toList(),
              ),
          ],
        ],
      ),
    );
  }
}
