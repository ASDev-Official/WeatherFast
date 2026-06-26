// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

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
  String get uvIndex => 'UV Index';

  @override
  String get dewPoint => 'Dew Point';

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

  @override
  String get multipleFloodAlerts => 'Multiple Flood Alerts';

  @override
  String activeWarnings(int count) {
    return '$count active warnings';
  }

  @override
  String get tapToViewAllAlerts => 'Tap to view all alerts';

  @override
  String get activeFloodAlerts => 'Active Flood Alerts';

  @override
  String get area => 'Area';

  @override
  String get description => 'Description';

  @override
  String get instruction => 'Instruction';

  @override
  String get severity => 'Severity';

  @override
  String get response => 'Response';

  @override
  String get flashFloodWarning => 'Flash Flood Warning!';

  @override
  String get floodAlert => 'Flood Alert';

  @override
  String incompleteLocalisationMessage(String language) {
    return 'The localization for the language $language has not been completed.';
  }

  @override
  String get helpLocalizeWeatherFast => 'Help localize WeatherFast';

  @override
  String get ok => 'OK';

  @override
  String get notificationsTooltip => 'Notifications';

  @override
  String get units => 'Units';

  @override
  String get temperatureWindVisibility => 'Temperature, Wind, Visibility';

  @override
  String get temperature => 'Temperature';

  @override
  String get celsius => 'Celsius (°C)';

  @override
  String get fahrenheit => 'Fahrenheit (°F)';

  @override
  String get windSpeedLabel => 'Wind Speed';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get unitMs => 'm/s';

  @override
  String get unitKnots => 'knots';

  @override
  String get unitKilometers => 'Kilometers (km)';

  @override
  String get unitMiles => 'Miles (mi)';

  @override
  String get performanceMode => 'Performance Mode';

  @override
  String get disableExtraVisualEffects => 'Disable extra visual effects';

  @override
  String get bestTimesTitle => 'Best Times';

  @override
  String get insightsActivityLimitOutdoorTitle => 'Limit Outdoor Effort';

  @override
  String get insightsActivityLimitOutdoorDesc =>
      'Air quality is poor—favor light or indoor activities';

  @override
  String get insightsActivityIndoorTitle => 'Indoor Activities';

  @override
  String get insightsActivityIndoorDesc =>
      'Visit museums, cafes, or indoor entertainment';

  @override
  String get insightsActivityCyclingTitle => 'Perfect for Cycling';

  @override
  String get insightsActivityCyclingDesc =>
      'Great weather for a bike ride—mild temps and clear skies';

  @override
  String get insightsActivityOutdoorSportsTitle => 'Outdoor Sports';

  @override
  String get insightsActivityOutdoorSportsDesc =>
      'Ideal conditions for outdoor activities and sports';

  @override
  String get insightsActivityBeachTitle => 'Beach Day';

  @override
  String get insightsActivityBeachDesc =>
      'Perfect beach weather—bring sunscreen!';

  @override
  String get insightsActivityHikingTitle => 'Hiking Weather';

  @override
  String get insightsActivityHikingDesc =>
      'Cool and comfortable for a nature walk';

  @override
  String get insightsActivityGeneralTitle => 'General Activities';

  @override
  String get insightsActivityGeneralDesc => 'Moderate weather—plan accordingly';

  @override
  String get insightsHealthAirQualityTitle => 'Air Quality Alert';

  @override
  String get insightsHealthAirQualityDesc =>
      'Consider a mask outdoors and limit intense activity until air improves.';

  @override
  String get insightsHealthUVTitle => 'UV Protection Critical';

  @override
  String get insightsHealthUVDesc =>
      'Apply SPF 30+ sunscreen every 2 hours. Wear sunglasses and a hat.';

  @override
  String get insightsHealthHeatTitle => 'Stay Hydrated';

  @override
  String get insightsHealthHeatDesc =>
      'Drink water regularly. Avoid prolonged sun exposure 11am-3pm.';

  @override
  String get insightsHealthColdTitle => 'Cold Weather Alert';

  @override
  String get insightsHealthColdDesc =>
      'Watch for frostbite. Layer clothing and cover extremities.';

  @override
  String get insightsHealthWindTitle => 'Wind Advisory';

  @override
  String get insightsHealthWindDesc =>
      'Secure loose items. Be cautious when driving.';

  @override
  String get insightsHealthOptimalTitle => 'Optimal Conditions';

  @override
  String get insightsHealthOptimalDesc =>
      'Perfect weather for physical activity and outdoor time.';

  @override
  String get insightsClothingHot =>
      'Light, breathable clothing. Hat and sunglasses recommended.';

  @override
  String get insightsClothingWarm =>
      'Comfortable summer wear. Light layers for morning/evening.';

  @override
  String get insightsClothingMild =>
      'Long sleeves or light jacket recommended.';

  @override
  String get insightsClothingCool =>
      'Jacket or sweater needed. Long pants suggested.';

  @override
  String get insightsClothingCold =>
      'Warm jacket essential. Layer up for comfort.';

  @override
  String get insightsClothingFreeze =>
      'Heavy winter coat, gloves, and warm layers required.';

  @override
  String get insightsClothingRainSuffix => ' Bring waterproof gear.';

  @override
  String get insightsHourlyMorning => 'Morning';

  @override
  String get insightsHourlyAfternoon => 'Afternoon';

  @override
  String get insightsHourlyEvening => 'Evening';

  @override
  String get insightsHourlyMorningChilly => 'Chilly start—extra layer needed';

  @override
  String get insightsHourlyMorningComfort => 'Comfortable morning temperatures';

  @override
  String get insightsHourlyAfternoonHot => 'Peak heat—seek shade';

  @override
  String get insightsHourlyAfternoonPleasant => 'Pleasant afternoon expected';

  @override
  String get insightsHourlyEveningCool => 'Cool evening—bring a jacket';

  @override
  String get insightsHourlyEveningMild => 'Mild evening conditions';

  @override
  String get insightsWeekLimitedData => 'Limited forecast data available';

  @override
  String get insightsWeekDataUnavailable => 'Forecast data unavailable';

  @override
  String insightsWeekVariableSwing(String swing) {
    return 'Variable week ahead with $swing°C temperature swing. ';
  }

  @override
  String get insightsWeekStable =>
      'Stable conditions expected with consistent temperatures. ';

  @override
  String get insightsWeekWarm => 'Generally warm throughout the week.';

  @override
  String get insightsWeekCool => 'Cool weather pattern persisting.';

  @override
  String get insightsWeekModerate => 'Moderate temperatures prevailing.';

  @override
  String get insightsBestTimeSingapore => 'Best Time: 7-9 AM & 5-8 PM';

  @override
  String get insightsBestTimeSingaporeDesc =>
      'Optimal conditions for outdoor activities in Singapore';

  @override
  String get insightsBestTimeNoData => 'No data';

  @override
  String get insightsBestTimeNoDataDesc => 'Unable to determine best times';

  @override
  String get insightsBestTimeLimited => 'Limited data';

  @override
  String get insightsBestTimeLimitedDesc => 'Hourly data unavailable';

  @override
  String insightsBestTimeAt(String time) {
    return 'Best Time: $time';
  }

  @override
  String get insightsBestTimeDesc =>
      'Optimal conditions for outdoor activities';

  @override
  String insightsTimeAM(String hour) {
    return '$hour AM';
  }

  @override
  String insightsTimePM(String hour) {
    return '$hour PM';
  }

  @override
  String get insightsTimeNoon => '12 PM';

  @override
  String get insightsRecRain => '☔ Bring an umbrella—rain likely';

  @override
  String get insightsRecHeatHigh => '🌡️ Stay hydrated—heat warning';

  @override
  String get insightsRecHeatMid => '☀️ Apply sunscreen';

  @override
  String get insightsRecCold => '🧊 Bundle up—cold weather ahead';

  @override
  String get insightsRecWind => '💨 Secure loose items—strong winds';

  @override
  String get insightsRecUV => '🛡️ High UV—protect your skin';

  @override
  String get insightsRecAir => '😷 Air quality is poor—limit outdoor exertion';

  @override
  String get insightsRecWarming => '📈 Warming trend—dress in layers';

  @override
  String get insightsRecCooling => '📉 Cooling trend ahead';

  @override
  String get insightsRecPleasant => '✨ Pleasant weather expected';

  @override
  String get insightsSummaryAllClear =>
      'All systems go—great conditions ahead!';

  @override
  String get insightsSummaryRain => 'Rainy day incoming—prepare accordingly';

  @override
  String get insightsSummaryHeat => 'Hot and intense—stay cool';

  @override
  String get insightsSummaryCold => 'Frigid conditions—bundle up';

  @override
  String get insightsSummaryWind => 'Windy day—hold onto your hat';

  @override
  String get insightsSummaryUV => 'Strong UV—protect yourself';

  @override
  String get insightsSummaryAir => 'Air quality is poor—take it easy outside';

  @override
  String get insightsSummaryVariable => 'Variable conditions expected';
}
