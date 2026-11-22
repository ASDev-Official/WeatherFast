import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:weatherfast/time_utils.dart';

void main() {
  setUpAll(() async {
    await TimeUtils.initialize();
  });

  group('Alberta timezone tests', () {
    test('America/Edmonton follows permanent UTC-6 in November 2026', () {
      final loc = tz.getLocation('America/Edmonton');
      // Nov 21, 2026 UTC
      final date = tz.TZDateTime(loc, 2026, 11, 21, 15, 59);
      expect(date.timeZoneOffset.inHours, equals(-6));
    });

    test('TimeUtils.getLocalTime handles America/Edmonton', () {
      final localTime = TimeUtils.getLocalTime('America/Edmonton');
      expect(localTime.timeZoneOffset.inHours, equals(-6));
    });

    test('Date formatting with EEE, MMM d produces short day and fits expected pattern', () {
      final sample = DateTime(2026, 11, 21, 15, 59);
      final formatted = '${DateFormat('EEE, MMM d').format(sample)} • ${DateFormat('h:mm a').format(sample)}';
      expect(formatted, equals('Sat, Nov 21 • 3:59 PM'));
    });
  });
}
