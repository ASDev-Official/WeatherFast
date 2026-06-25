import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tl.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('da'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('ms'),
    Locale('nb'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sv'),
    Locale('th'),
    Locale('tl'),
    Locale('tr'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @insights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get insights;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @updatingWeather.
  ///
  /// In en, this message translates to:
  /// **'Updating weather…'**
  String get updatingWeather;

  /// No description provided for @locationServicesDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled. Enable them in Settings.'**
  String get locationServicesDisabled;

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied. Enable it to auto-locate you.'**
  String get locationPermissionDenied;

  /// No description provided for @unableToFetchLocation.
  ///
  /// In en, this message translates to:
  /// **'Unable to fetch location weather. Please try again.'**
  String get unableToFetchLocation;

  /// No description provided for @failedToLoadWeather.
  ///
  /// In en, this message translates to:
  /// **'Failed to load weather: {error}'**
  String failedToLoadWeather(String error);

  /// No description provided for @searchPlace.
  ///
  /// In en, this message translates to:
  /// **'Search a place'**
  String get searchPlace;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @cityRegionOrCoordinates.
  ///
  /// In en, this message translates to:
  /// **'City, region, or coordinates'**
  String get cityRegionOrCoordinates;

  /// No description provided for @loadingLocation.
  ///
  /// In en, this message translates to:
  /// **'Loading location…'**
  String get loadingLocation;

  /// No description provided for @searchLocation.
  ///
  /// In en, this message translates to:
  /// **'Search location'**
  String get searchLocation;

  /// No description provided for @useCurrentLocation.
  ///
  /// In en, this message translates to:
  /// **'Use current location'**
  String get useCurrentLocation;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @dummyTime.
  ///
  /// In en, this message translates to:
  /// **'Mon, Jan 1 • 12:00 PM'**
  String get dummyTime;

  /// No description provided for @daytime.
  ///
  /// In en, this message translates to:
  /// **'Daytime'**
  String get daytime;

  /// No description provided for @night.
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get night;

  /// No description provided for @dummyHighLow.
  ///
  /// In en, this message translates to:
  /// **'H 80° · L 60°'**
  String get dummyHighLow;

  /// No description provided for @highLowTemp.
  ///
  /// In en, this message translates to:
  /// **'H {high}°  ·  L {low}°'**
  String highLowTemp(String high, String low);

  /// No description provided for @feelsLike.
  ///
  /// In en, this message translates to:
  /// **'Feels like'**
  String get feelsLike;

  /// No description provided for @humidity.
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get humidity;

  /// No description provided for @uvIndex.
  ///
  /// In en, this message translates to:
  /// **'UV Index'**
  String get uvIndex;

  /// No description provided for @dewPoint.
  ///
  /// In en, this message translates to:
  /// **'Dew Point'**
  String get dewPoint;

  /// No description provided for @wind.
  ///
  /// In en, this message translates to:
  /// **'Wind'**
  String get wind;

  /// No description provided for @airQuality.
  ///
  /// In en, this message translates to:
  /// **'Air Quality'**
  String get airQuality;

  /// No description provided for @visibility.
  ///
  /// In en, this message translates to:
  /// **'Visibility'**
  String get visibility;

  /// No description provided for @precipChance.
  ///
  /// In en, this message translates to:
  /// **'Precip chance'**
  String get precipChance;

  /// No description provided for @hourlyForecast.
  ///
  /// In en, this message translates to:
  /// **'Hourly Forecast'**
  String get hourlyForecast;

  /// No description provided for @regionalOutlook.
  ///
  /// In en, this message translates to:
  /// **'Regional Outlook'**
  String get regionalOutlook;

  /// No description provided for @dataFromOpenMeteo.
  ///
  /// In en, this message translates to:
  /// **'Data from Open-Meteo'**
  String get dataFromOpenMeteo;

  /// No description provided for @dataFromNea.
  ///
  /// In en, this message translates to:
  /// **'Data from NEA'**
  String get dataFromNea;

  /// No description provided for @todaysSuggestion.
  ///
  /// In en, this message translates to:
  /// **'Today’s suggestion'**
  String get todaysSuggestion;

  /// No description provided for @adviceRain.
  ///
  /// In en, this message translates to:
  /// **'Grab a light shell and keep moving.'**
  String get adviceRain;

  /// No description provided for @adviceSnow.
  ///
  /// In en, this message translates to:
  /// **'Layer up and mind slick paths.'**
  String get adviceSnow;

  /// No description provided for @adviceStorm.
  ///
  /// In en, this message translates to:
  /// **'Stay indoors; lightning risk.'**
  String get adviceStorm;

  /// No description provided for @adviceClear.
  ///
  /// In en, this message translates to:
  /// **'Great light outside. Sunglasses recommended.'**
  String get adviceClear;

  /// No description provided for @adviceCloud.
  ///
  /// In en, this message translates to:
  /// **'Soft clouds today—perfect walking weather.'**
  String get adviceCloud;

  /// No description provided for @adviceDefault.
  ///
  /// In en, this message translates to:
  /// **'Stay comfortable and check again in a few hours.'**
  String get adviceDefault;

  /// No description provided for @futureAdviceRain.
  ///
  /// In en, this message translates to:
  /// **'Rain likely in ~3 hours. Keep an umbrella nearby.'**
  String get futureAdviceRain;

  /// No description provided for @futureAdviceSnow.
  ///
  /// In en, this message translates to:
  /// **'Snow later today—plan travel with extra time.'**
  String get futureAdviceSnow;

  /// No description provided for @futureAdviceStorm.
  ///
  /// In en, this message translates to:
  /// **'Storm window in a few hours. Wrap up outdoor tasks soon.'**
  String get futureAdviceStorm;

  /// No description provided for @futureAdviceClear.
  ///
  /// In en, this message translates to:
  /// **'Next few hours stay steady—good time to be outside.'**
  String get futureAdviceClear;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// No description provided for @nextDays.
  ///
  /// In en, this message translates to:
  /// **'Next {count} days'**
  String nextDays(int count);

  /// No description provided for @weather.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get weather;

  /// No description provided for @precipPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}% precip'**
  String precipPercent(String percent);

  /// No description provided for @toTime.
  ///
  /// In en, this message translates to:
  /// **'to {time}'**
  String toTime(String time);

  /// No description provided for @windSpeed.
  ///
  /// In en, this message translates to:
  /// **'{speed} km/h {dir}'**
  String windSpeed(String speed, String dir);

  /// No description provided for @visibilityKm.
  ///
  /// In en, this message translates to:
  /// **'{dist} km'**
  String visibilityKm(String dist);

  /// No description provided for @failedToLoadInsights.
  ///
  /// In en, this message translates to:
  /// **'Failed to load Insights: {error}'**
  String failedToLoadInsights(String error);

  /// No description provided for @weatherInsights.
  ///
  /// In en, this message translates to:
  /// **'Weather Insights'**
  String get weatherInsights;

  /// No description provided for @analyzingConditions.
  ///
  /// In en, this message translates to:
  /// **'Analyzing conditions...'**
  String get analyzingConditions;

  /// No description provided for @activitySuggestions.
  ///
  /// In en, this message translates to:
  /// **'Activity Suggestions'**
  String get activitySuggestions;

  /// No description provided for @healthAndSafety.
  ///
  /// In en, this message translates to:
  /// **'Health & Safety'**
  String get healthAndSafety;

  /// No description provided for @whatToWear.
  ///
  /// In en, this message translates to:
  /// **'What to Wear'**
  String get whatToWear;

  /// No description provided for @todaysTimeline.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Timeline'**
  String get todaysTimeline;

  /// No description provided for @weekAhead.
  ///
  /// In en, this message translates to:
  /// **'Week Ahead'**
  String get weekAhead;

  /// No description provided for @selectLocationFromHome.
  ///
  /// In en, this message translates to:
  /// **'Select a location from Home'**
  String get selectLocationFromHome;

  /// No description provided for @toViewDetailedInsights.
  ///
  /// In en, this message translates to:
  /// **'to view the detailed Insights'**
  String get toViewDetailedInsights;

  /// No description provided for @widgetsRefreshed.
  ///
  /// In en, this message translates to:
  /// **'Widgets refreshed'**
  String get widgetsRefreshed;

  /// No description provided for @widgetRefreshFailed.
  ///
  /// In en, this message translates to:
  /// **'Widget refresh failed: {error}'**
  String widgetRefreshFailed(String error);

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @useFahrenheit.
  ///
  /// In en, this message translates to:
  /// **'Use Fahrenheit'**
  String get useFahrenheit;

  /// No description provided for @showingFahrenheit.
  ///
  /// In en, this message translates to:
  /// **'Showing °F'**
  String get showingFahrenheit;

  /// No description provided for @showingCelsius.
  ///
  /// In en, this message translates to:
  /// **'Showing °C'**
  String get showingCelsius;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @openSourceLicenses.
  ///
  /// In en, this message translates to:
  /// **'Open-Source Licenses'**
  String get openSourceLicenses;

  /// No description provided for @viewLicensesForOpenSourcePackages.
  ///
  /// In en, this message translates to:
  /// **'View licenses for open-source packages'**
  String get viewLicensesForOpenSourcePackages;

  /// No description provided for @usedInWeatherFastVersion.
  ///
  /// In en, this message translates to:
  /// **' used in WeatherFast {version}'**
  String usedInWeatherFastVersion(String version);

  /// No description provided for @debug.
  ///
  /// In en, this message translates to:
  /// **'Debug'**
  String get debug;

  /// No description provided for @forceRefreshWidgets.
  ///
  /// In en, this message translates to:
  /// **'Force refresh widgets'**
  String get forceRefreshWidgets;

  /// No description provided for @reloadWidgetDataWarning.
  ///
  /// In en, this message translates to:
  /// **'Reload widget data (USE SPARINGLY!!!)'**
  String get reloadWidgetDataWarning;

  /// No description provided for @testRatingBottomSheet.
  ///
  /// In en, this message translates to:
  /// **'Test Rating Bottom Sheet'**
  String get testRatingBottomSheet;

  /// No description provided for @simulateSuccessfulWeatherFetchTrigger.
  ///
  /// In en, this message translates to:
  /// **'Simulate successful weather fetch trigger'**
  String get simulateSuccessfulWeatherFetchTrigger;

  /// No description provided for @resetRatingPreferences.
  ///
  /// In en, this message translates to:
  /// **'Reset Rating Preferences'**
  String get resetRatingPreferences;

  /// No description provided for @resetShownCountAndTimestamps.
  ///
  /// In en, this message translates to:
  /// **'Reset shown count and timestamps'**
  String get resetShownCountAndTimestamps;

  /// No description provided for @ratingPreferencesReset.
  ///
  /// In en, this message translates to:
  /// **'Rating preferences reset'**
  String get ratingPreferencesReset;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @systemStatus.
  ///
  /// In en, this message translates to:
  /// **'System Status'**
  String get systemStatus;

  /// No description provided for @checkOperationalStatusOfServices.
  ///
  /// In en, this message translates to:
  /// **'Check the operational status of services'**
  String get checkOperationalStatusOfServices;

  /// No description provided for @helpAndFeedback.
  ///
  /// In en, this message translates to:
  /// **'Help & Feedback'**
  String get helpAndFeedback;

  /// No description provided for @getHelpOrSendFeedback.
  ///
  /// In en, this message translates to:
  /// **'Get help or send feedback'**
  String get getHelpOrSendFeedback;

  /// No description provided for @versionBuildNumber.
  ///
  /// In en, this message translates to:
  /// **'Version {version} ({buildNumber})'**
  String versionBuildNumber(String version, String buildNumber);

  /// No description provided for @featureRequest.
  ///
  /// In en, this message translates to:
  /// **'Feature Request'**
  String get featureRequest;

  /// No description provided for @suggestFeature.
  ///
  /// In en, this message translates to:
  /// **'Suggest a new feature for WeatherFast'**
  String get suggestFeature;

  /// No description provided for @bugReport.
  ///
  /// In en, this message translates to:
  /// **'Bug Report'**
  String get bugReport;

  /// No description provided for @reportBug.
  ///
  /// In en, this message translates to:
  /// **'Report a bug or issue'**
  String get reportBug;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @loadingNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Loading notification title...'**
  String get loadingNotificationTitle;

  /// No description provided for @loadingNotificationDesc.
  ///
  /// In en, this message translates to:
  /// **'Loading notification description...'**
  String get loadingNotificationDesc;

  /// No description provided for @failedToLoadNotifications.
  ///
  /// In en, this message translates to:
  /// **'Failed to load notifications: {error}'**
  String failedToLoadNotifications(String error);

  /// No description provided for @errorLoadingNotifications.
  ///
  /// In en, this message translates to:
  /// **'Error loading notifications: {error}'**
  String errorLoadingNotifications(String error);

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noNewNotifications.
  ///
  /// In en, this message translates to:
  /// **'No new notifications'**
  String get noNewNotifications;

  /// No description provided for @notificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notificationTitle;

  /// No description provided for @couldNotOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Could not open link'**
  String get couldNotOpenLink;

  /// No description provided for @openLink.
  ///
  /// In en, this message translates to:
  /// **'Open Link'**
  String get openLink;

  /// No description provided for @mapSettings.
  ///
  /// In en, this message translates to:
  /// **'Map Settings'**
  String get mapSettings;

  /// No description provided for @radarOpacity.
  ///
  /// In en, this message translates to:
  /// **'Radar Opacity'**
  String get radarOpacity;

  /// No description provided for @dataSources.
  ///
  /// In en, this message translates to:
  /// **'Data Sources'**
  String get dataSources;

  /// No description provided for @mapLayers.
  ///
  /// In en, this message translates to:
  /// **'Map Layers:'**
  String get mapLayers;

  /// No description provided for @baseMapsMapbox.
  ///
  /// In en, this message translates to:
  /// **'Base maps are provided by Mapbox.'**
  String get baseMapsMapbox;

  /// No description provided for @weatherData.
  ///
  /// In en, this message translates to:
  /// **'Weather Data:'**
  String get weatherData;

  /// No description provided for @livePrecipitationRainviewer.
  ///
  /// In en, this message translates to:
  /// **'Live precipitation radar layers are provided by RainViewer.'**
  String get livePrecipitationRainviewer;

  /// No description provided for @attribution.
  ///
  /// In en, this message translates to:
  /// **'Attribution:'**
  String get attribution;

  /// No description provided for @attributionText.
  ///
  /// In en, this message translates to:
  /// **'© Mapbox, © OpenStreetMap contributors, © RainViewer.'**
  String get attributionText;

  /// No description provided for @weatherMap.
  ///
  /// In en, this message translates to:
  /// **'Weather Map'**
  String get weatherMap;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @enjoyingWeatherFast.
  ///
  /// In en, this message translates to:
  /// **'Enjoying WeatherFast?'**
  String get enjoyingWeatherFast;

  /// No description provided for @rateAppDescription.
  ///
  /// In en, this message translates to:
  /// **'If you like using our app, please take a moment to rate it in the Play Store. Your support means the world to us!'**
  String get rateAppDescription;

  /// No description provided for @rateNow.
  ///
  /// In en, this message translates to:
  /// **'Rate Now'**
  String get rateNow;

  /// No description provided for @remindMeLater.
  ///
  /// In en, this message translates to:
  /// **'Remind Me in 2 Days'**
  String get remindMeLater;

  /// No description provided for @noThanks.
  ///
  /// In en, this message translates to:
  /// **'No Thanks'**
  String get noThanks;

  /// No description provided for @neaAttribution.
  ///
  /// In en, this message translates to:
  /// **'Contains information from 2-hour Weather Forecast, 24-hour Weather Forecast, 4-day Weather Forecast, Air Temperature across Singapore, Rainfall across Singapore, Relative Humidity across Singapore, Relative Humidity across Singapore, Wind Speed across Singapore, and Pollutant Standards Index (PSI), from the National Environment Agency, and Flood Alerts across Singapore, from the PUB, Singapore\'s national water agency, accessed on {date}, which is made available under the terms of the '**
  String neaAttribution(String date);

  /// No description provided for @sgOpenDataLicence.
  ///
  /// In en, this message translates to:
  /// **'Singapore Open Data Licence version 1.0'**
  String get sgOpenDataLicence;

  /// No description provided for @weatherDataProvidedByOM.
  ///
  /// In en, this message translates to:
  /// **'Weather data provided by Open-Meteo'**
  String get weatherDataProvidedByOM;

  /// No description provided for @neaWebsite.
  ///
  /// In en, this message translates to:
  /// **'NEA Website'**
  String get neaWebsite;

  /// No description provided for @dataGovSg.
  ///
  /// In en, this message translates to:
  /// **'Data.gov.sg'**
  String get dataGovSg;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @apiDocs.
  ///
  /// In en, this message translates to:
  /// **'API Docs'**
  String get apiDocs;

  /// No description provided for @terms.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get terms;

  /// No description provided for @loadingClearWeather.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get loadingClearWeather;

  /// No description provided for @loadingTempF.
  ///
  /// In en, this message translates to:
  /// **'72°F'**
  String get loadingTempF;

  /// No description provided for @tapToViewInteractiveRadar.
  ///
  /// In en, this message translates to:
  /// **'Tap to view interactive radar'**
  String get tapToViewInteractiveRadar;

  /// No description provided for @weatherMapsUnavailableOnWeb.
  ///
  /// In en, this message translates to:
  /// **'Weather Maps Unavailable on Web'**
  String get weatherMapsUnavailableOnWeb;

  /// No description provided for @interactiveWeatherRadarDescription.
  ///
  /// In en, this message translates to:
  /// **'Interactive weather radar and high-resolution maps are optimized for our mobile experience.'**
  String get interactiveWeatherRadarDescription;

  /// No description provided for @getItOnPlayStore.
  ///
  /// In en, this message translates to:
  /// **'Get it on Play Store'**
  String get getItOnPlayStore;

  /// No description provided for @multipleFloodAlerts.
  ///
  /// In en, this message translates to:
  /// **'Multiple Flood Alerts'**
  String get multipleFloodAlerts;

  /// No description provided for @activeWarnings.
  ///
  /// In en, this message translates to:
  /// **'{count} active warnings'**
  String activeWarnings(int count);

  /// No description provided for @tapToViewAllAlerts.
  ///
  /// In en, this message translates to:
  /// **'Tap to view all alerts'**
  String get tapToViewAllAlerts;

  /// No description provided for @activeFloodAlerts.
  ///
  /// In en, this message translates to:
  /// **'Active Flood Alerts'**
  String get activeFloodAlerts;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @instruction.
  ///
  /// In en, this message translates to:
  /// **'Instruction'**
  String get instruction;

  /// No description provided for @severity.
  ///
  /// In en, this message translates to:
  /// **'Severity'**
  String get severity;

  /// No description provided for @response.
  ///
  /// In en, this message translates to:
  /// **'Response'**
  String get response;

  /// No description provided for @flashFloodWarning.
  ///
  /// In en, this message translates to:
  /// **'Flash Flood Warning!'**
  String get flashFloodWarning;

  /// No description provided for @floodAlert.
  ///
  /// In en, this message translates to:
  /// **'Flood Alert'**
  String get floodAlert;

  /// No description provided for @incompleteLocalisationMessage.
  ///
  /// In en, this message translates to:
  /// **'The localization for the language {language} has not been completed.'**
  String incompleteLocalisationMessage(String language);

  /// No description provided for @helpLocalizeWeatherFast.
  ///
  /// In en, this message translates to:
  /// **'Help localize WeatherFast'**
  String get helpLocalizeWeatherFast;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'da',
    'de',
    'en',
    'es',
    'fi',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'ms',
    'nb',
    'nl',
    'pt',
    'ru',
    'sv',
    'th',
    'tl',
    'tr',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'th':
      return AppLocalizationsTh();
    case 'tl':
      return AppLocalizationsTl();
    case 'tr':
      return AppLocalizationsTr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
