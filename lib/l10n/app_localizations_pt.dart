// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get insights => 'Análises';

  @override
  String get settings => 'Configurações';

  @override
  String get updatingWeather => 'Atualizando clima…';

  @override
  String get locationServicesDisabled =>
      'Localização está desativada. Ative nas configurações.';

  @override
  String get locationPermissionDenied =>
      'A permissão de localização foi recusada. Ative para podemos relocalizar você.';

  @override
  String get unableToFetchLocation =>
      'Não foi possível obter o clima da localização. Por favor, tente novamente.';

  @override
  String failedToLoadWeather(String error) {
    return 'Não foi possível carregar tempor: $error';
  }

  @override
  String get searchPlace => 'Procurar Local';

  @override
  String get close => 'Fechar';

  @override
  String get cityRegionOrCoordinates => 'Cidade, Região, ou Coordenadas';

  @override
  String get loadingLocation => 'Procurando Localização…';

  @override
  String get searchLocation => 'Pesquisar Localização';

  @override
  String get useCurrentLocation => 'Usar Localização Atual';

  @override
  String get clear => 'Limpo';

  @override
  String get dummyTime => 'Seg, 1º de janeiro • 12:00 PM';

  @override
  String get daytime => 'Dia';

  @override
  String get night => 'Noite';

  @override
  String get dummyHighLow => 'Max. 80° · Min. 60°';

  @override
  String highLowTemp(String high, String low) {
    return 'Max $high°  ·  Min $low°';
  }

  @override
  String get feelsLike => 'Sensação de';

  @override
  String get humidity => 'Umidade';

  @override
  String get uvIndex => 'Índice UV';

  @override
  String get dewPoint => 'Ponto de orvalho';

  @override
  String get wind => 'Vento';

  @override
  String get airQuality => 'Qualidade do Ar';

  @override
  String get visibility => 'Visibilidade';

  @override
  String get precipChance => 'Chance de Chuva';

  @override
  String get hourlyForecast => 'Previsão Hora a Hora';

  @override
  String get regionalOutlook => 'Panorama Regional';

  @override
  String get dataFromOpenMeteo => 'Dados do Open-Meteo';

  @override
  String get dataFromNea => 'Dados de NEA';

  @override
  String get todaysSuggestion => 'Sugestão do Dia';

  @override
  String get adviceRain => 'Pegue uma jaqueta leve e continue andando.';

  @override
  String get adviceSnow =>
      'Bota um casaco e olho no chão: risco de escorregar.';

  @override
  String get adviceStorm => 'Risco de Trovões, fique em casa.';

  @override
  String get adviceClear => 'Dia lindo lá fora. Recomendo um óculos de sol.';

  @override
  String get adviceCloud =>
      'Céu nublado e fresquinho — clima perfeito para uma caminhada.';

  @override
  String get adviceDefault => 'Relaxa e confira de novo daqui algumas horas.';

  @override
  String get futureAdviceRain =>
      'Previsão de chuva dentro de 3 horas. Leve um guarda-chuva.';

  @override
  String get futureAdviceSnow =>
      'Previsão de neve hoje — planeje seu trajeto com um tempo extra.';

  @override
  String get futureAdviceStorm =>
      'Alerta de temporal vindo aí. Termine logo o que está fazendo fora.';

  @override
  String get futureAdviceClear =>
      'O tempo segue firme nas próximas horas — ótimo momento para ir para a rua.';

  @override
  String get today => 'Hoje';

  @override
  String get tomorrow => 'Amanhã';

  @override
  String nextDays(int count) {
    return 'Próximos $count dias';
  }

  @override
  String get weather => 'Tempo';

  @override
  String precipPercent(String percent) {
    return '$percent% de chuva';
  }

  @override
  String toTime(String time) {
    return 'às $time';
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
    return 'Ops! Não conseguimos carregar os Insights: $error';
  }

  @override
  String get weatherInsights => 'Análise do Tempo';

  @override
  String get analyzingConditions => 'Analizando Condições ...';

  @override
  String get activitySuggestions => 'Sugestões de Atividade';

  @override
  String get healthAndSafety => 'Saúde e Segurança';

  @override
  String get whatToWear => 'O que vestir';

  @override
  String get todaysTimeline => 'Cronograma de Hoje';

  @override
  String get weekAhead => 'Próxima Semana';

  @override
  String get selectLocationFromHome => 'Selecione uma localização para Casa';

  @override
  String get toViewDetailedInsights => 'Ver Análise Detalhada';

  @override
  String get widgetsRefreshed => 'Widgets Atualisados!😎';

  @override
  String widgetRefreshFailed(String error) {
    return 'Ops! Falha ao atualizar o widget: $error';
  }

  @override
  String get language => 'Idioma';

  @override
  String get systemDefault => 'Padrão do Sistema';

  @override
  String get preferences => 'Configurações';

  @override
  String get useFahrenheit => 'Usar Fahrenheit';

  @override
  String get showingFahrenheit => 'Mostrando °F';

  @override
  String get showingCelsius => 'Mostrando °C';

  @override
  String get about => 'Sobre';

  @override
  String get openSourceLicenses => 'Licença Open-Source';

  @override
  String get viewLicensesForOpenSourcePackages =>
      'Ver licenças dos pacotes open-source';

  @override
  String usedInWeatherFastVersion(String version) {
    return ' usados no WeatherFast $version';
  }

  @override
  String get debug => 'Depuração';

  @override
  String get forceRefreshWidgets => 'Forçar Atualização de Widgets';

  @override
  String get reloadWidgetDataWarning =>
      'Atualizar dados do widget (USE COM MODERAÇÃO!!!)';

  @override
  String get testRatingBottomSheet => 'Testar Tela de Avaliação';

  @override
  String get simulateSuccessfulWeatherFetchTrigger =>
      'Simular busca de clima com sucesso';

  @override
  String get resetRatingPreferences => 'Limpar histórico de avaliação';

  @override
  String get resetShownCountAndTimestamps =>
      'Redefinir contagem e carimbos de data/hora';

  @override
  String get ratingPreferencesReset => 'Preferências de rating resetadas';

  @override
  String get support => 'Suporte🧑‍💻';

  @override
  String get systemStatus => 'Status do Sistema';

  @override
  String get checkOperationalStatusOfServices =>
      'Verifique o status de operação dos serviços👀';

  @override
  String get helpAndFeedback => 'Ajuda ＆ Feedback';

  @override
  String get getHelpOrSendFeedback => 'Pedir ajuda ou mandar um Feedback';

  @override
  String versionBuildNumber(String version, String buildNumber) {
    return 'Versão $version ($buildNumber)';
  }

  @override
  String get featureRequest => 'Sugestões de melhorias';

  @override
  String get suggestFeature => 'Sugerir novas funções para o WeatherFast';

  @override
  String get bugReport => 'Reportar Bug';

  @override
  String get reportBug => 'Reportar um bug ou problema';

  @override
  String get notifications => 'Notificações';

  @override
  String get loadingNotificationTitle =>
      'Carregando o título da notificação...';

  @override
  String get loadingNotificationDesc =>
      'Carregando a descrição da notificação...';

  @override
  String failedToLoadNotifications(String error) {
    return 'Ops! Não conseguimos carregar as notificações: $error';
  }

  @override
  String errorLoadingNotifications(String error) {
    return 'Erro ao carregar as notificações: $error';
  }

  @override
  String get retry => 'Tentar Novamente';

  @override
  String get noNewNotifications => 'Nenhuma Notificação🔔';

  @override
  String get notificationTitle => 'Notificação';

  @override
  String get couldNotOpenLink => 'Não foi possível abrir link';

  @override
  String get openLink => 'Abrir Link';

  @override
  String get mapSettings => 'Configurações de Mapa';

  @override
  String get radarOpacity => 'Opacidade do Radar';

  @override
  String get dataSources => 'Fontes de Dados';

  @override
  String get mapLayers => 'Camadas do Mapa:';

  @override
  String get baseMapsMapbox => 'Os mapas base são fornecidos pelo Mapbox.';

  @override
  String get weatherData => 'Dados do Clima:';

  @override
  String get livePrecipitationRainviewer =>
      'As camadas do radar de chuva em tempo real são fornecidas pelo RainViewer.';

  @override
  String get attribution => 'Attribuição:';

  @override
  String get attributionText =>
      '© Mapbox, © OpenStreetMap contributors, © RainViewer.';

  @override
  String get weatherMap => 'Mapa do Clima';

  @override
  String get loading => 'Carregando...';

  @override
  String get enjoyingWeatherFast => 'Está curtindo o WeatherFast?';

  @override
  String get rateAppDescription =>
      'Se você está curtindo o nosso app, que tal tirar um minutinho para avaliar a gente na Play Store? Seu apoio faz toda a diferença para nós!';

  @override
  String get rateNow => 'Avalie Agora';

  @override
  String get remindMeLater => 'Me lembre daqui 2 dias';

  @override
  String get noThanks => 'Não, Obrigado';

  @override
  String neaAttribution(String date) {
    return 'Contém informações da Previsão do Tempo de 2h, 24h e 4 dias, além de Temperatura do Ar, Pluviosidade, Umidade Relativa, Velocidade do Vento e Índice de Poluentes (PSI) em Singapura, acessados em $date junto à National Environment Agency, disponibilizados sob os termos da Singapore Open Data Licence. ';
  }

  @override
  String get sgOpenDataLicence => 'Singapore Open Data Licence versão 1.0';

  @override
  String get weatherDataProvidedByOM =>
      'Dados meteorológicos fornecidos por Open-Meteo';

  @override
  String get neaWebsite => 'NEA Website';

  @override
  String get dataGovSg => 'Data.gov.sg';

  @override
  String get website => 'Website';

  @override
  String get apiDocs => 'API Docs';

  @override
  String get terms => 'Termos';

  @override
  String get loadingClearWeather => 'Limpar';

  @override
  String get loadingTempF => '72°F';

  @override
  String get tapToViewInteractiveRadar => 'Toque para abrir o radar interativo';

  @override
  String get weatherMapsUnavailableOnWeb => 'Mapas indisponíveis na versão Web';

  @override
  String get interactiveWeatherRadarDescription =>
      'O radar do tempo interativo e os mapas de alta resolução foram otimizados para a experiência no celular.';

  @override
  String get getItOnPlayStore => 'Obter no Play Store';

  @override
  String get multipleFloodAlerts => 'Múltiplos Alertas de Inundação';

  @override
  String activeWarnings(int count) {
    return '$count Alertas Ativos';
  }

  @override
  String get tapToViewAllAlerts => 'Toque para ver todos os alertas';

  @override
  String get activeFloodAlerts => 'Alertas de Inundação ativo';

  @override
  String get area => 'Área';

  @override
  String get description => 'Descrição';

  @override
  String get instruction => 'Instrução';

  @override
  String get severity => 'Intensidade';

  @override
  String get response => 'Resposta';

  @override
  String get flashFloodWarning => 'Alerta de enxurrada!';

  @override
  String get floodAlert => 'Alerta de Inundação';

  @override
  String incompleteLocalisationMessage(String language) {
    return 'A tradução para o idioma $language não foi concluída';
  }

  @override
  String get helpLocalizeWeatherFast => 'Ajude a traduzir o WeatherFast';

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
