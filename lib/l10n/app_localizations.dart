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
    Locale('nb', 'NO'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sv'),
    Locale('th'),
    Locale('tl'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
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
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return AppLocalizationsZhHans();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'nb':
      {
        switch (locale.countryCode) {
          case 'NO':
            return AppLocalizationsNbNo();
        }
        break;
      }
  }

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
