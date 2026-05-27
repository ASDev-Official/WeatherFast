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

  @override
  String failedToLoadInsights(String error) {
    return 'Failed to load Insights: $error';
  }

  @override
  String get weatherInsights => 'Weather Insights';

  @override
  String get analyzingConditions => 'Analyzing conditions...';

  @override
  String get activitySuggestions => 'Activity Suggestions';

  @override
  String get healthAndSafety => 'Health & Safety';

  @override
  String get whatToWear => 'What to Wear';

  @override
  String get todaysTimeline => 'Today\'s Timeline';

  @override
  String get weekAhead => 'Week Ahead';

  @override
  String get selectLocationFromHome => 'Select a location from Home';

  @override
  String get toViewDetailedInsights => 'to view the detailed Insights';

  @override
  String get widgetsRefreshed => 'Widgets refreshed';

  @override
  String widgetRefreshFailed(String error) {
    return 'Widget refresh failed: $error';
  }

  @override
  String get language => 'Language';

  @override
  String get systemDefault => 'System Default';

  @override
  String get preferences => 'Preferences';

  @override
  String get useFahrenheit => 'Use Fahrenheit';

  @override
  String get showingFahrenheit => 'Showing °F';

  @override
  String get showingCelsius => 'Showing °C';

  @override
  String get about => 'About';

  @override
  String get openSourceLicenses => 'Open-Source Licenses';

  @override
  String get viewLicensesForOpenSourcePackages =>
      'View licenses for open-source packages';

  @override
  String usedInWeatherFastVersion(String version) {
    return ' used in WeatherFast $version';
  }

  @override
  String get debug => 'Debug';

  @override
  String get forceRefreshWidgets => 'Force refresh widgets';

  @override
  String get reloadWidgetDataWarning => 'Reload widget data (USE SPARINGLY!!!)';

  @override
  String get testRatingBottomSheet => 'Test Rating Bottom Sheet';

  @override
  String get simulateSuccessfulWeatherFetchTrigger =>
      'Simulate successful weather fetch trigger';

  @override
  String get resetRatingPreferences => 'Reset Rating Preferences';

  @override
  String get resetShownCountAndTimestamps => 'Reset shown count and timestamps';

  @override
  String get ratingPreferencesReset => 'Rating preferences reset';

  @override
  String get support => 'Support';

  @override
  String get systemStatus => 'System Status';

  @override
  String get checkOperationalStatusOfServices =>
      'Check the operational status of services';

  @override
  String get helpAndFeedback => 'Help & Feedback';

  @override
  String get getHelpOrSendFeedback => 'Get help or send feedback';

  @override
  String versionBuildNumber(String version, String buildNumber) {
    return 'Version $version ($buildNumber)';
  }

  @override
  String get featureRequest => 'Feature Request';

  @override
  String get suggestFeature => 'Suggest a new feature for WeatherFast';

  @override
  String get bugReport => 'Bug Report';

  @override
  String get reportBug => 'Report a bug or issue';

  @override
  String get notifications => 'Notifications';

  @override
  String get loadingNotificationTitle => 'Loading notification title...';

  @override
  String get loadingNotificationDesc => 'Loading notification description...';

  @override
  String failedToLoadNotifications(String error) {
    return 'Failed to load notifications: $error';
  }

  @override
  String errorLoadingNotifications(String error) {
    return 'Error loading notifications: $error';
  }

  @override
  String get retry => 'Retry';

  @override
  String get noNewNotifications => 'No new notifications';

  @override
  String get notificationTitle => 'Notification';

  @override
  String get couldNotOpenLink => 'Could not open link';

  @override
  String get openLink => 'Open Link';

  @override
  String get mapSettings => 'Map Settings';

  @override
  String get radarOpacity => 'Radar Opacity';

  @override
  String get dataSources => 'Data Sources';

  @override
  String get mapLayers => 'Map Layers:';

  @override
  String get baseMapsMapbox => 'Base maps are provided by Mapbox.';

  @override
  String get weatherData => 'Weather Data:';

  @override
  String get livePrecipitationRainviewer =>
      'Live precipitation radar layers are provided by RainViewer.';

  @override
  String get attribution => 'Attribution:';

  @override
  String get attributionText =>
      '© Mapbox, © OpenStreetMap contributors, © RainViewer.';

  @override
  String get weatherMap => 'Weather Map';

  @override
  String get loading => 'Loading...';

  @override
  String get enjoyingWeatherFast => 'Enjoying WeatherFast?';

  @override
  String get rateAppDescription =>
      'If you like using our app, please take a moment to rate it in the Play Store. Your support means the world to us!';

  @override
  String get rateNow => 'Rate Now';

  @override
  String get remindMeLater => 'Remind Me in 2 Days';

  @override
  String get noThanks => 'No Thanks';

  @override
  String neaAttribution(String date) {
    return 'Contains information from 2-hour Weather Forecast, 24-hour Weather Forecast, 4-day Weather Forecast, Air Temperature across Singapore, Rainfall across Singapore, Relative Humidity across Singapore, Relative Humidity across Singapore, Wind Speed across Singapore, and Pollutant Standards Index (PSI) accessed on $date from the National Environment Agency which is made available under the terms of the ';
  }

  @override
  String get sgOpenDataLicence => 'Singapore Open Data Licence version 1.0';

  @override
  String get weatherDataProvidedByOM => 'Weather data provided by Open-Meteo';

  @override
  String get neaWebsite => 'NEA Website';

  @override
  String get dataGovSg => 'Data.gov.sg';

  @override
  String get website => 'Website';

  @override
  String get apiDocs => 'API Docs';

  @override
  String get terms => 'Terms';

  @override
  String get loadingClearWeather => 'Clear';

  @override
  String get loadingTempF => '72°F';

  @override
  String get tapToViewInteractiveRadar => 'Tap to view interactive radar';

  @override
  String get weatherMapsUnavailableOnWeb => 'Weather Maps Unavailable on Web';

  @override
  String get interactiveWeatherRadarDescription =>
      'Interactive weather radar and high-resolution maps are optimized for our mobile experience.';

  @override
  String get getItOnPlayStore => 'Get it on Play Store';
}
