// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get home => 'Startseite';

  @override
  String get insights => 'Einsichten';

  @override
  String get settings => 'Einstellungen';

  @override
  String get updatingWeather => 'Aktualisiere Wetter…';

  @override
  String get locationServicesDisabled =>
      'Ortungsdienste sind deaktiviert. Bitte in den Einstellungen aktivieren.';

  @override
  String get locationPermissionDenied =>
      'Ortung abgelehnt. Bitte automatische Ortung erlauben.';

  @override
  String get unableToFetchLocation =>
      'Unable to fetch location weather. Please try again.';

  @override
  String failedToLoadWeather(String error) {
    return 'Wetter konnte nicht geladen werden: $error';
  }

  @override
  String get searchPlace => 'Ort suchen';

  @override
  String get close => 'Schließen';

  @override
  String get cityRegionOrCoordinates => 'Stadt, Region oder Koordinaten';

  @override
  String get loadingLocation => 'Lade Ort…';

  @override
  String get searchLocation => 'Ort suchen';

  @override
  String get useCurrentLocation => 'Aktuellen Standort verwenden';

  @override
  String get clear => 'Clear';

  @override
  String get dummyTime => 'Mon, 1. Jan • 12:00';

  @override
  String get daytime => 'Tag';

  @override
  String get night => 'Nacht';

  @override
  String get dummyHighLow => 'max 80° · min 60°';

  @override
  String highLowTemp(String high, String low) {
    return 'max $high°  ·  min $low°';
  }

  @override
  String get feelsLike => 'Gefühlt';

  @override
  String get humidity => 'Luftfeuchtigkeit';

  @override
  String get wind => 'Wind';

  @override
  String get airQuality => 'Luftqualität';

  @override
  String get visibility => 'Sichtbarkeit';

  @override
  String get precipChance => 'Niederschlagswahrscheinlichkeit';

  @override
  String get hourlyForecast => 'Stündliche Vorhersage';

  @override
  String get regionalOutlook => 'Regional Outlook';

  @override
  String get dataFromOpenMeteo => 'Daten von Open-Meteo';

  @override
  String get dataFromNea => 'Daten von NEA';

  @override
  String get todaysSuggestion => 'Heutiger Vorschlag';

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
  String get today => 'Heute';

  @override
  String get tomorrow => 'Morgen';

  @override
  String nextDays(int count) {
    return 'Nächste $count Tage';
  }

  @override
  String get weather => 'Wetter';

  @override
  String precipPercent(String percent) {
    return '$percent% Niederschlag';
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
