import 'package:device_calendar_plus/device_calendar_plus.dart';
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
  static final DeviceCalendar _deviceCalendar = DeviceCalendar.instance;

  static Future<bool> requestPermissions() async {
    final status = await _deviceCalendar.requestPermissions();
    return status == CalendarPermissionStatus.granted ||
        status == CalendarPermissionStatus.writeOnly;
  }

  static Future<List<Calendar>> getCalendars() async {
    final hasPermissions = await requestPermissions();
    if (!hasPermissions) return [];
    
    try {
      return await _deviceCalendar.listCalendars();
    } catch (_) {
      return [];
    }
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

    try {
      final calendarEvents = await _deviceCalendar.listEvents(
        startDate,
        endDate,
        calendarIds: enabledIds,
      );

      for (var event in calendarEvents) {
        if (event.location != null && event.location!.trim().isNotEmpty) {
          events.add(CalendarEventItem(
            title: event.title.isNotEmpty ? event.title : 'Event',
            location: event.location!,
            startTime: event.startDate,
            endTime: event.endDate,
            description: event.description,
          ));
        }
      }
    } catch (_) {
      // Skip calendar retrieval errors defensively
    }

    events.sort((a, b) => a.startTime.compareTo(b.startTime));
    return events;
  }
}
