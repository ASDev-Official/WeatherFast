import 'package:device_calendar/device_calendar.dart';
import 'preferences_service.dart';

class CalendarEventItem {
  final String title;
  final String location;
  final DateTime startTime;
  final DateTime? endTime;
  final String? description;

  CalendarEventItem({
    required this.title,
    required this.location,
    required this.startTime,
    this.endTime,
    this.description,
  });
}

class CalendarService {
  static final DeviceCalendarPlugin _deviceCalendarPlugin = DeviceCalendarPlugin();

  static Future<bool> requestPermissions() async {
    var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
    if (permissionsGranted.isSuccess && !permissionsGranted.data!) {
      permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
      if (!permissionsGranted.isSuccess || !permissionsGranted.data!) {
        return false;
      }
    }
    return true;
  }

  static Future<List<Calendar>> getCalendars() async {
    final hasPermissions = await requestPermissions();
    if (!hasPermissions) return [];
    
    final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
    return calendarsResult.data ?? [];
  }

  static Future<List<CalendarEventItem>> getTodayEventsWithLocation() async {
    final isEnabled = await PreferencesService.loadCalendarEnabled();
    if (!isEnabled) return [];

    final hasPermissions = await requestPermissions();
    if (!hasPermissions) return [];

    final enabledIds = await PreferencesService.loadEnabledCalendarIds();
    if (enabledIds.isEmpty) return [];

    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, now.day);
    final endDate = DateTime(now.year, now.month, now.day, 23, 59, 59).add(const Duration(days: 1));

    List<CalendarEventItem> events = [];

    for (String calendarId in enabledIds) {
      try {
        final eventsResult = await _deviceCalendarPlugin.retrieveEvents(
          calendarId,
          RetrieveEventsParams(startDate: startDate, endDate: endDate),
        );

        final calendarEvents = eventsResult.data;
        if (calendarEvents != null) {
          for (var event in calendarEvents) {
            if (event.location != null && event.location!.isNotEmpty) {
              events.add(CalendarEventItem(
                title: event.title ?? 'Event',
                location: event.location!,
                startTime: event.start ?? DateTime.now(),
                endTime: event.end,
                description: event.description,
              ));
            }
          }
        }
      } catch (_) {
        // Skip calendar retrieval errors defensively
      }
    }

    events.sort((a, b) => a.startTime.compareTo(b.startTime));
    return events;
  }
}
