// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get home => 'Accueil';

  @override
  String get insights => 'Statistiques';

  @override
  String get settings => 'Paramètres';

  @override
  String get updatingWeather => 'Mise à jour de la météo…';

  @override
  String get locationServicesDisabled =>
      'Les services de localisation sont désactivés. Activez-les dans Paramètres';

  @override
  String get locationPermissionDenied =>
      'L\'accès à la localisation a été refusé. Autorisez-le pour vous géolocaliser.';

  @override
  String get unableToFetchLocation =>
      'Impossible de récupérer la météo pour cet emplacement. Veuillez réessayer.';

  @override
  String failedToLoadWeather(String error) {
    return 'Échec du chargement de la météo : $error';
  }

  @override
  String get searchPlace => 'Rechercher un lieu';

  @override
  String get close => 'Fermer';

  @override
  String get cityRegionOrCoordinates => 'Ville, région ou coordonnées';

  @override
  String get loadingLocation => 'Chargement de l\'emplacement…';

  @override
  String get searchLocation => 'Rechercher un emplacement';

  @override
  String get useCurrentLocation => 'Utiliser l\'emplacement actuel';

  @override
  String get clear => 'Effacer';

  @override
  String get dummyTime => 'Lun 1er jan • 12:00';

  @override
  String get daytime => 'Journée';

  @override
  String get night => 'Nuit';

  @override
  String get dummyHighLow => 'H 80° · B 60°';

  @override
  String highLowTemp(String high, String low) {
    return 'H $high°  ·  B $low°';
  }

  @override
  String get feelsLike => 'Ressenti';

  @override
  String get humidity => 'Humidité';

  @override
  String get uvIndex => 'Indice UV';

  @override
  String get dewPoint => 'Point de rosée';

  @override
  String get wind => 'Vent';

  @override
  String get airQuality => 'Qualité de l\'air';

  @override
  String get visibility => 'Visibilité';

  @override
  String get precipChance => 'Risque de précipitations';

  @override
  String get hourlyForecast => 'Prévisions par heure';

  @override
  String get regionalOutlook => 'Prévisions régionales';

  @override
  String get dataFromOpenMeteo => 'Données issues d\'Open-Meteo';

  @override
  String get dataFromNea => 'Données issues de NEA';

  @override
  String get todaysSuggestion => 'Suggestion du jour';

  @override
  String get adviceRain => 'Enfilez une veste légère et continuez à marcher.';

  @override
  String get adviceSnow =>
      'Habillez-vous chaudement et faites attention aux chemins glissants.';

  @override
  String get adviceStorm => 'Restez à l\'intérieur ; risque d\'orage.';

  @override
  String get adviceClear =>
      'Il fait très clair dehors. Portez des lunettes de soleil.';

  @override
  String get adviceCloud =>
      'Le ciel est nuageux aujourd\'hui : une météo idéale pour se promener.';

  @override
  String get adviceDefault =>
      'Restez calme et vérifiez à nouveau dans quelques heures.';

  @override
  String get futureAdviceRain =>
      'Il risque de pleuvoir d\'ici environ 3 heures. Gardez un parapluie à portée de main.';

  @override
  String get futureAdviceSnow =>
      'Il va neiger plus tard dans la journée : prévoyez plus de temps pour vos déplacements.';

  @override
  String get futureAdviceStorm =>
      'Storm window in a few hours. Wrap up outdoor tasks soon.';

  @override
  String get futureAdviceClear =>
      'Le temps devrait rester stable dans les prochaines heures : c\'est le moment idéal pour profiter du grand air.';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get tomorrow => 'Demain';

  @override
  String nextDays(int count) {
    return 'Les $count prochains jours';
  }

  @override
  String get weather => 'Météo';

  @override
  String precipPercent(String percent) {
    return '$percent% de précipitations';
  }

  @override
  String toTime(String time) {
    return 'à $time';
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
    return 'Échec du chargement des statistiques : $error';
  }

  @override
  String get weatherInsights => 'Statistiques météo';

  @override
  String get analyzingConditions => 'Analyse des conditions…';

  @override
  String get activitySuggestions => 'Suggestions d\'activité';

  @override
  String get healthAndSafety => 'Santé et sécurité';

  @override
  String get whatToWear => 'Quoi porter';

  @override
  String get todaysTimeline => 'Prévisions de la journée';

  @override
  String get weekAhead => 'Semaine prochaine';

  @override
  String get selectLocationFromHome =>
      'Sélectionnez un emplacement depuis l\'accueil';

  @override
  String get toViewDetailedInsights =>
      'pour consulter les statistiques détaillées';

  @override
  String get widgetsRefreshed => 'Widgets actualisés';

  @override
  String widgetRefreshFailed(String error) {
    return 'Échec de l\'actualisation des widgets : $error';
  }

  @override
  String get language => 'Langue';

  @override
  String get systemDefault => 'Système';

  @override
  String get preferences => 'Préférences';

  @override
  String get useFahrenheit => 'Utiliser le Fahrenheit';

  @override
  String get showingFahrenheit => 'Affiche °F';

  @override
  String get showingCelsius => 'Affiche °C';

  @override
  String get about => 'À propos';

  @override
  String get openSourceLicenses => 'Licences Open-Source';

  @override
  String get viewLicensesForOpenSourcePackages =>
      'Voir les licences pour les paquets open-source';

  @override
  String usedInWeatherFastVersion(String version) {
    return ' utilisé dans WeatherFast $version';
  }

  @override
  String get debug => 'Débogage';

  @override
  String get forceRefreshWidgets => 'Forcer l\'actualisation des widgets';

  @override
  String get reloadWidgetDataWarning =>
      'Actualiser les données du widget (AVEC MODÉRATION !!!)';

  @override
  String get testRatingBottomSheet => 'Test Rating Bottom Sheet';

  @override
  String get simulateSuccessfulWeatherFetchTrigger =>
      'Simuler le succès de la récupération des données météo';

  @override
  String get resetRatingPreferences => 'Reset Rating Preferences';

  @override
  String get resetShownCountAndTimestamps => 'Reset shown count and timestamps';

  @override
  String get ratingPreferencesReset => 'Rating preferences reset';

  @override
  String get support => 'Assistance';

  @override
  String get systemStatus => 'État du système';

  @override
  String get checkOperationalStatusOfServices =>
      'Vérifier l\'état opérationnel des services';

  @override
  String get helpAndFeedback => 'Aide et commentaires';

  @override
  String get getHelpOrSendFeedback =>
      'Obtenir de l\'aider ou envoyer des commentaires';

  @override
  String versionBuildNumber(String version, String buildNumber) {
    return 'Version $version ($buildNumber)';
  }

  @override
  String get featureRequest => 'Demande de fonctionnalité';

  @override
  String get suggestFeature =>
      'Suggérer une nouvelle fonctionnalité pour WeatherFast';

  @override
  String get bugReport => 'Signaler un bug';

  @override
  String get reportBug => 'Signaler un bug ou un problème';

  @override
  String get notifications => 'Notifications';

  @override
  String get loadingNotificationTitle =>
      'Chargement du titre de la notification…';

  @override
  String get loadingNotificationDesc =>
      'Chargement de la description de la notification…';

  @override
  String failedToLoadNotifications(String error) {
    return 'Échec du chargement des notifications : $error';
  }

  @override
  String errorLoadingNotifications(String error) {
    return 'Erreur lors du chargement des notifications : $error';
  }

  @override
  String get retry => 'Réessayer';

  @override
  String get noNewNotifications => 'Aucune nouvelle notification';

  @override
  String get notificationTitle => 'Notification';

  @override
  String get couldNotOpenLink => 'Impossible d\'ouvrir le lien';

  @override
  String get openLink => 'Ouvrir le lien';

  @override
  String get mapSettings => 'Paramètres de la carte';

  @override
  String get radarOpacity => 'Opacité du radar';

  @override
  String get dataSources => 'Sources des données';

  @override
  String get mapLayers => 'Couches de la carte :';

  @override
  String get baseMapsMapbox => 'Les cartes de base sont fournies par Mapbox.';

  @override
  String get weatherData => 'Données météo :';

  @override
  String get livePrecipitationRainviewer =>
      'Les couches du radar de précipitations sont fournies par RainViewer.';

  @override
  String get attribution => 'Attribution :';

  @override
  String get attributionText =>
      '© Mapbox, © OpenStreetMap contributors, © RainViewer.';

  @override
  String get weatherMap => 'Carte météo';

  @override
  String get loading => 'Chargement…';

  @override
  String get enjoyingWeatherFast => 'Vous aimez WeatherFast ?';

  @override
  String get rateAppDescription =>
      'Si vous aimez utiliser notre application, merci de prendre un instant pour la noter dans le Play Store. Votre soutien compte beaucoup pour nous !';

  @override
  String get rateNow => 'Laisser un avis';

  @override
  String get remindMeLater => 'Me le rappeler dans 2 jours';

  @override
  String get noThanks => 'Non merci';

  @override
  String neaAttribution(String date) {
    return 'Contains information from 2-hour Weather Forecast, 24-hour Weather Forecast, 4-day Weather Forecast, Air Temperature across Singapore, Rainfall across Singapore, Relative Humidity across Singapore, Relative Humidity across Singapore, Wind Speed across Singapore, and Pollutant Standards Index (PSI) accessed on $date from the National Environment Agency which is made available under the terms of the ';
  }

  @override
  String get sgOpenDataLicence => 'Singapore Open Data Licence version 1.0';

  @override
  String get weatherDataProvidedByOM => 'Données météo fournies par Open-Meteo';

  @override
  String get neaWebsite => 'Site Web de NEA';

  @override
  String get dataGovSg => 'Data.gov.sg';

  @override
  String get website => 'Site Web';

  @override
  String get apiDocs => 'Documentation API';

  @override
  String get terms => 'Conditions d\'utilisation';

  @override
  String get loadingClearWeather => 'Effacer';

  @override
  String get loadingTempF => '72°F';

  @override
  String get tapToViewInteractiveRadar =>
      'Cliquez pour visualiser le radar interactif';

  @override
  String get weatherMapsUnavailableOnWeb =>
      'Les cartes météo ne sont pas disponibles sur le Web';

  @override
  String get interactiveWeatherRadarDescription =>
      'Le radar météo interactif et les cartes haute résolution sont optimisés pour notre expérience mobile.';

  @override
  String get getItOnPlayStore => 'Obtenir sur le Play Store';

  @override
  String get multipleFloodAlerts => 'Plusieurs alertes inondation';

  @override
  String activeWarnings(int count) {
    return '$count avertissements actifs';
  }

  @override
  String get tapToViewAllAlerts => 'Cliquez pour voir les alertes';

  @override
  String get activeFloodAlerts => 'Alertes inondation en cours';

  @override
  String get area => 'Zone';

  @override
  String get description => 'Description';

  @override
  String get instruction => 'Instructions';

  @override
  String get severity => 'Niveau de risque';

  @override
  String get response => 'Réponse';

  @override
  String get flashFloodWarning => 'Avertissement d\'inondation !';

  @override
  String get floodAlert => 'Alerte inondation';

  @override
  String incompleteLocalisationMessage(String language) {
    return 'La traduction pour la langue $language n\'est pas terminée.';
  }

  @override
  String get helpLocalizeWeatherFast => 'Aidez à traduire WeatherFast';

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
}
