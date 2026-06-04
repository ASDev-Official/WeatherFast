import 'package:flutter/foundation.dart';

class GlobalData {
  static bool hasPreloaded = false;
  static Map<String, dynamic>? preloadedWeatherData;
  static Map<String, dynamic>? preloadedForecastData;
  static bool useFahrenheit = false;
  static double widgetFontScale = 1.0;
  static ValueNotifier<String?> languageCodeNotifier = ValueNotifier<String?>(null);
  static ValueNotifier<bool> performanceModeNotifier = ValueNotifier<bool>(false);
}
