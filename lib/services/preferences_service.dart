import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _keyUseFahrenheit = 'use_fahrenheit';
  static const _keyLastLocationQuery = 'last_location_query';

  static Future<bool> loadUseFahrenheit() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyUseFahrenheit) ?? false;
  }

  static Future<void> saveUseFahrenheit(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyUseFahrenheit, value);
  }

  static Future<String?> loadLastLocationQuery() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_keyLastLocationQuery);
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
    await prefs.setString(_keyLastLocationQuery, trimmed);
  }
}
