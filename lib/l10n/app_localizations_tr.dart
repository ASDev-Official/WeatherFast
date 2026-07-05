// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get home => 'Ana Sayfa';

  @override
  String get insights => 'Tahminler';

  @override
  String get settings => 'Ayarlar';

  @override
  String get updatingWeather => 'Hava durumu güncelleniyor…';

  @override
  String get locationServicesDisabled =>
      'Konum hizmeti devre dışı. Lütfen ayarlardan konum hizmetini açın.';

  @override
  String get locationPermissionDenied =>
      'Konum izni verilmedi. Otomatik konumlandırma için etkinleştirin.';

  @override
  String get unableToFetchLocation =>
      'Konum hava bilgisi alınamadı. Lütfen tekrar deneyin.';

  @override
  String failedToLoadWeather(String error) {
    return 'Hava durumu yüklenemedi: $error';
  }

  @override
  String get searchPlace => 'Konum ara';

  @override
  String get close => 'Kapat';

  @override
  String get cityRegionOrCoordinates => 'Şehir, bölge veya koordinatlar';

  @override
  String get loadingLocation => 'Konum yükleniyor…';

  @override
  String get searchLocation => 'Konum ara';

  @override
  String get useCurrentLocation => 'Mevcut konumu kullan';

  @override
  String get clear => 'Açık';

  @override
  String get dummyTime => '1 Haz, Pzt • 12:00';

  @override
  String get daytime => 'Gündüz';

  @override
  String get night => 'Gece';

  @override
  String get dummyHighLow => 'mak 80° · min 60°';

  @override
  String highLowTemp(String high, String low) {
    return 'mak $high°  ·  min $low°';
  }

  @override
  String get feelsLike => 'Hissedilen';

  @override
  String get humidity => 'Nem';

  @override
  String get uvIndex => 'UV Endeksi';

  @override
  String get dewPoint => 'Çiy Noktası';

  @override
  String get wind => 'Rüzgar';

  @override
  String get airQuality => 'Hava Kalitesi';

  @override
  String get visibility => 'Görüş Mesafesi';

  @override
  String get precipChance => 'Yağış Oranı';

  @override
  String get hourlyForecast => 'Saatlik Tahmin';

  @override
  String get regionalOutlook => 'Bölgesel Tahmin';

  @override
  String get dataFromOpenMeteo => 'Open-Meteo verisi';

  @override
  String get dataFromNea => 'NEA verisi';

  @override
  String get todaysSuggestion => 'Günün önerisi';

  @override
  String get adviceRain => 'Yanına ince bir hırka al ve yola koyul.';

  @override
  String get adviceSnow => 'Sıkı giyin ve kaygan zeminlere dikkat et.';

  @override
  String get adviceStorm => 'Yıldırım tehlikesi: Dışarı çıkmayın.';

  @override
  String get adviceClear => 'Dışarıda hava güneşli. Güneş gözlüğünü unutma.';

  @override
  String get adviceClearNight => 'Bu gece gökyüzü açık.';

  @override
  String get adviceCloud => 'Hafif bulutlu bir gün, tam yürüyüş havası.';

  @override
  String get adviceDefault =>
      'Keyfinize bakın, birkaç saat sonra tekrar kontrol edin.';

  @override
  String get futureAdviceRain =>
      '~3 saat içinde yağmur beklentisi. Yanınızda şemsiye bulundurun.';

  @override
  String get futureAdviceSnow =>
      'İlerleyen vakitlerde kar bekleniyor; yolculuğunuza ek süre ayırın.';

  @override
  String get futureAdviceStorm =>
      'Fırtına yaklaşıyor. Dışarıdaki işlerinizi hemen bitirin.';

  @override
  String get futureAdviceClear =>
      'Hava birkaç saat daha sabit, tam dışarı çıkmalık.';

  @override
  String get today => 'Bugün';

  @override
  String get tomorrow => 'Yarın';

  @override
  String nextDays(int count) {
    return 'Önümüzdeki $count gün';
  }

  @override
  String get weather => 'Hava durumu';

  @override
  String precipPercent(String percent) {
    return '%$percent yağış ihtimali';
  }

  @override
  String toTime(String time) {
    return '$time saatine kadar';
  }

  @override
  String windSpeed(String speed, String dir) {
    return '$speed km/s $dir';
  }

  @override
  String visibilityKm(String dist) {
    return '$dist km';
  }

  @override
  String failedToLoadInsights(String error) {
    return 'Tahminler yüklenemedi: $error';
  }

  @override
  String get weatherInsights => 'Hava Durumu Tahminleri';

  @override
  String get analyzingConditions => 'Hava durumu analiz ediliyor...';

  @override
  String get activitySuggestions => 'Etkinlik Önerileri';

  @override
  String get healthAndSafety => 'Sağlık & Güvenlik';

  @override
  String get whatToWear => 'Ne Giymeli';

  @override
  String get todaysTimeline => 'Bugünün Akışı';

  @override
  String get weekAhead => 'Sonraki Hafta';

  @override
  String get selectLocationFromHome => 'Ana sayfadan bir konum seçin';

  @override
  String get toViewDetailedInsights => 'detaylı tahminlere bakmak için';

  @override
  String get widgetsRefreshed => 'Widget\'lar yenilendi';

  @override
  String widgetRefreshFailed(String error) {
    return 'Widget yenilenemedi: $error';
  }

  @override
  String get language => 'Dil';

  @override
  String get systemDefault => 'Sistem Varsayılanı';

  @override
  String get preferences => 'Tercihler';

  @override
  String get useFahrenheit => 'Fahrenheit kullan';

  @override
  String get showingFahrenheit => '°F gösteriliyor';

  @override
  String get showingCelsius => '°C gösteriliyor';

  @override
  String get about => 'Hakkında';

  @override
  String get openSourceLicenses => 'Açık Kaynak Lisansları';

  @override
  String get viewLicensesForOpenSourcePackages =>
      'Açık kaynak lisanslarını görüntüle';

  @override
  String usedInWeatherFastVersion(String version) {
    return ' WeatherFast $version sürümünde kullanıldı';
  }

  @override
  String get debug => 'Geliştirici';

  @override
  String get forceRefreshWidgets => 'Widget\'ları yenilemeye zorla';

  @override
  String get reloadWidgetDataWarning =>
      'Widget verilerini yeniden yükleyin (GEREKMEDİKÇE KULLANMAYIN!!!)';

  @override
  String get testRatingBottomSheet => 'Değerlendirme Panelini Test Et';

  @override
  String get simulateSuccessfulWeatherFetchTrigger =>
      'Hava durumu başarıyla çekildi tetiklemesini simüle et';

  @override
  String get resetRatingPreferences => 'Değerlendirme Tercihlerini Sıfırla';

  @override
  String get resetShownCountAndTimestamps =>
      'Gösterim sayısını ve zaman damgalarını sıfırla';

  @override
  String get ratingPreferencesReset => 'Değerlendirme tercihleri sıfırlandı';

  @override
  String get support => 'Destek';

  @override
  String get systemStatus => 'Sistem Durumu';

  @override
  String get checkOperationalStatusOfServices =>
      'Hizmetlerin çalışma durumunu kontrol edin';

  @override
  String get helpAndFeedback => 'Yardım & Geri bildirim';

  @override
  String get getHelpOrSendFeedback => 'Yardım alın veya geri bildirim gönderin';

  @override
  String versionBuildNumber(String version, String buildNumber) {
    return 'Versiyon $version ($buildNumber)';
  }

  @override
  String get featureRequest => 'Özellik Talebi';

  @override
  String get suggestFeature => 'WeatherFast için yeni bir özellik önerin';

  @override
  String get bugReport => 'Hata Bildirimi';

  @override
  String get reportBug => 'Hata veya sorunu bildir';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get loadingNotificationTitle => 'Bildirim başlığı yükleniyor...';

  @override
  String get loadingNotificationDesc => 'Bildirim açıklaması yükleniyor...';

  @override
  String failedToLoadNotifications(String error) {
    return 'Bildirimler yüklenemedi: $error';
  }

  @override
  String errorLoadingNotifications(String error) {
    return 'Bildirimler yüklenirken hata oluştu: $error';
  }

  @override
  String get retry => 'Tekrar Dene';

  @override
  String get noNewNotifications => 'Yeni bildirim yok';

  @override
  String get notificationTitle => 'Bildirim';

  @override
  String get couldNotOpenLink => 'Bağlantı açılamadı';

  @override
  String get openLink => 'Bağlantıyı aç';

  @override
  String get mapSettings => 'Harita Ayarları';

  @override
  String get radarOpacity => 'Radar Şeffaflığı';

  @override
  String get dataSources => 'Veri Kaynakları';

  @override
  String get mapLayers => 'Harita Katmanları:';

  @override
  String get baseMapsMapbox =>
      'Temel haritalar Mapbox tarafından sağlanmaktadır.';

  @override
  String get weatherData => 'Hava Durumu Verisi:';

  @override
  String get livePrecipitationRainviewer =>
      'Canlı yağış radarı RainViewer tarafından sağlanmaktadır.';

  @override
  String get attribution => 'Atıflar:';

  @override
  String get attributionText =>
      '© Mapbox, © OpenStreetMap contributors, © RainViewer.';

  @override
  String get weatherMap => 'Hava Durumu Haritası';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get enjoyingWeatherFast => 'WeatherFast\'ı beğendiniz mi?';

  @override
  String get rateAppDescription =>
      'Uygulamamızı beğendiyseniz, lütfen bir dakikanızı ayırıp Play Store\'da puan verin. Desteğiniz bizim için çok değerli!';

  @override
  String get rateNow => 'Şimdi Puan Verin';

  @override
  String get remindMeLater => '2 Gün Sonra Hatırlat';

  @override
  String get noThanks => 'Hayır, Teşekkürler';

  @override
  String neaAttribution(String date) {
    return 'Ulusal Çevre Ajansı (NEA) tarafından sağlanan; 2 Saatlik Hava Tahmini, 24 Saatlik Hava Tahmini, 4 Günlük Hava Tahmini, Singapur Genelinde Hava Sıcaklığı, Yağış, Bağıl Nem ve Rüzgar Hızı ile Kirletici Standartları Endeksi (PSI) verilerini ve Singapur\'un ulusal su kuruluşu PUB tarafından sağlanan Sel Uyarıları verilerini içerir. $date tarihinde erişilen bu veriler şu lisans koşulları kapsamındadır: ';
  }

  @override
  String get sgOpenDataLicence => 'Singapur Açık Veri Lisansı sürüm 1.0';

  @override
  String get weatherDataProvidedByOM =>
      'Hava durumu verileri Open-Meteo tarafından sağlanmaktadır';

  @override
  String get neaWebsite => 'NEA Websitesi';

  @override
  String get dataGovSg => 'Data.gov.sg';

  @override
  String get website => 'Website';

  @override
  String get apiDocs => 'API Docs';

  @override
  String get terms => 'Koşullar';

  @override
  String get loadingClearWeather => 'Temiz';

  @override
  String get loadingTempF => '72°F';

  @override
  String get tapToViewInteractiveRadar =>
      'Etkileşimli radarı görüntülemek için dokunun';

  @override
  String get weatherMapsUnavailableOnWeb =>
      'Web Hava Durumu Haritası Kullanılamıyor';

  @override
  String get interactiveWeatherRadarDescription =>
      'Etkileşimli hava durumu radarı ve yüksek çözünürlüklü haritalar, mobil deneyimimiz için optimize edilmiştir.';

  @override
  String get getItOnPlayStore => 'Play Store\'dan indirin';

  @override
  String get multipleFloodAlerts => 'Birden Fazla Sel Uyarısı';

  @override
  String activeWarnings(int count) {
    return '$count adet etkin uyarı';
  }

  @override
  String get tapToViewAllAlerts => 'Tüm alarmları görmek için dokunun';

  @override
  String get activeFloodAlerts => 'Etkin Sel Uyarıları';

  @override
  String get area => 'Bölge';

  @override
  String get description => 'Açıklama';

  @override
  String get instruction => 'Talimat';

  @override
  String get severity => 'Şiddet';

  @override
  String get response => 'Cevap';

  @override
  String get flashFloodWarning => 'Ani Sel Uyarısı!';

  @override
  String get floodAlert => 'Sel Uyarısı';

  @override
  String incompleteLocalisationMessage(String language) {
    return '$language dilinin yerelleştirmesi henüz tamamlanmadı.';
  }

  @override
  String get helpLocalizeWeatherFast =>
      'WeatherFast yerelleştirmesine katkıda bulunun';

  @override
  String get ok => 'Tamam';

  @override
  String get notificationsTooltip => 'Bildirimler';

  @override
  String get units => 'Birimler';

  @override
  String get temperatureWindVisibility => 'Sıcaklık, Rüzgar, Görüş Mesafesi';

  @override
  String get temperature => 'Sıcaklık';

  @override
  String get celsius => 'Santigrat (°C)';

  @override
  String get fahrenheit => 'Fahrenheit (°F)';

  @override
  String get windSpeedLabel => 'Rüzgar Hızı';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get unitMs => 'm/s';

  @override
  String get unitKnots => 'knots';

  @override
  String get unitKilometers => 'Kilometre (km)';

  @override
  String get unitMiles => 'Mil (mi)';

  @override
  String get performanceMode => 'Performans Modu';

  @override
  String get disableExtraVisualEffects => 'Görsel efektleri devre dışı bırak';

  @override
  String get bestTimesTitle => 'En Uygun Saatler';

  @override
  String get insightsActivityLimitOutdoorTitle =>
      'Açık Havada Kendinizi Zorlamayın';

  @override
  String get insightsActivityLimitOutdoorDesc =>
      'Düşük hava kalitesi: Kapalı alanları ve hafif aktiviteleri tercih edin';

  @override
  String get insightsActivityIndoorTitle => 'Kapalı Alan Aktiviteleri';

  @override
  String get insightsActivityIndoorDesc =>
      'Müzeleri gezebilir, kafelerde veya kapalı mekanlarda vakit geçirebilirsiniz';

  @override
  String get insightsActivityCyclingTitle => 'Tam Bisiklet Havası';

  @override
  String get insightsActivityCyclingDesc =>
      'Bisiklet sürmek için harika, ılık hava ve açık gökyüzü';

  @override
  String get insightsActivityOutdoorSportsTitle => 'Açık Hava Sporları';

  @override
  String get insightsActivityOutdoorSportsDesc =>
      'Açık hava aktiviteleri ve spor için uygun hava';

  @override
  String get insightsActivityBeachTitle => 'Sahil Günü';

  @override
  String get insightsActivityBeachDesc =>
      'Tam plaj havası; güneş kremini unutma!';

  @override
  String get insightsActivityHikingTitle => 'Doğa Yürüyüşü';

  @override
  String get insightsActivityHikingDesc =>
      'Doğa yürüyüşü için serin ve keyifli bir hava';

  @override
  String get insightsActivityGeneralTitle => 'Genel Aktiviteler';

  @override
  String get insightsActivityGeneralDesc => 'Ilıman hava, hazırlıklı olun';

  @override
  String get insightsHealthAirQualityTitle => 'Hava Kalitesi Uyarısı';

  @override
  String get insightsHealthAirQualityDesc =>
      'Maske takın ve hava düzelene kadar yoğun aktiviteleri kısıtlayın.';

  @override
  String get insightsHealthUVTitle => 'Yüksek UV Riski';

  @override
  String get insightsHealthUVDesc =>
      '2 saatte bir SPF 30+ güneş kremi uygulayın. Şapka ve güneş gözlüğü kullanın.';

  @override
  String get insightsHealthHeatTitle => 'Bol Su İçin';

  @override
  String get insightsHealthHeatDesc =>
      'Düzenli su tüketin. 11:00-15:00 arası güneşe çıkmamaya özen gösterin.';

  @override
  String get insightsHealthColdTitle => 'Soğuk Hava Uyarısı';

  @override
  String get insightsHealthColdDesc =>
      'Donma riskine dikkat! Sıkı giyinin, el ve ayaklarınızı açıkta bırakmayın.';

  @override
  String get insightsHealthWindTitle => 'Rüzgar Uyarısı';

  @override
  String get insightsHealthWindDesc =>
      'Uçabilecek eşyaları sabitleyin. Araç sürerken dikkatli olun.';

  @override
  String get insightsHealthOptimalTitle => 'En Uygun Hava';

  @override
  String get insightsHealthOptimalDesc =>
      'Spor yapmak ve dışarıda vakit geçirmek için harika bir hava.';

  @override
  String get insightsClothingHot =>
      'Hafif, nefes alan giysiler giyin. Şapka ve gözlük önerilir.';

  @override
  String get insightsClothingWarm =>
      'Rahat yazlıklar giyin; sabah ve akşam için yanınıza ince bir şeyler alın.';

  @override
  String get insightsClothingMild =>
      'Uzun kollu ya da ince bir ceket iyi gider.';

  @override
  String get insightsClothingCool =>
      'Yanına ceket veya kazak al, altına da pantolon giysen iyi olur.';

  @override
  String get insightsClothingCold =>
      'Kalın bir ceket şart, rahat etmek için sıkı giyin.';

  @override
  String get insightsClothingFreeze =>
      'Kışlık mont, eldiven ve sıcak tutacak kıyafetler şart; iyice giyin.';

  @override
  String get insightsClothingRainSuffix => ' Su geçirmez eşyalarını unutma.';

  @override
  String get insightsHourlyMorning => 'Sabah';

  @override
  String get insightsHourlyAfternoon => 'Öğleden sonra';

  @override
  String get insightsHourlyEvening => 'Akşam';

  @override
  String get insightsHourlyMorningChilly =>
      'Sabah serinliği: Ekstra kıyafet al';

  @override
  String get insightsHourlyMorningComfort =>
      'Güne tatlı bir serinlikle başlıyoruz';

  @override
  String get insightsHourlyAfternoonHot => 'Güneş tam tepede: Gölgeye kaçın';

  @override
  String get insightsHourlyAfternoonPleasant =>
      'Öğleden sonra keyifli bir hava bekleniyor';

  @override
  String get insightsHourlyEveningCool =>
      'Akşam hava serin, yanına bir ceket al';

  @override
  String get insightsHourlyEveningMild => 'Ilık bir akşam havası';

  @override
  String get insightsWeekLimitedData => 'Kısıtlı tahmin verisi mevcut';

  @override
  String get insightsWeekDataUnavailable => 'Tahmin verilerine ulaşılamıyor';

  @override
  String insightsWeekVariableSwing(String swing) {
    return 'Önümüzdeki hafta $swing°C\'lik sıcaklık oynaması var. ';
  }

  @override
  String get insightsWeekStable =>
      'Hava sıcaklıklarında ani bir değişim beklenmiyor. ';

  @override
  String get insightsWeekWarm => 'Genel olarak sıcak bir hafta bekleniyor.';

  @override
  String get insightsWeekCool => 'Serin hava etkisini sürdürüyor.';

  @override
  String get insightsWeekModerate => 'Ilıman hava etkisini sürdürüyor.';

  @override
  String get insightsBestTimeSingapore =>
      'En İyi Saatler: 07:00 - 09:00 ve 17:00 - 20:00';

  @override
  String get insightsBestTimeSingaporeDesc =>
      'Singapur\'da dışarıda vakit geçirmek için harika bir hava var';

  @override
  String get insightsBestTimeNoData => 'Veri yok';

  @override
  String get insightsBestTimeNoDataDesc => 'İdeal saatler hesaplanamadı';

  @override
  String get insightsBestTimeLimited => 'Sınırlı veri';

  @override
  String get insightsBestTimeLimitedDesc => 'Saatlik verilere ulaşılamıyor';

  @override
  String insightsBestTimeAt(String time) {
    return 'İdeal Saat: $time';
  }

  @override
  String get insightsBestTimeDesc =>
      'Dışarıda vakit geçirmek için harika bir hava';

  @override
  String insightsTimeAM(String hour) {
    return 'Öğleden önce $hour';
  }

  @override
  String insightsTimePM(String hour) {
    return 'Öğleden sonra $hour';
  }

  @override
  String get insightsTimeNoon => '12.00';

  @override
  String get insightsRecRain => '☔ Şemsiyeni al, yağmur bekleniyor';

  @override
  String get insightsRecHeatHigh => '🌡️ Yüksek sıcaklık; bol su için';

  @override
  String get insightsRecHeatMid => '☀️ Güneş kremi sürün';

  @override
  String get insightsRecCold => '🧊 Soğuk hava geliyor, sıkı giyinin';

  @override
  String get insightsRecWind =>
      '💨 Şiddetli rüzgar uyarısı: Eşyaları sabitleyin';

  @override
  String get insightsRecUV => '🛡️ Yüksek UV: Koruyucu önlem alın';

  @override
  String get insightsRecAir =>
      '😷 Kötü hava kalitesi: Kendinizi fazla yormayın';

  @override
  String get insightsRecWarming =>
      '📈 Hava ısınıyor; gün içindeki değişimlere göre giyin';

  @override
  String get insightsRecCooling => '📉 Havalar soğuyor';

  @override
  String get insightsRecPleasant => '✨ Keyifli bir hava bekleniyor';

  @override
  String get insightsSummaryAllClear =>
      'Her şey yolunda, önümüzde harika bir hava var!';

  @override
  String get insightsSummaryRain => 'Yağmur geliyor, hazırlıklı olun';

  @override
  String get insightsSummaryHeat => 'Aşırı sıcak: Kendinizi serin tutun';

  @override
  String get insightsSummaryCold => 'Dondurucu soğuk: Sıkı giyinin';

  @override
  String get insightsSummaryWind => 'Rüzgarlı bir gün, şapkanızı sıkı tutun';

  @override
  String get insightsSummaryUV => 'Yüksek UV uyarısı: Önlem alın';

  @override
  String get insightsSummaryAir => 'Kötü hava kalitesi: Kendinizi yormayın';

  @override
  String get insightsSummaryVariable => 'Değişken hava bekleniyor';

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
