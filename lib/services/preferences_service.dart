import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _kUseFahrenheit = 'use_fahrenheit';
  static const String _kLastLocationQuery = 'last_location_query';
  static const String _kMapDarkMode = 'map_dark_mode';
  static const String _kMapRadarOpacity = 'map_radar_opacity';
  static const String _kIsSingapore = 'is_singapore';
  static const String _kLanguageCode = 'language_code';
  static const String _kPerformanceMode = 'performance_mode';
  static const String _kWindUnit = 'wind_unit';
  static const String _kVisibilityUnit = 'visibility_unit';
  static const String _kCalendarEnabled = 'calendar_enabled';
  static const String _kEnabledCalendarIds = 'enabled_calendar_ids';
  static const String _kCalendarPromoShown = 'calendar_promo_shown';

  static Future<bool> loadCalendarPromoShown() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kCalendarPromoShown) ?? false;
  }

  static Future<void> saveCalendarPromoShown(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kCalendarPromoShown, value);
  }

  static Future<bool> loadCalendarEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kCalendarEnabled) ?? false;
  }

  static Future<void> saveCalendarEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kCalendarEnabled, value);
  }

  static Future<List<String>> loadEnabledCalendarIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_kEnabledCalendarIds) ?? [];
  }

  static Future<void> saveEnabledCalendarIds(List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_kEnabledCalendarIds, value);
  }

  static Future<bool> loadPerformanceMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kPerformanceMode) ?? false;
  }

  static Future<void> savePerformanceMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kPerformanceMode, value);
  }

  static Future<bool> loadIsSingapore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kIsSingapore) ?? false;
  }

  static Future<void> saveIsSingapore(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kIsSingapore, value);
  }

  static Future<bool> loadUseFahrenheit() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kUseFahrenheit) ?? false;
  }

  static Future<void> saveUseFahrenheit(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kUseFahrenheit, value);
  }

  static Future<String?> loadLastLocationQuery() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_kLastLocationQuery);
    if (value == null || value.isEmpty) {
      return null;
    }
    return value;
  }

  static Future<void> saveLastLocationQuery(String value) async {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLastLocationQuery, trimmed);
  }

  static Future<bool> loadMapDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kMapDarkMode) ?? true;
  }

  static Future<void> saveMapDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kMapDarkMode, value);
  }

  static Future<double> loadMapRadarOpacity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_kMapRadarOpacity) ?? 0.7;
  }

  static Future<void> saveMapRadarOpacity(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_kMapRadarOpacity, value);
  }

  static Future<double> loadWidgetFontScale() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('widget_font_scale') ?? 1.0;
  }

  static Future<void> saveWidgetFontScale(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('widget_font_scale', value);
  }

  static Future<String?> loadLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kLanguageCode);
  }

  static Future<void> saveLanguageCode(String? value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value == null) {
      await prefs.remove(_kLanguageCode);
    } else {
      await prefs.setString(_kLanguageCode, value);
    }
  }

  static Future<String> loadWindUnit() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kWindUnit) ?? 'km/h';
  }

  static Future<void> saveWindUnit(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kWindUnit, value);
  }

  static Future<String> loadVisibilityUnit() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kVisibilityUnit) ?? 'km';
  }

  static Future<void> saveVisibilityUnit(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kVisibilityUnit, value);
  }

  static Future<String> loadMeetingType(String eventKey) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('meeting_type_$eventKey') ?? 'outdoor';
  }

  static Future<void> saveMeetingType(String eventKey, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('meeting_type_$eventKey', value);
  }

  static const String _kSavedLocations = 'saved_locations_list';

  static Future<List<String>> loadSavedLocations() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_kSavedLocations) ?? [];
  }

  static Future<void> saveSavedLocations(List<String> locations) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_kSavedLocations, locations);
  }
}

