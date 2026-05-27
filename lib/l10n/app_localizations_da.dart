// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get insights => 'Insights';

  @override
  String get settings => 'Settings';

  @override
  String get updatingWeather => 'Updating weather…';

  @override
  String get locationServicesDisabled =>
      'Location services are disabled. Enable them in Settings.';

  @override
  String get locationPermissionDenied =>
      'Location permission denied. Enable it to auto-locate you.';

  @override
  String get unableToFetchLocation =>
      'Unable to fetch location weather. Please try again.';

  @override
  String failedToLoadWeather(String error) {
    return 'Failed to load weather: $error';
  }

  @override
  String get searchPlace => 'Search a place';

  @override
  String get close => 'Close';

  @override
  String get cityRegionOrCoordinates => 'City, region, or coordinates';

  @override
  String get loadingLocation => 'Loading location…';

  @override
  String get searchLocation => 'Search location';

  @override
  String get useCurrentLocation => 'Use current location';

  @override
  String get clear => 'Clear';

  @override
  String get dummyTime => 'Mon, Jan 1 • 12:00 PM';

  @override
  String get daytime => 'Daytime';

  @override
  String get night => 'Night';

  @override
  String get dummyHighLow => 'H 80° · L 60°';

  @override
  String highLowTemp(String high, String low) {
    return 'H $high°  ·  L $low°';
  }

  @override
  String get feelsLike => 'Feels like';

  @override
  String get humidity => 'Humidity';

  @override
  String get wind => 'Wind';

  @override
  String get airQuality => 'Air Quality';

  @override
  String get visibility => 'Visibility';

  @override
  String get precipChance => 'Precip chance';

  @override
  String get hourlyForecast => 'Hourly Forecast';

  @override
  String get regionalOutlook => 'Regional Outlook';

  @override
  String get dataFromOpenMeteo => 'Data from Open-Meteo';

  @override
  String get dataFromNea => 'Data from NEA';

  @override
  String get todaysSuggestion => 'Today’s suggestion';

  @override
  String get adviceRain => 'Grab a light shell and keep moving.';

  @override
  String get adviceSnow => 'Layer up and mind slick paths.';

  @override
  String get adviceStorm => 'Stay indoors; lightning risk.';

  @override
  String get adviceClear => 'Great light outside. Sunglasses recommended.';

  @override
  String get adviceCloud => 'Soft clouds today—perfect walking weather.';

  @override
  String get adviceDefault =>
      'Stay comfortable and check again in a few hours.';

  @override
  String get futureAdviceRain =>
      'Rain likely in ~3 hours. Keep an umbrella nearby.';

  @override
  String get futureAdviceSnow =>
      'Snow later today—plan travel with extra time.';

  @override
  String get futureAdviceStorm =>
      'Storm window in a few hours. Wrap up outdoor tasks soon.';

  @override
  String get futureAdviceClear =>
      'Next few hours stay steady—good time to be outside.';

  @override
  String get today => 'Today';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String nextDays(int count) {
    return 'Next $count days';
  }

  @override
  String get weather => 'Weather';

  @override
  String precipPercent(String percent) {
    return '$percent% precip';
  }

  @override
  String toTime(String time) {
    return 'to $time';
  }

  @override
  String windSpeed(String speed, String dir) {
    return '$speed km/h $dir';
  }

  @override
  String visibilityKm(String dist) {
    return '$dist km';
  }
}
