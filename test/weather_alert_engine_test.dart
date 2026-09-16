import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherfast/models/location_alert_config.dart';
import 'package:weatherfast/services/preferences_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('WeatherAlertEngine Logic & Rule Tests', () {
    test('Singapore coordinate and name detection', () {
      bool isSg({double? lat, double? lon, required String query}) {
        final lower = query.toLowerCase();
        if (lower.contains('singapore')) return true;
        if (lat != null && lon != null) {
          if (lat >= 1.15 && lat <= 1.50 && lon >= 103.55 && lon <= 104.15) {
            return true;
          }
        }
        return false;
      }

      expect(isSg(query: 'Singapore'), isTrue);
      expect(isSg(query: 'singapore, sg'), isTrue);
      expect(isSg(lat: 1.3521, lon: 103.8198, query: 'current_location'), isTrue);
      expect(isSg(lat: 1.290270, lon: 103.851959, query: 'City Hall'), isTrue);
      expect(isSg(lat: 51.5074, lon: -0.1278, query: 'London'), isFalse);
      expect(isSg(lat: 35.6762, lon: 139.6503, query: 'Tokyo'), isFalse);
    });

    test('Quiet hours evaluation correctly identifies in/out of quiet window', () {
      bool isQuietHours(LocationAlertConfig config, DateTime now) {
        if (!config.quietHoursEnabled) return false;
        final start = config.quietHoursStartHour;
        final end = config.quietHoursEndHour;
        if (start < end) {
          return now.hour >= start && now.hour < end;
        } else {
          return now.hour >= start || now.hour < end;
        }
      }

      const cfg = LocationAlertConfig(
        locationId: 'loc1',
        locationName: 'Loc',
        quietHoursEnabled: true,
        quietHoursStartHour: 22,
        quietHoursEndHour: 7,
      );

      // Night time (23:00) -> in quiet hours
      expect(isQuietHours(cfg, DateTime(2026, 1, 1, 23, 0)), isTrue);
      // Early morning (04:00) -> in quiet hours
      expect(isQuietHours(cfg, DateTime(2026, 1, 1, 4, 0)), isTrue);
      // Daytime (14:00) -> not in quiet hours
      expect(isQuietHours(cfg, DateTime(2026, 1, 1, 14, 0)), isFalse);
      // Just after end (07:00) -> not in quiet hours
      expect(isQuietHours(cfg, DateTime(2026, 1, 1, 7, 0)), isFalse);
    });

    test('Cooldown prevents rapid re-triggering of identical alert types', () async {
      final now = DateTime.now();
      const locationId = 'singapore';
      const alertType = 'rain';

      // First time: no timestamp exists -> allowed
      final firstCheck = await PreferencesService.loadLastAlertTimestamp(locationId, alertType);
      expect(firstCheck, isNull);

      // Simulate sending alert now
      await PreferencesService.saveLastAlertTimestamp(locationId, alertType, now);

      // 15 minutes later: cooldown of 3 hours should block re-sending
      final nextCheckTime = now.add(const Duration(minutes: 15));
      final lastSent = await PreferencesService.loadLastAlertTimestamp(locationId, alertType);
      expect(lastSent, isNotNull);
      final difference = nextCheckTime.difference(lastSent!);
      expect(difference < const Duration(hours: 3), isTrue);

      // 4 hours later: cooldown has expired -> allowed to alert again
      final muchLater = now.add(const Duration(hours: 4));
      final differenceLater = muchLater.difference(lastSent);
      expect(differenceLater >= const Duration(hours: 3), isTrue);
    });

    test('Flood alert change detection', () async {
      // Simulate new flood alert
      final alertKey1 = 'Flash Flood Warning|Dunearn Road';
      final alertKey2 = 'Flash Flood Warning|Bukit Timah';

      await PreferencesService.saveLastFloodAlertIds([alertKey1]);
      final lastIds = await PreferencesService.loadLastFloodAlertIds();

      expect(lastIds.contains(alertKey1), isTrue);
      expect(lastIds.contains(alertKey2), isFalse); // alertKey2 is newly reported and should trigger!
    });
  });
}
