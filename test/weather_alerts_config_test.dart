import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherfast/models/location_alert_config.dart';
import 'package:weatherfast/services/preferences_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('LocationAlertConfig Tests', () {
    test('Default values are correctly set', () {
      const config = LocationAlertConfig(
        locationId: 'current_location',
        locationName: 'Current Location',
      );

      expect(config.locationId, equals('current_location'));
      expect(config.locationName, equals('Current Location'));
      expect(config.enabled, isFalse);
      expect(config.floodAlerts, isTrue);
      expect(config.severeWeather, isTrue);
      expect(config.highWind, isTrue);
      expect(config.windSpeedThreshold, equals(50.0));
      expect(config.rainAlerts, isTrue);
      expect(config.rainChanceThreshold, equals(50));
      expect(config.extremeHeat, isFalse);
      expect(config.heatThresholdC, equals(33.0));
      expect(config.coldSnap, isFalse);
      expect(config.coldThresholdC, equals(10.0));
      expect(config.uvAlert, isFalse);
      expect(config.uvThreshold, equals(8.0));
      expect(config.aqiAlert, isFalse);
      expect(config.aqiThreshold, equals(100));
      expect(config.dailyBriefing, isFalse);
      expect(config.dailyBriefingHour, equals(8));
      expect(config.dailyBriefingMinute, equals(0));
      expect(config.quietHoursEnabled, isFalse);
      expect(config.quietHoursStartHour, equals(22));
      expect(config.quietHoursEndHour, equals(7));
    });

    test('Serialization to/from JSON preserves all properties', () {
      const original = LocationAlertConfig(
        locationId: 'singapore',
        locationName: 'Singapore',
        enabled: true,
        floodAlerts: true,
        severeWeather: true,
        highWind: true,
        windSpeedThreshold: 65.0,
        rainAlerts: true,
        rainChanceThreshold: 70,
        extremeHeat: true,
        heatThresholdC: 34.5,
        coldSnap: true,
        coldThresholdC: 18.0,
        uvAlert: true,
        uvThreshold: 11.0,
        aqiAlert: true,
        aqiThreshold: 150,
        dailyBriefing: true,
        dailyBriefingHour: 7,
        dailyBriefingMinute: 30,
        quietHoursEnabled: true,
        quietHoursStartHour: 23,
        quietHoursEndHour: 6,
      );

      final json = original.toJson();
      final restored = LocationAlertConfig.fromJson(json);

      expect(restored.locationId, equals(original.locationId));
      expect(restored.locationName, equals(original.locationName));
      expect(restored.enabled, equals(original.enabled));
      expect(restored.floodAlerts, equals(original.floodAlerts));
      expect(restored.severeWeather, equals(original.severeWeather));
      expect(restored.highWind, equals(original.highWind));
      expect(restored.windSpeedThreshold, equals(original.windSpeedThreshold));
      expect(restored.rainAlerts, equals(original.rainAlerts));
      expect(restored.rainChanceThreshold, equals(original.rainChanceThreshold));
      expect(restored.extremeHeat, equals(original.extremeHeat));
      expect(restored.heatThresholdC, equals(original.heatThresholdC));
      expect(restored.coldSnap, equals(original.coldSnap));
      expect(restored.coldThresholdC, equals(original.coldThresholdC));
      expect(restored.uvAlert, equals(original.uvAlert));
      expect(restored.uvThreshold, equals(original.uvThreshold));
      expect(restored.aqiAlert, equals(original.aqiAlert));
      expect(restored.aqiThreshold, equals(original.aqiThreshold));
      expect(restored.dailyBriefing, equals(original.dailyBriefing));
      expect(restored.dailyBriefingHour, equals(original.dailyBriefingHour));
      expect(restored.dailyBriefingMinute, equals(original.dailyBriefingMinute));
      expect(restored.quietHoursEnabled, equals(original.quietHoursEnabled));
      expect(restored.quietHoursStartHour, equals(original.quietHoursStartHour));
      expect(restored.quietHoursEndHour, equals(original.quietHoursEndHour));
    });

    test('copyWith properly overrides specific fields', () {
      const config = LocationAlertConfig(
        locationId: 'tokyo',
        locationName: 'Tokyo',
      );

      final updated = config.copyWith(
        enabled: true,
        rainChanceThreshold: 80,
        extremeHeat: true,
      );

      expect(updated.locationId, equals('tokyo'));
      expect(updated.enabled, isTrue);
      expect(updated.rainChanceThreshold, equals(80));
      expect(updated.extremeHeat, isTrue);
      expect(updated.floodAlerts, isTrue); // preserved
    });
  });

  group('PreferencesService Weather Alerts Persistence Tests', () {
    test('Onboarding prompt shown flag saves and loads', () async {
      expect(await PreferencesService.loadWeatherAlertsPromptShown(), isFalse);
      await PreferencesService.saveWeatherAlertsPromptShown(true);
      expect(await PreferencesService.loadWeatherAlertsPromptShown(), isTrue);
    });

    test('LocationAlertConfig persistence works per location', () async {
      const sgConfig = LocationAlertConfig(
        locationId: 'singapore',
        locationName: 'Singapore',
        enabled: true,
        rainChanceThreshold: 70,
      );

      const nyConfig = LocationAlertConfig(
        locationId: 'new_york',
        locationName: 'New York',
        enabled: false,
        coldSnap: true,
      );

      await PreferencesService.saveLocationAlertConfig(sgConfig);
      await PreferencesService.saveLocationAlertConfig(nyConfig);

      final loadedSg = await PreferencesService.loadLocationAlertConfig('singapore');
      final loadedNy = await PreferencesService.loadLocationAlertConfig('new_york');

      expect(loadedSg.enabled, isTrue);
      expect(loadedSg.rainChanceThreshold, equals(70));

      expect(loadedNy.enabled, isFalse);
      expect(loadedNy.coldSnap, isTrue);
    });

    test('Alert timestamps save and load correctly for cooldown tracking', () async {
      final now = DateTime.now();
      await PreferencesService.saveLastAlertTimestamp('singapore', 'flood', now);

      final loaded = await PreferencesService.loadLastAlertTimestamp('singapore', 'flood');
      expect(loaded, isNotNull);
      expect(loaded!.millisecondsSinceEpoch, equals(now.millisecondsSinceEpoch));

      final empty = await PreferencesService.loadLastAlertTimestamp('singapore', 'rain');
      expect(empty, isNull);
    });

    test('Last flood alert IDs save and load correctly', () async {
      await PreferencesService.saveLastFloodAlertIds(['Flash Flood Alert|Bukit Timah']);
      final ids = await PreferencesService.loadLastFloodAlertIds();
      expect(ids, contains('Flash Flood Alert|Bukit Timah'));
    });
  });
}
