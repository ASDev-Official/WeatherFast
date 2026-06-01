// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get home => 'होम';

  @override
  String get insights => 'अंतर्दृष्टि';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get updatingWeather => 'मौसम लोड हो रहा है…';

  @override
  String get locationServicesDisabled =>
      'लोकेशन सर्विस बंद हैं. सेटिंग्स में जाकर उन्हें चालू करें।';

  @override
  String get locationPermissionDenied =>
      'लोकेशन परमिशन नहीं मिली। इसे आपको ऑटो-लोकेट करने के लिए इनेबल करें।';

  @override
  String get unableToFetchLocation =>
      'लोकेशन का मौसम नहीं मिल रहा है। कृपया फिर से कोशिश करें।';

  @override
  String failedToLoadWeather(String error) {
    return 'मौसम लोड करने में विफल: $error';
  }

  @override
  String get searchPlace => 'कोई स्थान खोजें';

  @override
  String get close => 'बंद';

  @override
  String get cityRegionOrCoordinates => 'शहर, क्षेत्र, या निर्देशांक';

  @override
  String get loadingLocation => 'लोकेशन लोड हो रहा है…';

  @override
  String get searchLocation => 'स्थान खोजें';

  @override
  String get useCurrentLocation => 'वर्तमान स्थान का उपयोग करें';

  @override
  String get clear => 'स्पष्ट';

  @override
  String get dummyTime => 'सोमवार, 1 जनवरी • दोपहर 12:00 बजे';

  @override
  String get daytime => 'दिन';

  @override
  String get night => 'रात';

  @override
  String get dummyHighLow => 'H 80° · L 60°';

  @override
  String highLowTemp(String high, String low) {
    return 'H $high°  ·  L $low°';
  }

  @override
  String get feelsLike => 'आभासी तापमान';

  @override
  String get humidity => 'नमी';

  @override
  String get wind => 'हवा';

  @override
  String get airQuality => 'वायु गुणवत्ता';

  @override
  String get visibility => 'दृश्यता';

  @override
  String get precipChance => 'बारिश की संभावना';

  @override
  String get hourlyForecast => 'घंटेवार पूर्वानुमान';

  @override
  String get regionalOutlook => 'क्षेत्रीय पूर्वानुमान';

  @override
  String get dataFromOpenMeteo => 'Open-Meteo से डेटा';

  @override
  String get dataFromNea => 'NEA से डेटा';

  @override
  String get todaysSuggestion => 'आज का सुझाव';

  @override
  String get adviceRain => 'अपने साथ छाता ले जाएं।';

  @override
  String get adviceSnow => 'कपड़े पहनें और फिसलन भरी सड़कों से सावधान रहें।';

  @override
  String get adviceStorm => 'घर के अंदर रहें; बिजली गिरने का खतरा है।';

  @override
  String get adviceClear => 'धूप निकली है। धूप का चश्मा पहनो।';

  @override
  String get adviceCloud => 'आज हल्के बादल हैं -- घूमना अच्छा रहेगा।';

  @override
  String get adviceDefault => 'आराम से रहें और कुछ घंटों में फिर से चेक करें।';

  @override
  String get futureAdviceRain =>
      'लगभग 3 घंटे में बारिश होने की संभावना है। छाता पास रखें।';

  @override
  String get futureAdviceSnow =>
      'आज बाद में बर्फ़बारी होगी - ज़्यादा समय लेकर यात्रा की योजना बनाएं।';

  @override
  String get futureAdviceStorm =>
      'कुछ घंटों में भारी बारिश होने वाली है। बाहर के काम जल्दी खत्म कर लें।';

  @override
  String get futureAdviceClear =>
      'अगले कुछ घंटों तक मौसम अच्छा रहेगा। बाहर जाने का अच्छा समय है।';

  @override
  String get today => 'आज';

  @override
  String get tomorrow => 'कल';

  @override
  String nextDays(int count) {
    return 'अगले $count दिन';
  }

  @override
  String get weather => 'मौसम';

  @override
  String precipPercent(String percent) {
    return '$percent% बारिश';
  }

  @override
  String toTime(String time) {
    return '$time तक';
  }

  @override
  String windSpeed(String speed, String dir) {
    return '$speed किलोमीटर/घंटा $dir';
  }

  @override
  String visibilityKm(String dist) {
    return '$dist किलोमीटर';
  }

  @override
  String failedToLoadInsights(String error) {
    return 'इनसाइट्स लोड नहीं हो पाईं: $error';
  }

  @override
  String get weatherInsights => 'मौसम संबंधी जानकारी';

  @override
  String get analyzingConditions => 'परिस्थितियों का विश्लेषण..।';

  @override
  String get activitySuggestions => 'गतिविधियों के लिए सुझाव';

  @override
  String get healthAndSafety => 'स्वास्थ्य एवं सुरक्षा';

  @override
  String get whatToWear => 'क्या पहनना है';

  @override
  String get todaysTimeline => 'आज की समयरेखा';

  @override
  String get weekAhead => 'आने वाला सप्ताह';

  @override
  String get selectLocationFromHome => 'होम से कोई स्थान चुनें';

  @override
  String get toViewDetailedInsights => 'विस्तृत जानकारी देखने के लिए';

  @override
  String get widgetsRefreshed => 'विजेट ताज़ा किए गए';

  @override
  String widgetRefreshFailed(String error) {
    return 'विजेट रिफ्रेश काम नहीं किया: $error';
  }

  @override
  String get language => 'भाषा';

  @override
  String get systemDefault => 'प्रणालीगत चूक';

  @override
  String get preferences => 'सेटिंग्स';

  @override
  String get useFahrenheit => 'फ़ारेनहाइट का उपयोग करें';

  @override
  String get showingFahrenheit => 'फ़ारेनहाइट दिखा रहा है';

  @override
  String get showingCelsius => 'सेल्सियस दिखा रहा है';

  @override
  String get about => 'ऐप के बारे में';

  @override
  String get openSourceLicenses => 'ओपन-सोर्स लाइसेंस';

  @override
  String get viewLicensesForOpenSourcePackages =>
      'ओपन-सोर्स पैकेज के लिए लाइसेंस देखें';

  @override
  String usedInWeatherFastVersion(String version) {
    return ' जो WeatherFast $version में उपयोग किए जाते हैं';
  }

  @override
  String get debug => 'डिबग';

  @override
  String get forceRefreshWidgets => 'विजेट को ज़बरदस्ती रिफ़्रेश करें';

  @override
  String get reloadWidgetDataWarning =>
      'विजेट डेटा रीलोड करें (कम इस्तेमाल करें)';

  @override
  String get testRatingBottomSheet => 'टेस्ट रेटिंग बॉटम शीट';

  @override
  String get simulateSuccessfulWeatherFetchTrigger =>
      'सफल मौसम फ़ेच ट्रिगर सिमुलेट करें';

  @override
  String get resetRatingPreferences => 'रेटिंग प्राथमिकताएँ रीसेट करें';

  @override
  String get resetShownCountAndTimestamps =>
      'दिखाई गई गिनती और टाइमस्टैम्प रीसेट करें';

  @override
  String get ratingPreferencesReset => 'रेटिंग प्राथमिकताएँ रीसेट करें';

  @override
  String get support => 'सहायता';

  @override
  String get systemStatus => 'सिस्टम स्थिति';

  @override
  String get checkOperationalStatusOfServices =>
      'सेवाओं की ऑपरेशनल स्थिति की जाँच करें';

  @override
  String get helpAndFeedback => 'सहायता और प्रतिक्रिया';

  @override
  String get getHelpOrSendFeedback => 'मदद लें या फ़ीडबैक भेजें';

  @override
  String versionBuildNumber(String version, String buildNumber) {
    return 'वर्ज़न $version ($buildNumber)';
  }

  @override
  String get featureRequest => 'सुविधा का अनुरोध';

  @override
  String get suggestFeature => 'WeatherFast के लिए एक नया फीचर सुझाएं';

  @override
  String get bugReport => 'बग रिपोर्ट';

  @override
  String get reportBug => 'बग या समस्या की रिपोर्ट करें';

  @override
  String get notifications => 'सूचनाएं';

  @override
  String get loadingNotificationTitle => 'नोटिफिकेशन टाइटल लोड हो रहा है..।';

  @override
  String get loadingNotificationDesc =>
      'नोटिफ़िकेशन डिस्क्रिप्शन लोड हो रहा है..।';

  @override
  String failedToLoadNotifications(String error) {
    return 'नोटिफ़िकेशन लोड नहीं हो पाए: $error';
  }

  @override
  String errorLoadingNotifications(String error) {
    return 'नोटिफ़िकेशन लोड नहीं हो पाए: $error';
  }

  @override
  String get retry => 'पुन: प्रयास करें';

  @override
  String get noNewNotifications => 'कोई नए संदेश नहीं';

  @override
  String get notificationTitle => 'अधिसूचना';

  @override
  String get couldNotOpenLink => 'लिंक नहीं खोला जा सका';

  @override
  String get openLink => 'लिंक खोलें';

  @override
  String get mapSettings => 'मानचित्र सेटिंग्स';

  @override
  String get radarOpacity => 'रडार अपारदर्शिता';

  @override
  String get dataSources => 'डेटा स्रोत';

  @override
  String get mapLayers => 'मानचित्र परतें:';

  @override
  String get baseMapsMapbox => 'बेस मैप Mapbox द्वारा दिए जाते हैं।';

  @override
  String get weatherData => 'मौसम डेटा:';

  @override
  String get livePrecipitationRainviewer =>
      'लाइव प्रेसिपिटेशन रडार लेयर्स RainViewer से मिलती हैं।';

  @override
  String get attribution => 'श्रेय:';

  @override
  String get attributionText =>
      '© Mapbox, © OpenStreetMap contributors, © RainViewer।';

  @override
  String get weatherMap => 'मौसम मानचित्र';

  @override
  String get loading => 'लोड हो रहा है..।';

  @override
  String get enjoyingWeatherFast => 'क्या आप WeatherFast का आनंद ले रहे हैं?';

  @override
  String get rateAppDescription =>
      'अगर आपको हमारा ऐप इस्तेमाल करना पसंद है, तो प्लीज़ थोड़ा समय निकालकर इसे Play Store में रेट करें। आपका सपोर्ट हमारे लिए बहुत मायने रखता है!';

  @override
  String get rateNow => 'रेट करें';

  @override
  String get remindMeLater => 'मुझे 2 दिन में याद दिलाना';

  @override
  String get noThanks => 'नहीं';

  @override
  String neaAttribution(String date) {
    return 'इसमें 2 घंटे का मौसम पूर्वानुमान, 24 घंटे का मौसम पूर्वानुमान, 4 दिन का मौसम पूर्वानुमान, पूरे सिंगापुर में हवा का तापमान, सिंगापुर में वर्षा, सिंगापुर में सापेक्ष आर्द्रता, सिंगापुर में सापेक्ष आर्द्रता, सिंगापुर में हवा की गति और प्रदूषक मानक सूचकांक (पीएसआई) की जानकारी शामिल है, जिसे PUB और NEA से $date को एक्सेस किया गया है, जो की ';
  }

  @override
  String get sgOpenDataLicence =>
      'सिंगापुर ओपन डेटा लाइसेंस वर्शन 1.0 की शर्तों के तहत उपलब्ध कराई गई है';

  @override
  String get weatherDataProvidedByOM =>
      'ओपन-मेटियो द्वारा प्रदान किया गया मौसम डेटा';

  @override
  String get neaWebsite => 'NEA वेबसाइट';

  @override
  String get dataGovSg => 'Data.gov.sg';

  @override
  String get website => 'वेबसाइट';

  @override
  String get apiDocs => 'API दस्तावेज़ीकरण';

  @override
  String get terms => 'शर्तें';

  @override
  String get loadingClearWeather => 'साफ करो';

  @override
  String get loadingTempF => '72°F';

  @override
  String get tapToViewInteractiveRadar =>
      'इंटरैक्टिव रडार देखने के लिए टैप करें';

  @override
  String get weatherMapsUnavailableOnWeb =>
      'वेब पर मौसम के नक्शे उपलब्ध नहीं हैं';

  @override
  String get interactiveWeatherRadarDescription =>
      'इंटरैक्टिव वेदर रडार और हाई-रिज़ॉल्यूशन मैप हमारे मोबाइल एक्सपीरियंस के लिए ऑप्टिमाइज़ किए गए हैं।';

  @override
  String get getItOnPlayStore => 'प्ले स्टोर पर प्राप्त करें';

  @override
  String get multipleFloodAlerts => 'बाढ़ की कई चेतावनियाँ';

  @override
  String activeWarnings(int count) {
    return '$count सक्रिय चेतावनियाँ';
  }

  @override
  String get tapToViewAllAlerts => 'सभी अलर्ट देखने के लिए टैप करें';

  @override
  String get activeFloodAlerts => 'सक्रिय बाढ़ की चेतावनियाँ';

  @override
  String get area => 'क्षेत्र';

  @override
  String get description => 'विवरण';

  @override
  String get instruction => 'अनुदेश';

  @override
  String get severity => 'गंभीरता';

  @override
  String get response => 'प्रतिक्रिया';

  @override
  String get flashFloodWarning => 'ध्यान दे: बाढ़ की चेतावनी!';

  @override
  String get floodAlert => 'बाढ़ की चेतावनी';
}
