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
  String get adviceStorm => 'Yıldırım tehlikesi; Dışarı çıkmayın.';

  @override
  String get adviceClear => 'Dışarıda hava güneşli. Güneş gözlüğünü unutma.';

  @override
  String get adviceCloud => 'Hafif bulutlu bir gün; tam yürüyüş havası.';

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
      'Hava birkaç saat daha sabit; tam dışarı çıkmalık.';

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
    return 'Bildirimleri yükleme hatası: $error';
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
}
