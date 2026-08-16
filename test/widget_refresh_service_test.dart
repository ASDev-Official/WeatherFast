import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherfast/services/preferences_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('WidgetRefreshService and Preferences Tests', () {
    test('PreferencesService saves and loads last location query for background fallback', () async {
      await PreferencesService.saveLastLocationQuery('1.3521,103.8198');
      final query = await PreferencesService.loadLastLocationQuery();
      expect(query, equals('1.3521,103.8198'));
    });

    test('PreferencesService loads default widget location as Current Location', () async {
      final widgetLoc = await PreferencesService.loadWidgetLocation();
      expect(widgetLoc, equals('Current Location'));
    });

    test('PreferencesService saves and loads custom widget location', () async {
      await PreferencesService.saveWidgetLocation('London, United Kingdom');
      final widgetLoc = await PreferencesService.loadWidgetLocation();
      expect(widgetLoc, equals('London, United Kingdom'));
    });

    test('PreferencesService handles unit settings persistence for background isolates', () async {
      await PreferencesService.saveUseFahrenheit(true);
      await PreferencesService.saveWindUnit('mph');
      await PreferencesService.saveVisibilityUnit('miles');
      await PreferencesService.saveWidgetFontScale(1.2);

      expect(await PreferencesService.loadUseFahrenheit(), isTrue);
      expect(await PreferencesService.loadWindUnit(), equals('mph'));
      expect(await PreferencesService.loadVisibilityUnit(), equals('miles'));
      expect(await PreferencesService.loadWidgetFontScale(), equals(1.2));
    });
  });
}
