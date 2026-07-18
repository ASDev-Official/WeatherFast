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
  String get night => 'Noche estos momentos';

  @override
  String get dummyHighLow => 'H 80° · L 60°';

  @override
  String highLowTemp(String high, String low) {
    return 'Max$high° · · · · · Min $low°';
  }

  @override
  String get feelsLike => 'Sensación termica';

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
      'Mucha luz solar afuera. Se recomienda usar lentes de sol y sombrero.';

  @override
  String get adviceClearNight => 'Cielos despejados está noche.';

  @override
  String get adviceCloud =>
      'Nubes ligeras, clima perfecto para salir a caminar.';

  @override
  String get adviceDefault => 'Mantente cómodo y revisa en unas horas mas.';

  @override
  String get futureAdviceRain =>
      'Probabilidad de lluvia en ~ 3 horas. Mantén un paraguas cercas.';

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
    return ' ·usedo en WeatherFast $version­';
  }

  @override
  String get debug => 'Depurar';

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
  String get resetRatingPreferences =>
      'Reiniciar preferencias de calificaciones';

  @override
  String get resetShownCountAndTimestamps =>
      'Reiniciar cuenta y marcas de tiempo';

  @override
  String get ratingPreferencesReset =>
      'Reiniciar preferencias de calificaciones';

  @override
  String get support => 'Soporte';

  @override
  String get systemStatus => 'Estatus del sistema';

  @override
  String get checkOperationalStatusOfServices =>
      'Revisar el estatus operacional de los servicios';

  @override
  String get helpAndFeedback => 'Ayuda y retroalimentación';

  @override
  String get getHelpOrSendFeedback =>
      'Obtener ayuda y enviar retroalimentación';

  @override
  String versionBuildNumber(String version, String buildNumber) {
    return 'Versión $version ($buildNumber)';
  }

  @override
  String get featureRequest => 'Solicitar característica';

  @override
  String get suggestFeature => 'Sugerir nueva característica para WeatherFast';

  @override
  String get bugReport => 'Reportar bug';

  @override
  String get reportBug => 'Reportar un bug o problema';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get loadingNotificationTitle => 'Cargando pantalla de notificación...';

  @override
  String get loadingNotificationDesc =>
      'Cargando descripción de notificación...';

  @override
  String failedToLoadNotifications(String error) {
    return 'Fallo al cargar notificaciones: $error';
  }

  @override
  String errorLoadingNotifications(String error) {
    return 'Error cargando notificaciones: $error';
  }

  @override
  String get retry => 'Reintentar';

  @override
  String get noNewNotifications => 'Sin notificaciones nuevas';

  @override
  String get notificationTitle => 'Notificación';

  @override
  String get couldNotOpenLink => 'No se pudo abrir el link';

  @override
  String get openLink => 'Abrir Link';

  @override
  String get mapSettings => 'Ajustes del Mapa';

  @override
  String get radarOpacity => 'Opacidad del Radar';

  @override
  String get dataSources => 'Fuentes de los Datos';

  @override
  String get mapLayers => 'Capas del Mapa:';

  @override
  String get baseMapsMapbox => 'Mapas Base proporcionados por Mapbox.';

  @override
  String get weatherData => 'Datos del Clima:';

  @override
  String get livePrecipitationRainviewer =>
      'RainViewer proporciona capas de radar de precipitación en tiempo real.';

  @override
  String get attribution => 'Atribución:';

  @override
  String get attributionText =>
      '© Mapbox, © Colaboradores de OpenStreetMap, © RainViewer.';

  @override
  String get weatherMap => 'Mapa Meteorológico';

  @override
  String get loading => 'Cargando...';

  @override
  String get enjoyingWeatherFast => '¿Disfrutas de WeatherFast?';

  @override
  String get rateAppDescription =>
      'Si te gusta nuestra aplicación, tómate un momento para valorarla en la Play Store. ¡Tu apoyo es muy importante para nosotros!';

  @override
  String get rateNow => 'Valora Ahora';

  @override
  String get remindMeLater => 'Recuérdamelo en 2 días';

  @override
  String get noThanks => 'No, gracias';

  @override
  String neaAttribution(String date) {
    return 'Contiene información de pronósticos meteorológicos de 2 horas, pronósticos meteorológicos de 24 horas, pronósticos meteorológicos de 4 días, temperatura del aire en Singapur, precipitaciones en Singapur, humedad relativa en Singapur, humedad relativa en Singapur, velocidad del viento en Singapur e índice de estándares de contaminantes (PSI) consultados el $date de la Agencia Nacional de Medio Ambiente, que se pone a disposición bajo los términos de la  · ';
  }

  @override
  String get sgOpenDataLicence =>
      'Licencia de Datos Abiertos de Singapore versión 1.0';

  @override
  String get weatherDataProvidedByOM =>
      'Datos meteorológicos proporcionados por Open-Meteo';

  @override
  String get neaWebsite => 'Sitio web de NEA';

  @override
  String get dataGovSg => 'Datos.gov.sg';

  @override
  String get website => 'Sitio web';

  @override
  String get apiDocs => 'Documentación de la API';

  @override
  String get terms => 'Términos';

  @override
  String get loadingClearWeather => 'Claro';

  @override
  String get loadingTempF => '72°F';

  @override
  String get tapToViewInteractiveRadar => 'Toca para ver el radar interactivo';

  @override
  String get weatherMapsUnavailableOnWeb =>
      'Mapas Meteorológicos no Disponibles en la Web';

  @override
  String get interactiveWeatherRadarDescription =>
      'El radar meteorológico interactivo y los mapas de alta resolución están optimizados para la experiencia móvil.';

  @override
  String get getItOnPlayStore => 'Consíguelo en Play Store';

  @override
  String get multipleFloodAlerts => 'Múltiples Alertas de Inundación';

  @override
  String activeWarnings(int count) {
    return '$count advertencias activas';
  }

  @override
  String get tapToViewAllAlerts => 'Toca para ver todas las alertas';

  @override
  String get activeFloodAlerts => 'Alertas de inundación activas';

  @override
  String get area => 'Area';

  @override
  String get description => 'Descripción';

  @override
  String get instruction => 'Instrucción';

  @override
  String get severity => 'Gravedad';

  @override
  String get response => 'Respuesta';

  @override
  String get flashFloodWarning => 'Alerta de inundación repentina!';

  @override
  String get floodAlert => 'Alerta de inundación';

  @override
  String incompleteLocalisationMessage(String language) {
    return 'La localización para el idioma $language no se ha completado.';
  }

  @override
  String get helpLocalizeWeatherFast => 'Ayuda a localizar WeatherFast';

  @override
  String get ok => 'OK';

  @override
  String get notificationsTooltip => 'Notificaciones';

  @override
  String get units => 'Unidades';

  @override
  String get temperatureWindVisibility => 'Temperatura, viento, visibilidad';

  @override
  String get temperature => 'Temperatura';

  @override
  String get celsius => 'Celsius (°C)';

  @override
  String get fahrenheit => 'Grados Fahrenheit (°F)';

  @override
  String get windSpeedLabel => 'Velocidad del viento';

  @override
  String get unitKmh => 'km/hora';

  @override
  String get unitMph => 'millas por hora';

  @override
  String get unitMs => 'm/s';

  @override
  String get unitKnots => 'nudos';

  @override
  String get unitKilometers => 'Kilómetros (km)';

  @override
  String get unitMiles => 'Millas (mi)';

  @override
  String get performanceMode => 'Modo de rendimiento';

  @override
  String get disableExtraVisualEffects =>
      'Desactivar efectos visuales adicionales';

  @override
  String get bestTimesTitle => 'Los mejores momentos';

  @override
  String get insightsActivityLimitOutdoorTitle =>
      'Limitar el esfuerzo al aire libre';

  @override
  String get insightsActivityLimitOutdoorDesc =>
      'La calidad del aire es mala; se recomienda optar por actividades ligeras o en interiores';

  @override
  String get insightsActivityIndoorTitle => 'Actividades de interior';

  @override
  String get insightsActivityIndoorDesc =>
      'Visita museos, cafeterías o disfruta del entretenimiento bajo techo';

  @override
  String get insightsActivityCyclingTitle => 'Perfecto para el ciclismo';

  @override
  String get insightsActivityCyclingDesc =>
      'Un tiempo estupendo para dar un paseo en bicicleta: temperaturas suaves y cielos despejados';

  @override
  String get insightsActivityOutdoorSportsTitle => 'Deportes al aire libre';

  @override
  String get insightsActivityOutdoorSportsDesc =>
      'Condiciones ideales para actividades y deportes al aire libre';

  @override
  String get insightsActivityBeachTitle => 'Día de playa';

  @override
  String get insightsActivityBeachDesc =>
      '¡Clima perfecto para la playa! ¡No olvides el protector solar!';

  @override
  String get insightsActivityHikingTitle => 'Clima para hacer senderismo';

  @override
  String get insightsActivityHikingDesc =>
      'Fresco y cómodo para un paseo por la naturaleza';

  @override
  String get insightsActivityGeneralTitle => 'Actividades generales';

  @override
  String get insightsActivityGeneralDesc =>
      'Clima moderado: planifique en consecuencia';

  @override
  String get insightsHealthAirQualityTitle =>
      'Alerta sobre la calidad del aire';

  @override
  String get insightsHealthAirQualityDesc =>
      'Considere usar mascarilla al aire libre y limite la actividad física intensa hasta que mejore la calidad del aire.';

  @override
  String get insightsHealthUVTitle => 'Protección UV fundamental';

  @override
  String get insightsHealthUVDesc =>
      'Aplícate protector solar con FPS 30+ cada 2 horas. Usa gafas de sol y sombrero.';

  @override
  String get insightsHealthHeatTitle => 'Mantente hidratado';

  @override
  String get insightsHealthHeatDesc =>
      'Beba agua con regularidad. Evite la exposición prolongada al sol entre las 12:00 y las 5:00.';

  @override
  String get insightsHealthColdTitle => 'Alerta de clima frío';

  @override
  String get insightsHealthColdDesc =>
      'Esté atento a la congelación. Vístase con varias capas de ropa y cúbrase las extremidades.';

  @override
  String get insightsHealthWindTitle => 'Aviso sobre vientos fuertes';

  @override
  String get insightsHealthWindDesc =>
      'Asegure los objetos sueltos. Tenga precaución al conducir.';

  @override
  String get insightsHealthOptimalTitle => 'Condiciones óptimas';

  @override
  String get insightsHealthOptimalDesc =>
      'Clima perfecto para la actividad física y para disfrutar del aire libre.';

  @override
  String get insightsClothingHot =>
      'Ropa ligera y transpirable. Se recomienda llevar sombrero y gafas de sol.';

  @override
  String get insightsClothingWarm =>
      'Ropa cómoda para el verano. Capas ligeras para la mañana y la noche.';

  @override
  String get insightsClothingMild =>
      'Se recomienda llevar manga larga o una chaqueta ligera.';

  @override
  String get insightsClothingCool =>
      'Se necesita chaqueta o suéter. Se recomienda usar pantalones largos.';

  @override
  String get insightsClothingCold =>
      'Una chaqueta abrigada es imprescindible. Vístete por capas para mayor comodidad.';

  @override
  String get insightsClothingFreeze =>
      'Se requiere abrigo grueso de invierno, guantes y ropa de abrigo.';

  @override
  String get insightsClothingRainSuffix => ' Lleva ropa impermeable.';

  @override
  String get insightsHourlyMorning => 'Mañana dia';

  @override
  String get insightsHourlyAfternoon => 'Tarde';

  @override
  String get insightsHourlyEvening => 'La Noche';

  @override
  String get insightsHourlyMorningChilly =>
      'Comienzo frío: se necesita una capa de ropa adicional';

  @override
  String get insightsHourlyMorningComfort =>
      'Temperaturas agradables por la mañana';

  @override
  String get insightsHourlyAfternoonHot => 'Máximo calor: busque sombra';

  @override
  String get insightsHourlyAfternoonPleasant => 'Se espera una tarde agradable';

  @override
  String get insightsHourlyEveningCool =>
      'Noche fresca; Recomendación lleve una chaqueta';

  @override
  String get insightsHourlyEveningMild => 'Noche fresca; lleve una chaqueta';

  @override
  String get insightsWeekLimitedData =>
      'Datos de pronóstico limitados disponibles';

  @override
  String get insightsWeekDataUnavailable => 'Datos de previsión no disponibles';

  @override
  String insightsWeekVariableSwing(String swing) {
    return 'Semana variable por delante con una variación de temperatura de $swing°C ';
  }

  @override
  String get insightsWeekStable =>
      'Se prevén condiciones estables con temperaturas constantes. ';

  @override
  String get insightsWeekWarm => 'Generalmente cálido durante toda la semana.';

  @override
  String get insightsWeekCool => 'Persiste el patrón de clima frío.';

  @override
  String get insightsWeekModerate => 'Predominan las temperaturas moderadas.';

  @override
  String get insightsBestTimeSingapore =>
      'Mejor horario: de 7 a 9 de la mañana y de 5 a 8 de la tarde';

  @override
  String get insightsBestTimeSingaporeDesc =>
      'Condiciones óptimas para actividades al aire libre en Singapur';

  @override
  String get insightsBestTimeNoData => 'No hay datos';

  @override
  String get insightsBestTimeNoDataDesc =>
      'No se pueden determinar los mejores momentos';

  @override
  String get insightsBestTimeLimited => 'Datos limitados';

  @override
  String get insightsBestTimeLimitedDesc => 'Datos por hora no disponibles';

  @override
  String insightsBestTimeAt(String time) {
    return 'Mejor momento: $time';
  }

  @override
  String get insightsBestTimeDesc =>
      'Condiciones óptimas para actividades al aire libre';

  @override
  String insightsTimeAM(String hour) {
    return '$hour . AM';
  }

  @override
  String insightsTimePM(String hour) {
    return '$hour PM';
  }

  @override
  String get insightsTimeNoon => '12:00 PM';

  @override
  String get insightsRecRain => '☔ Lleva un paraguas: es probable que llueva';

  @override
  String get insightsRecHeatHigh => '🌡️ Mantente hidratado: alerta por calor';

  @override
  String get insightsRecHeatMid => '☀️ Aplícate protector solar';

  @override
  String get insightsRecCold => '🧊 Abrígate bien: se avecina frío';

  @override
  String get insightsRecWind =>
      '💨 Asegure los objetos sueltos: vientos fuertes';

  @override
  String get insightsRecUV => '🛡️ Alta protección UV: protege tu piel';

  @override
  String get insightsRecAir =>
      '😷 La calidad del aire es mala; limite el esfuerzo físico al aire libre';

  @override
  String get insightsRecWarming => '📈 Tendencia de calor: vístete por capas';

  @override
  String get insightsRecCooling =>
      '📉 Se avecina una tendencia de enfriamiento';

  @override
  String get insightsRecPleasant => '✨ Se espera buen tiempo';

  @override
  String get insightsSummaryAllClear =>
      '¡Todo listo! ¡Se avecinan excelentes condiciones!';

  @override
  String get insightsSummaryRain => 'Se avecina un día lluvioso: prepárense';

  @override
  String get insightsSummaryHeat => 'Caliente e intenso: mantente fresco';

  @override
  String get insightsSummaryCold => 'Condiciones gélidas: abríguese bien';

  @override
  String get insightsSummaryWind => 'Día ventoso: sujétate bien el sombrero';

  @override
  String get insightsSummaryUV => 'Fuerte radiación UV: protégete';

  @override
  String get insightsSummaryAir =>
      'La calidad del aire es mala; tómelo con calma al salir';

  @override
  String get insightsSummaryVariable => 'Se esperan condiciones variables';

  @override
  String get weatherChoreographer => 'Eventos de hoy';

  @override
  String get tomorrowsEvents => 'Eventos de mañana';

  @override
  String get weatherChoreographerSubtitle =>
      'Consulta el pronóstico del tiempo para los eventos de tu calendario';

  @override
  String get calendarSettingsTitle => 'Sincronización del calendario';

  @override
  String get calendarSettingsSubtitle => 'Sincronización del calendario';

  @override
  String get calendarSettingsDescription =>
      'Cuando está activada, WeatherFast escanea los calendarios seleccionados en busca de eventos con una ubicación específica. A continuación, muestra información meteorológica personalizada justo debajo de la tarjeta principal del tiempo para esas ubicaciones.\n\nNota de privacidad: WeatherFast nunca envía datos del calendario fuera de tu dispositivo; todo el procesamiento se realiza completamente en tu dispositivo.';

  @override
  String get enableChoreographer =>
      'Habilitar la sincronización del calendario';

  @override
  String get showWeatherForCalendarEvents =>
      'Mostrar el pronóstico del tiempo para los eventos del calendario';

  @override
  String get selectCalendars => 'Seleccionar calendarios';

  @override
  String get noCalendarsFound =>
      'No se encontraron calendarios o se denegó el permiso.';

  @override
  String get unnamedCalendar => 'Calendario sin nombre';

  @override
  String get newWeatherChoreographer =>
      'Novedad: Sincronización del calendario';

  @override
  String get weatherChoreographerPromoDescription =>
      'Ahora WeatherFast puede sincronizarse con tu calendario para mostrarte los pronósticos meteorológicos de tus próximos eventos directamente en la pantalla de inicio.';

  @override
  String get weatherChoreographerPromoPrivacy =>
      'Nota sobre privacidad: Todos los datos del calendario se procesan de forma segura en su dispositivo y nunca se envían a ningún servidor.';

  @override
  String get notNow => 'Ahora no';

  @override
  String get enable => 'Permitir';

  @override
  String get resetCalendarPromo => 'Promoción de reinicio del calendario';

  @override
  String get resetCalendarPromoSubtitle =>
      'Restablecer el estado mostrado de la hoja inferior de Sincronización del calendario';

  @override
  String get calendarPromoReset =>
      'Restablecimiento de las preferencias de promoción del calendario';

  @override
  String get eventDetails => 'Detalles del evento';

  @override
  String weatherForArea(String area) {
    return 'El tiempo en $area';
  }

  @override
  String get loadingWeather => 'Cargando detalles meteorológicos...';

  @override
  String get noWeatherAvailable =>
      'Actualmente no se dispone de información meteorológica para esta ubicación.';

  @override
  String get meetingEnvironment => 'Entorno de reunión';

  @override
  String get indoor => 'Interior';

  @override
  String get outdoor => 'Exterior';

  @override
  String get smartRecommendations => 'Recomendaciones inteligentes';

  @override
  String get recCommuteRain =>
      'Se pronostican lluvias. ¡No olvides llevar un paraguas o un impermeable para tu trayecto!';

  @override
  String recCommuteHot(int temp) {
    return 'Afuera hace mucho calor ($temp°). Vístete con ropa ligera y transpirable para ir al trabajo, ¡pero lleva una prenda de abrigo ligera, ya que el aire acondicionado en interiores podría estar frío!';
  }

  @override
  String recCommuteCold(int temp) {
    return 'Afuera hace frío ($temp°). Vístase con varias capas de ropa abrigada para que pueda aclimatarse fácilmente una vez que entre al recinto climatizado.';
  }

  @override
  String get recIndoorAllClear =>
      '🏢 Como la reunión se celebra en interiores, estarás cómodo y protegido de las inclemencias del tiempo. ¡Disfruta de la reunión!';

  @override
  String get recIndoorCommuteHeader =>
      '🏢 Protegido en interiores: Una vez dentro, estarás protegido de las inclemencias del tiempo. Para tu trayecto diario:\n';

  @override
  String get recOutdoorRain =>
      '⚠️ ¡Se esperan lluvias! Recomendamos encarecidamente traer un paraguas o trasladar la reunión a un lugar cubierto.';

  @override
  String recOutdoorHot(int temp) {
    return '🥵 Hace calor afuera ($temp°). Le sugerimos buscar sombra, usar ropa transpirable y mantenerse hidratado.';
  }

  @override
  String recOutdoorCold(int temp) {
    return '🥶 Hace frío afuera ($temp°). Abrígate bien con una chaqueta y considera tomar una bebida caliente.';
  }

  @override
  String recOutdoorWindy(String wind) {
    return '💨 Se esperan vientos fuertes (hasta $wind km/h). Asegure bien cualquier papel o material suelto.';
  }

  @override
  String get recOutdoorAllClear =>
      '🌳 ¡Clima perfecto para una reunión al aire libre! Disfruta del clima agradable y del aire fresco.';

  @override
  String get recOutdoorHeader => '🌳 Aviso para exteriores:\n';

  @override
  String get savedLocations => 'Ubicaciones guardadas';

  @override
  String get saveLocation => 'Guardar ubicación';

  @override
  String get removeLocation => 'Eliminar ubicación';

  @override
  String get noSavedLocations => 'No hay ubicaciones guardadas';

  @override
  String get locations => 'Ubicaciones';

  @override
  String get currentLocation => 'Ubicación actual';

  @override
  String locationSavedMessage(String location) {
    return 'Guardado $location';
  }
}
