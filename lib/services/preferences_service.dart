import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _keyUseFahrenheit = 'use_fahrenheit';

  static Future<bool> loadUseFahrenheit() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyUseFahrenheit) ?? false;
  }

  static Future<void> saveUseFahrenheit(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyUseFahrenheit, value);
  }
}
