// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get home => 'Inicio';

  @override
  String get insights => 'Panorama';

  @override
  String get settings => 'Ajustes';

  @override
  String get updatingWeather => 'Cargando clima…';

  @override
  String get locationServicesDisabled =>
      'El servicio de localización se encuentra desactivado. Activelo en ajustes.';

  @override
  String get locationPermissionDenied =>
      'Permiso de localización negado. Activelo para usar la auto localización.';

  @override
  String get unableToFetchLocation =>
      'No se pudo obtener el clima de la ubicación. Intente más tarde.';

  @override
  String failedToLoadWeather(String error) {
    return 'Error al cargar el clima: $error';
  }

  @override
  String get searchPlace => 'Buscar un lugar';

  @override
  String get close => 'Cerrar';

  @override
  String get cityRegionOrCoordinates => 'Ciudad, región o coordenadas';

  @override
  String get loadingLocation => 'Cargando ubicación…';

  @override
  String get searchLocation => 'Buscar ubicación';

  @override
  String get useCurrentLocation => 'Usar ubicación actual';

  @override
  String get clear => 'Despejado';

  @override
  String get dummyTime => 'Lun, Ene 1 • 12:00 PM';

  @override
  String get daytime => 'Día';

  @override
  String get night => 'Noche';

  @override
  String get dummyHighLow => 'H 80° · L 60°';

  @override
  String highLowTemp(String high, String low) {
    return 'H $high°  ·  L $low°';
  }

  @override
  String get feelsLike => 'Se siente como';

  @override
  String get humidity => 'Humedad';

  @override
  String get uvIndex => 'Índice UV';

  @override
  String get dewPoint => 'Punto de rocío';

  @override
  String get wind => 'Viento';

  @override
  String get airQuality => 'Calidad del aire';

  @override
  String get visibility => 'Visibilidad';

  @override
  String get precipChance => 'Probabilidad de lluvia';

  @override
  String get hourlyForecast => 'Pronostico por hora';

  @override
  String get regionalOutlook => 'Perspectiva regional';

  @override
  String get dataFromOpenMeteo => 'Datos de Open-Meteo';

  @override
  String get dataFromNea => 'Datos de NEA';

  @override
  String get todaysSuggestion => 'Sugerencia para hoy';

  @override
  String get adviceRain => 'Toma un paraguas y continúa con tu día.';

  @override
  String get adviceSnow => 'Abrígate bien y cuidado con el suelo resbaloso.';

  @override
  String get adviceStorm => 'Evita salir, riesgo de rayos.';

  @override
  String get adviceClear =>
      'Mucha luz solar afuera. Se recomienda usar lentes de sol.';

  @override
  String get adviceClearNight => 'Cielos despejados está noche.';

  @override
  String get adviceCloud =>
      'Nubes ligeras, clima perfecto para salir a caminar.';

  @override
  String get adviceDefault => 'Mantente cómodo y revisa en unas horas mas.';

  @override
  String get futureAdviceRain =>
      'Probabilidad de lluvia en ~ 3 horas. Mantén una sombrilla cercas.';

  @override
  String get futureAdviceSnow =>
      'Probabilidad de nevada más tarde, planea tus viajes con un extra de tiempo.';

  @override
  String get futureAdviceStorm =>
      'Posible tormenta en las próximas horas. Termina tus actividades al aire libre pronto.';

  @override
  String get futureAdviceClear =>
      'Las próximas horas permanecerán sin cambios, hace buen tiempo para salir.';

  @override
  String get today => 'Hoy';

  @override
  String get tomorrow => 'Mañana';

  @override
  String nextDays(int count) {
    return 'Proximos $count dias';
  }

  @override
  String get weather => 'Clima';

  @override
  String precipPercent(String percent) {
    return '$percent% de precipitación';
  }

  @override
  String toTime(String time) {
    return 'hasta $time';
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
    return 'Error al cargar el panorama: $error';
  }

  @override
  String get weatherInsights => 'Panorama del clima';

  @override
  String get analyzingConditions => 'Analizando condiciones...';

  @override
  String get activitySuggestions => 'Actividades sugeridas';

  @override
  String get healthAndSafety => 'Salud y Seguridad';

  @override
  String get whatToWear => 'Que vestir';

  @override
  String get todaysTimeline => 'Linea del tiempo para hoy';

  @override
  String get weekAhead => 'Semanas en avanzada';

  @override
  String get selectLocationFromHome => 'Elegir ubicación de casa';

  @override
  String get toViewDetailedInsights => 'para ver el panorama detallado';

  @override
  String get widgetsRefreshed => 'Widgets actualizados';

  @override
  String widgetRefreshFailed(String error) {
    return 'Actualización fallida del widget: $error';
  }

  @override
  String get language => 'Lenguaje';

  @override
  String get systemDefault => 'Determinado por el sistema';

  @override
  String get preferences => 'Preferencias';

  @override
  String get useFahrenheit => 'Usar Fahrenheit';

  @override
  String get showingFahrenheit => 'Mostrando °F';

  @override
  String get showingCelsius => 'Mostrando °C';

  @override
  String get about => 'Acerca';

  @override
  String get openSourceLicenses => 'Licencias Open-Source';

  @override
  String get viewLicensesForOpenSourcePackages =>
      'Ver licencias de paquetes open-source';

  @override
  String usedInWeatherFastVersion(String version) {
    return ' usedo en WeatherFast $version';
  }

  @override
  String get debug => 'Debug';

  @override
  String get forceRefreshWidgets => 'Forzar actualización de widgets';

  @override
  String get reloadWidgetDataWarning =>
      'Recargar datos del widget (USA SPARINGLY!!!)';

  @override
  String get testRatingBottomSheet =>
      'Hoja de resumen de la calificación de la prueba';

  @override
  String get simulateSuccessfulWeatherFetchTrigger =>
      'Simular trigger de obtención exitosa del clima';

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

  @override
  String get savedLocations => 'Saved Locations';

  @override
  String get saveLocation => 'Save Location';

  @override
  String get removeLocation => 'Remove Location';

  @override
  String get noSavedLocations => 'No saved locations';

  @override
  String get locations => 'Locations';

  @override
  String get currentLocation => 'Current Location';

  @override
  String locationSavedMessage(String location) {
    return 'Saved $location';
  }
}
