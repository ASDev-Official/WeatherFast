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
  String get uvIndex => 'यूवी सूचकांक';

  @override
  String get dewPoint => 'ओसांक';

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

  @override
  String incompleteLocalisationMessage(String language) {
    return '$language भाषा का लोकलाइज़ेशन पूरा नहीं हुआ है।';
  }

  @override
  String get helpLocalizeWeatherFast =>
      'WeatherFast का अनुवाद करने में मदद करें';

  @override
  String get ok => 'ठीक है';

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
      'Consider a mask outdoors and limit intense activity until air improves।';

  @override
  String get insightsHealthUVTitle => 'UV Protection Critical';

  @override
  String get insightsHealthUVDesc =>
      'Apply SPF 30+ sunscreen every 2 hours. Wear sunglasses and a hat।';

  @override
  String get insightsHealthHeatTitle => 'Stay Hydrated';

  @override
  String get insightsHealthHeatDesc =>
      'Drink water regularly. Avoid prolonged sun exposure 11am-3pm।';

  @override
  String get insightsHealthColdTitle => 'Cold Weather Alert';

  @override
  String get insightsHealthColdDesc =>
      'Watch for frostbite. Layer clothing and cover extremities।';

  @override
  String get insightsHealthWindTitle => 'Wind Advisory';

  @override
  String get insightsHealthWindDesc =>
      'Secure loose items. Be cautious when driving।';

  @override
  String get insightsHealthOptimalTitle => 'Optimal Conditions';

  @override
  String get insightsHealthOptimalDesc =>
      'Perfect weather for physical activity and outdoor time।';

  @override
  String get insightsClothingHot =>
      'Light, breathable clothing. Hat and sunglasses recommended।';

  @override
  String get insightsClothingWarm =>
      'Comfortable summer wear. Light layers for morning/evening।';

  @override
  String get insightsClothingMild =>
      'Long sleeves or light jacket recommended।';

  @override
  String get insightsClothingCool =>
      'Jacket or sweater needed. Long pants suggested।';

  @override
  String get insightsClothingCold =>
      'Warm jacket essential. Layer up for comfort।';

  @override
  String get insightsClothingFreeze =>
      'Heavy winter coat, gloves, and warm layers required।';

  @override
  String get insightsClothingRainSuffix => ' Bring waterproof gear।';

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
  String get insightsWeekWarm => 'Generally warm throughout the week।';

  @override
  String get insightsWeekCool => 'Cool weather pattern persisting।';

  @override
  String get insightsWeekModerate => 'Moderate temperatures prevailing।';

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

  @override
  String get weatherChoreographer => 'Today\'s Events';

  @override
  String get tomorrowsEvents => 'Tomorrow\'s Events';

  @override
  String get weatherChoreographerSubtitle =>
      'Show weather for your calendar events';

  @override
  String get calendarSettingsTitle => 'Calendar Sync';

  @override
  String get calendarSettingsSubtitle => 'Calendar Sync';

  @override
  String get calendarSettingsDescription =>
      'When enabled, WeatherFast will scan your selected calendars for events that have a location specified. It will then display tailored weather insights right below the main weather card for those locations.\n\nPrivacy Note: No calendar data is ever sent outside your device from WeatherFast, and all processing happens completely on device.';

  @override
  String get enableChoreographer => 'Enable Calendar Sync';

  @override
  String get showWeatherForCalendarEvents => 'Show weather for calendar events';

  @override
  String get selectCalendars => 'Select Calendars';

  @override
  String get noCalendarsFound => 'No calendars found or permission denied.';

  @override
  String get unnamedCalendar => 'Unnamed Calendar';

  @override
  String get newWeatherChoreographer => 'New: Calendar Sync';

  @override
  String get weatherChoreographerPromoDescription =>
      'WeatherFast can now sync with your calendar to show you weather forecasts for your upcoming events right on the home screen.';

  @override
  String get weatherChoreographerPromoPrivacy =>
      'Privacy Note: All calendar data is processed securely on your device and never sent to any servers.';

  @override
  String get notNow => 'Not Now';

  @override
  String get enable => 'Enable';

  @override
  String get resetCalendarPromo => 'Reset Calendar Promo';

  @override
  String get resetCalendarPromoSubtitle =>
      'Reset the shown state of the Calendar Sync bottom sheet';

  @override
  String get calendarPromoReset => 'Calendar promo preferences reset';

  @override
  String get eventDetails => 'Event Details';

  @override
  String weatherForArea(String area) {
    return 'Weather for $area';
  }

  @override
  String get loadingWeather => 'Loading weather details...';

  @override
  String get noWeatherAvailable =>
      'Weather details currently unavailable for this location.';

  @override
  String get meetingEnvironment => 'Meeting Environment';

  @override
  String get indoor => 'Indoor';

  @override
  String get outdoor => 'Outdoor';

  @override
  String get smartRecommendations => 'Smart Recommendations';

  @override
  String get recCommuteRain =>
      'Rain is forecast. Don\'t forget an umbrella or raincoat for your commute!';

  @override
  String recCommuteHot(int temp) {
    return 'Outside is very hot ($temp°). Dress in light, breathable clothing for your commute, but carry a light layer as indoor air conditioning might be chilly!';
  }

  @override
  String recCommuteCold(int temp) {
    return 'Outside is cold ($temp°). Wear warm layers so you can easily adjust once you enter the heated venue.';
  }

  @override
  String get recIndoorAllClear =>
      '🏢 Since your meeting is indoors, you\'ll be comfortable and protected from the elements. Enjoy your meeting!';

  @override
  String get recIndoorCommuteHeader =>
      '🏢 Protected Indoors: Once inside, you\'ll be shielded from the weather. For your commute:\n';

  @override
  String get recOutdoorRain =>
      '⚠️ Rain is expected! We strongly recommend bringing an umbrella or moving the meeting indoors/under shelter.';

  @override
  String recOutdoorHot(int temp) {
    return '🥵 It\'s hot outside ($temp°). We suggest seeking shade, wearing breathable clothing, and staying hydrated.';
  }

  @override
  String recOutdoorCold(int temp) {
    return '🥶 It\'s chilly outside ($temp°). Dress warmly with a jacket, and consider a warm beverage.';
  }

  @override
  String recOutdoorWindy(String wind) {
    return '💨 Expect gusty winds (up to $wind km/h). Secure any loose papers or materials.';
  }

  @override
  String get recOutdoorAllClear =>
      '🌳 Perfect weather for an outdoor meeting! Enjoy the pleasant condition and fresh air.';

  @override
  String get recOutdoorHeader => '🌳 Outdoor Notice:\n';
}
