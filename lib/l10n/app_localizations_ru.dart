// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get home => 'Главная';

  @override
  String get insights => 'Аналитика';

  @override
  String get settings => 'Настройки';

  @override
  String get updatingWeather => 'Обновление погоды…';

  @override
  String get locationServicesDisabled =>
      'Местоположение отключено. Включите показ местоположения в настройках.';

  @override
  String get locationPermissionDenied =>
      'Доступ к местоположению запрещён. Разрешите его для автоматического определения местоположения.';

  @override
  String get unableToFetchLocation =>
      'Не удалось получить данные о погоде в вашем регионе. Пожалуйста, попробуйте ещё раз.';

  @override
  String failedToLoadWeather(String error) {
    return 'Не удалось загрузить данные о погоде: $error';
  }

  @override
  String get searchPlace => 'Найти место';

  @override
  String get close => 'Закрыть';

  @override
  String get cityRegionOrCoordinates => 'Город, регион или координаты';

  @override
  String get loadingLocation => 'Загрузка локации…';

  @override
  String get searchLocation => 'Поиск локации';

  @override
  String get useCurrentLocation => 'Использовать текущее местоположение';

  @override
  String get clear => 'Ясно';

  @override
  String get dummyTime => 'Пн, 1 янв. • 12:00';

  @override
  String get daytime => 'Дневное время';

  @override
  String get night => 'Ночь';

  @override
  String get dummyHighLow => 'Макс. 80° · Мин. 60°';

  @override
  String highLowTemp(String high, String low) {
    return 'Макс. $high°  ·  Мин. $low°';
  }

  @override
  String get feelsLike => 'Ощущается как';

  @override
  String get humidity => 'Влажность';

  @override
  String get uvIndex => 'УФ-индекс';

  @override
  String get dewPoint => 'Точка росы';

  @override
  String get wind => 'Ветер';

  @override
  String get airQuality => 'Качество воздуха';

  @override
  String get visibility => 'Видимость';

  @override
  String get precipChance => 'Вероятность осадков';

  @override
  String get hourlyForecast => 'Почасовой прогноз';

  @override
  String get regionalOutlook => 'Обзор региона';

  @override
  String get dataFromOpenMeteo => 'Данные от Open-Meteo';

  @override
  String get dataFromNea => 'Данные от NEA';

  @override
  String get todaysSuggestion => 'Рекомендация на сегодня';

  @override
  String get adviceRain =>
      'Возьмите с собой лёгкую ветровку и продолжайте прогулку.';

  @override
  String get adviceSnow =>
      'Наденьте несколько слоёв одежды и будьте осторожны на скользкой дороге.';

  @override
  String get adviceStorm =>
      'Оставайтесь в помещении. Высокий риск удара молнии.';

  @override
  String get adviceClear =>
      'На улице яркое солнце. Рекомендуется надеть солнцезащитные очки.';

  @override
  String get adviceClearNight => 'Ясное небо сегодня вечером.';

  @override
  String get adviceCloud => 'Лёгкая облачность. Отличная погода для прогулки.';

  @override
  String get adviceDefault =>
      'Комфортная погода. Проверьте прогноз снова через несколько часов.';

  @override
  String get futureAdviceRain =>
      'Дождь будет примерно через ~3 часа. Захватите с собой зонтик.';

  @override
  String get futureAdviceSnow =>
      'Сегодня позже пойдёт снег. Закладывайте дополнительное время на дорогу.';

  @override
  String get futureAdviceStorm =>
      'Через несколько часов ожидается шторм. Завершите дела на улице как можно скорее.';

  @override
  String get futureAdviceClear =>
      'В ближайшие несколько часов погода останется стабильной. Самое время выйти на улицу.';

  @override
  String get today => 'Сегодня';

  @override
  String get tomorrow => 'Завтра';

  @override
  String nextDays(int count) {
    return 'Следующие­ $count дней';
  }

  @override
  String get weather => 'Погода';

  @override
  String precipPercent(String percent) {
    return '$percent% вероятность осадков';
  }

  @override
  String toTime(String time) {
    return 'до $time';
  }

  @override
  String windSpeed(String speed, String dir) {
    return '$speed км/ч $dir';
  }

  @override
  String visibilityKm(String dist) {
    return '$dist км';
  }

  @override
  String failedToLoadInsights(String error) {
    return 'Не удалось загрузить аналитику: $error';
  }

  @override
  String get weatherInsights => 'Аналитика погоды';

  @override
  String get analyzingConditions => 'Анализ условий...';

  @override
  String get activitySuggestions => 'Подходит для занятий';

  @override
  String get healthAndSafety => 'Здоровье и безопасность';

  @override
  String get whatToWear => 'Что надеть';

  @override
  String get todaysTimeline => 'Что на сегодня';

  @override
  String get weekAhead => 'Предстоящая неделя';

  @override
  String get selectLocationFromHome => 'Выбор местоположение на Главной';

  @override
  String get toViewDetailedInsights => 'Чтобы просмотреть подробную аналитику';

  @override
  String get widgetsRefreshed => 'Виджеты обновлены';

  @override
  String widgetRefreshFailed(String error) {
    return 'Ошибка обновления виджета: $error';
  }

  @override
  String get language => 'Язык';

  @override
  String get systemDefault => 'Системные настройки';

  @override
  String get preferences => 'Настройки';

  @override
  String get useFahrenheit => 'По Фаренгейту';

  @override
  String get showingFahrenheit => 'Показывать °F';

  @override
  String get showingCelsius => 'Показывать °C';

  @override
  String get about => 'О приложении';

  @override
  String get openSourceLicenses => 'Лицензии открытого исходного кода';

  @override
  String get viewLicensesForOpenSourcePackages =>
      'Просмотреть лицензии на пакеты с открытым исходным кодом';

  @override
  String usedInWeatherFastVersion(String version) {
    return ' используется в WeatherFast $version';
  }

  @override
  String get debug => 'Отладка';

  @override
  String get forceRefreshWidgets => 'Принудительное обновление виджетов';

  @override
  String get reloadWidgetDataWarning =>
      'Перезагрузка данных виджета (используйте редко!!!)';

  @override
  String get testRatingBottomSheet => 'Попробовать Нижний лист оценок';

  @override
  String get simulateSuccessfulWeatherFetchTrigger =>
      'Имитировать успешное получение данных о погоде';

  @override
  String get resetRatingPreferences => 'Сбросить настройки оценки';

  @override
  String get resetShownCountAndTimestamps =>
      'Сбросить показываемое количество и время';

  @override
  String get ratingPreferencesReset => 'Сброс настроек оценки';

  @override
  String get support => 'Поддержать';

  @override
  String get systemStatus => 'Состояние системы';

  @override
  String get checkOperationalStatusOfServices =>
      'Проверить рабочее состояние служб';

  @override
  String get helpAndFeedback => 'Помощь и обратная связь';

  @override
  String get getHelpOrSendFeedback => 'Получить помощь или отправить отзыв';

  @override
  String versionBuildNumber(String version, String buildNumber) {
    return 'Версия $version ($buildNumber)';
  }

  @override
  String get featureRequest => 'Запрос на добавление функции';

  @override
  String get suggestFeature => 'Предложите новую функцию для WeatherFast';

  @override
  String get bugReport => 'Сообщение об ошибке';

  @override
  String get reportBug => 'Сообщить об ошибке или проблеме';

  @override
  String get notifications => 'Уведомления';

  @override
  String get loadingNotificationTitle => 'Загрузка заголовка уведомления...';

  @override
  String get loadingNotificationDesc => 'Загрузка описания уведомления...';

  @override
  String failedToLoadNotifications(String error) {
    return 'Не удалось загрузить уведомления: $error';
  }

  @override
  String errorLoadingNotifications(String error) {
    return 'Ошибка загрузки уведомлений: $error';
  }

  @override
  String get retry => 'Повторить попытку';

  @override
  String get noNewNotifications => 'Нет новых уведомлений';

  @override
  String get notificationTitle => 'Уведомление';

  @override
  String get couldNotOpenLink => 'Не удалось открыть ссылку';

  @override
  String get openLink => 'Открыть ссылку';

  @override
  String get mapSettings => 'Настройки карты';

  @override
  String get radarOpacity => 'Радарная непрозрачность';

  @override
  String get dataSources => 'Источники данных';

  @override
  String get mapLayers => 'Слои карты:';

  @override
  String get baseMapsMapbox => 'Базовые карты предоставлены компанией Mapbox.';

  @override
  String get weatherData => 'Данные о погоде:';

  @override
  String get livePrecipitationRainviewer =>
      'Данные радара осадков в режиме реального времени предоставляются программой RainViewer.';

  @override
  String get attribution => 'Источник:';

  @override
  String get attributionText =>
      '© Mapbox, © участники OpenStreetMap, © RainViewer.';

  @override
  String get weatherMap => 'Карта погоды';

  @override
  String get loading => 'Загрузка...';

  @override
  String get enjoyingWeatherFast => 'Вам нравится WeatherFast?';

  @override
  String get rateAppDescription =>
      'Если вам нравится наше приложение, пожалуйста, уделите минутку, чтобы оценить его в Play Store. Ваша поддержка очень важна для нас!';

  @override
  String get rateNow => 'Оцените сейчас';

  @override
  String get remindMeLater => 'Напомнить через 2 дня';

  @override
  String get noThanks => 'Нет, спасибо';

  @override
  String neaAttribution(String date) {
    return 'Содержит информацию о прогнозах погоды на 2 часа, 24 часа, 4 дня, температуре воздуха в Сингапуре, количестве осадков в Сингапуре, относительной влажности в Сингапуре, скорости ветра в Сингапуре и индексе загрязнения воздуха (PSI) от Национального агентства по охране окружающей среды, а также предупреждения о наводнениях в Сингапуре от PUB, национального агентства по водным ресурсам Сингапура, доступ к которой был получен $date, и которая предоставляется в соответствии с условиями ';
  }

  @override
  String get sgOpenDataLicence =>
      'Сингапурская лицензия на открытые данные, версия 1.0';

  @override
  String get weatherDataProvidedByOM =>
      'Метеорологические данные предоставлены сайтом Open-Meteo';

  @override
  String get neaWebsite => 'Веб-сайт NEA';

  @override
  String get dataGovSg => 'Data.gov.sg';

  @override
  String get website => 'Веб-сайт';

  @override
  String get apiDocs => 'Документация API';

  @override
  String get terms => 'Условия';

  @override
  String get loadingClearWeather => 'Прозрачный';

  @override
  String get loadingTempF => '72°F';

  @override
  String get tapToViewInteractiveRadar =>
      'Нажмите, чтобы просмотреть интерактивный радар';

  @override
  String get weatherMapsUnavailableOnWeb =>
      'Карты погоды недоступны в интернете';

  @override
  String get interactiveWeatherRadarDescription =>
      'Интерактивный метеорологический радар и карты высокого разрешения оптимизированы для мобильных устройств.';

  @override
  String get getItOnPlayStore => 'Скачайте в Play Store';

  @override
  String get multipleFloodAlerts =>
      'Множественные предупреждения о наводнениях';

  @override
  String activeWarnings(int count) {
    return '$count активных предупреждений';
  }

  @override
  String get tapToViewAllAlerts => 'Нажмите, чтобы просмотреть все оповещения';

  @override
  String get activeFloodAlerts => 'Активные оповещения о наводнениях';

  @override
  String get area => 'Область';

  @override
  String get description => 'Описание';

  @override
  String get instruction => 'Инструкция';

  @override
  String get severity => 'Степень тяжести';

  @override
  String get response => 'Ответ';

  @override
  String get flashFloodWarning => 'Предупреждение о внезапном наводнении!';

  @override
  String get floodAlert => 'Предупреждение о наводнении';

  @override
  String incompleteLocalisationMessage(String language) {
    return 'Локализация для языка $language не завершена.';
  }

  @override
  String get helpLocalizeWeatherFast => 'Помогите локализовать WeatherFast';

  @override
  String get ok => 'Ладно';

  @override
  String get notificationsTooltip => 'Уведомления';

  @override
  String get units => 'Единицы';

  @override
  String get temperatureWindVisibility => 'Температура, ветер, видимость';

  @override
  String get temperature => 'Температура';

  @override
  String get celsius => 'Цельсий (°C)';

  @override
  String get fahrenheit => 'Фаренгейт (°F)';

  @override
  String get windSpeedLabel => 'Скорость ветра';

  @override
  String get unitKmh => 'км/ч';

  @override
  String get unitMph => 'миль/час';

  @override
  String get unitMs => 'м/с';

  @override
  String get unitKnots => 'узлы';

  @override
  String get unitKilometers => 'Километры (км)';

  @override
  String get unitMiles => 'Мили (миль)';

  @override
  String get performanceMode => 'Режим производительности';

  @override
  String get disableExtraVisualEffects =>
      'Отключить дополнительные визуальные эффекты';

  @override
  String get bestTimesTitle => 'Лучшее время';

  @override
  String get insightsActivityLimitOutdoorTitle =>
      'Ограничьте усилия на открытом воздухе';

  @override
  String get insightsActivityLimitOutdoorDesc =>
      'Качество воздуха плохое — лучше заниматься чем-нибудь светлым или в помещении';

  @override
  String get insightsActivityIndoorTitle => 'Занятия в помещении';

  @override
  String get insightsActivityIndoorDesc =>
      'Посетите музеи, кафе или развлекательные заведения в помещении';

  @override
  String get insightsActivityCyclingTitle =>
      'Идеально подходит для езды на велосипеде';

  @override
  String get insightsActivityCyclingDesc =>
      'Прекрасная погода для велосипедной прогулки — умеренная температура и ясное небо';

  @override
  String get insightsActivityOutdoorSportsTitle => 'Спорт на открытом воздухе';

  @override
  String get insightsActivityOutdoorSportsDesc =>
      'Идеальные условия для активного отдыха и занятий спортом на открытом воздухе';

  @override
  String get insightsActivityBeachTitle => 'День на пляже';

  @override
  String get insightsActivityBeachDesc =>
      'Идеальная погода для пляжа — не забудьте взять солнцезащитный крем!';

  @override
  String get insightsActivityHikingTitle => 'Погода для походов';

  @override
  String get insightsActivityHikingDesc =>
      'Прохладно и комфортно для прогулки на природе';

  @override
  String get insightsActivityGeneralTitle => 'Общие виды деятельности';

  @override
  String get insightsActivityGeneralDesc =>
      'Умеренная погода — планируйте соответственно';

  @override
  String get insightsHealthAirQualityTitle =>
      'Предупреждение о качестве воздуха';

  @override
  String get insightsHealthAirQualityDesc =>
      'Рекомендуется носить маску на улице и ограничить интенсивную физическую активность до улучшения качества воздуха.';

  @override
  String get insightsHealthUVTitle => 'Защита от УФ-излучения крайне важна';

  @override
  String get insightsHealthUVDesc =>
      'Наносите солнцезащитный крем с SPF 30+ каждые 2 часа. Носите солнцезащитные очки и шляпу.';

  @override
  String get insightsHealthHeatTitle => 'Пейте достаточно воды';

  @override
  String get insightsHealthHeatDesc =>
      'Пейте воду регулярно. Избегайте длительного пребывания на солнце с 11:00 до 15:00.';

  @override
  String get insightsHealthColdTitle => 'Предупреждение о холодной погоде';

  @override
  String get insightsHealthColdDesc =>
      'Остерегайтесь обморожения. Одевайтесь многослойно и закрывайте конечности.';

  @override
  String get insightsHealthWindTitle => 'Предупреждение о сильном ветре';

  @override
  String get insightsHealthWindDesc =>
      'Закрепите незакрепленные предметы. Соблюдайте осторожность за рулем.';

  @override
  String get insightsHealthOptimalTitle => 'Оптимальные условия';

  @override
  String get insightsHealthOptimalDesc =>
      'Прекрасная погода для физической активности и отдыха на свежем воздухе.';

  @override
  String get insightsClothingHot =>
      'Легкая, дышащая одежда. Рекомендуется головной убор и солнцезащитные очки.';

  @override
  String get insightsClothingWarm =>
      'Удобная летняя одежда. Легкие слои для утра/вечера.';

  @override
  String get insightsClothingMild =>
      'Рекомендуется куртка с длинными рукавами или легкая куртка.';

  @override
  String get insightsClothingCool =>
      'Необходима куртка или свитер. Рекомендуются длинные брюки.';

  @override
  String get insightsClothingCold =>
      'Теплая куртка необходима. Одевайтесь многослойно для комфорта.';

  @override
  String get insightsClothingFreeze =>
      'Необходимы теплая зимняя куртка, перчатки и несколько слоев теплой одежды.';

  @override
  String get insightsClothingRainSuffix =>
      ' Возьмите с собой зонтик или дождевик.';

  @override
  String get insightsHourlyMorning => 'Утро';

  @override
  String get insightsHourlyAfternoon => 'Полдень';

  @override
  String get insightsHourlyEvening => 'Вечер';

  @override
  String get insightsHourlyMorningChilly =>
      'Холодное начало дня — нужно пододеться';

  @override
  String get insightsHourlyMorningComfort => 'Утренняя комфортная температура';

  @override
  String get insightsHourlyAfternoonHot => 'В пик жары ищите тень';

  @override
  String get insightsHourlyAfternoonPleasant => 'Ожидается приятный полдень';

  @override
  String get insightsHourlyEveningCool => 'Прохладный вечер — возьмите куртку';

  @override
  String get insightsHourlyEveningMild => 'Вечером ожидается умеренная погода';

  @override
  String get insightsWeekLimitedData => 'Доступны ограниченные данные прогноза';

  @override
  String get insightsWeekDataUnavailable => 'Данные прогноза недоступны';

  @override
  String insightsWeekVariableSwing(String swing) {
    return 'Впереди переменчивая неделя с колебаниями температуры в $swing°C. ';
  }

  @override
  String get insightsWeekStable =>
      'Ожидаются стабильные условия с постоянной температурой. ';

  @override
  String get insightsWeekWarm =>
      'В течение всей недели будет в основном тепло.';

  @override
  String get insightsWeekCool => 'Сохраняется прохладная погода.';

  @override
  String get insightsWeekModerate => 'Преобладает умеренная температура.';

  @override
  String get insightsBestTimeSingapore => 'Лучшее время: 7-9 утра и 5-8 вечера';

  @override
  String get insightsBestTimeSingaporeDesc =>
      'Оптимальные условия для активного отдыха на открытом воздухе в Сингапуре';

  @override
  String get insightsBestTimeNoData => 'Нет данных';

  @override
  String get insightsBestTimeNoDataDesc =>
      'Не удалось определить оптимальное время';

  @override
  String get insightsBestTimeLimited => 'Ограниченные данные';

  @override
  String get insightsBestTimeLimitedDesc => 'Почасовые данные недоступны';

  @override
  String insightsBestTimeAt(String time) {
    return 'Лучшее время: $time';
  }

  @override
  String get insightsBestTimeDesc =>
      'Оптимальные условия для активного отдыха на открытом воздухе';

  @override
  String insightsTimeAM(String hour) {
    return '$hour утра';
  }

  @override
  String insightsTimePM(String hour) {
    return '$hour вечера';
  }

  @override
  String get insightsTimeNoon => '12 ночи';

  @override
  String get insightsRecRain => '☔ Возьмите зонт — возможен дождь';

  @override
  String get insightsRecHeatHigh =>
      '🌡️ Пейте больше воды — предупреждение о жаре';

  @override
  String get insightsRecHeatMid => '☀️ Нанесите солнцезащитный крем';

  @override
  String get insightsRecCold =>
      '🧊 Одевайтесь потеплее — будет холодная погода';

  @override
  String get insightsRecWind =>
      '💨 Закрепите незакрепленные предметы — сильный ветер';

  @override
  String get insightsRecUV => '🛡️ Высокое УФ-излучение — защитите вашу кожу';

  @override
  String get insightsRecAir =>
      '😷 Качество воздуха плохое — поменьше нагрузок на открытом воздухе';

  @override
  String get insightsRecWarming => '📈 Идёт на потепление — одевайтесь хорошо';

  @override
  String get insightsRecCooling => '📉 Будет холодать';

  @override
  String get insightsRecPleasant => '✨ Ожидается приятная погода';

  @override
  String get insightsSummaryAllClear =>
      'Все системы работают — впереди отличные условия!';

  @override
  String get insightsSummaryRain =>
      'Приближается дождливый день — подготовьтесь соответственно';

  @override
  String get insightsSummaryHeat => 'Жарко и интенсивно — держитесь в прохладе';

  @override
  String get insightsSummaryCold => 'Сильный мороз — одевайтесь потеплее';

  @override
  String get insightsSummaryWind => 'Ветреный день — держитесь шляпу';

  @override
  String get insightsSummaryUV => 'Сильный ультрафиолет — защититесь';

  @override
  String get insightsSummaryAir =>
      'Качество воздуха плохое — осторожнее на улице';

  @override
  String get insightsSummaryVariable => 'Ожидаются переменчивые условия';

  @override
  String get weatherChoreographer => 'События сегодняшнего дня';

  @override
  String get tomorrowsEvents => 'События завтрашнего дня';

  @override
  String get weatherChoreographerSubtitle =>
      'Укажите погоду для ваших мероприятий в календаре';

  @override
  String get calendarSettingsTitle => 'Синхронизация календаря';

  @override
  String get calendarSettingsSubtitle => 'Синхронизация календаря';

  @override
  String get calendarSettingsDescription =>
      'При включении этой функции WeatherFast будет сканировать выбранные вами календари на наличие событий с указанным местоположением. Затем он будет отображать персонализированную информацию о погоде прямо под основной карточкой погоды для этих местоположений.\n\nПримечание о конфиденциальности: WeatherFast никогда не отправляет данные календаря за пределы вашего устройства, и вся обработка происходит полностью на устройстве.';

  @override
  String get enableChoreographer => 'Включить синхронизацию календаря';

  @override
  String get showWeatherForCalendarEvents =>
      'Показать погоду для событий в календаре';

  @override
  String get selectCalendars => 'Выберите календари';

  @override
  String get noCalendarsFound => 'Календари не найдены, доступ запрещён.';

  @override
  String get unnamedCalendar => 'Безымянный календарь';

  @override
  String get newWeatherChoreographer => 'Новое: Синхронизация календаря';

  @override
  String get weatherChoreographerPromoDescription =>
      'Теперь WeatherFast может синхронизироваться с вашим календарем, чтобы отображать прогнозы погоды для ваших предстоящих событий прямо на главном экране.';

  @override
  String get weatherChoreographerPromoPrivacy =>
      'Примечание о конфиденциальности: Все данные календаря обрабатываются безопасно на вашем устройстве и никогда не передаются на серверы.';

  @override
  String get notNow => 'Не сейчас';

  @override
  String get enable => 'Давать возможность';

  @override
  String get resetCalendarPromo => 'Сбросить календарную акцию';

  @override
  String get resetCalendarPromoSubtitle =>
      'Сбросить отображаемое состояние нижней панели синхронизации календаря';

  @override
  String get calendarPromoReset => 'Сброс настроек промо настроек календаря';

  @override
  String get eventDetails => 'Подробности мероприятия';

  @override
  String weatherForArea(String area) {
    return 'Погода в $area';
  }

  @override
  String get loadingWeather => 'Загрузка информации о погоде...';

  @override
  String get noWeatherAvailable =>
      'Информация о погоде для данного места в настоящее время недоступна.';

  @override
  String get meetingEnvironment => 'Для проведения встреч';

  @override
  String get indoor => 'В помещении';

  @override
  String get outdoor => 'На открытом воздухе';

  @override
  String get smartRecommendations => 'Умные рекомендации';

  @override
  String get recCommuteRain =>
      'Прогнозируется дождь. Не забудьте взять с собой зонт или дождевик в дорогу!';

  @override
  String recCommuteHot(int temp) {
    return 'На улице очень жарко ($temp°). Для поездки на работу одевайтесь в легкую, дышащую одежду, но возьмите с собой что-нибудь лёгкое, так как в помещении с кондиционером может быть прохладно!';
  }

  @override
  String recCommuteCold(int temp) {
    return 'На улице холодно ($temp°). Одевайтесь теплой одеждой, чтобы вам было легче приспособиться, когда вы войдете в отапливаемое помещение.';
  }

  @override
  String get recIndoorAllClear =>
      '🏢 Поскольку ваша встреча пройдет в помещении, вы будете чувствовать себя комфортно и защищены от непогоды. Приятной встречи!';

  @override
  String get recIndoorCommuteHeader =>
      '🏢 Защищено в помещении: попав внутрь, вы будете защищены от непогоды. Для поездок на работу:\n';

  @override
  String get recOutdoorRain =>
      '⚠️ Ожидается дождь! Настоятельно рекомендуем взять с собой зонт или перенести встречу в помещение/под навес.';

  @override
  String recOutdoorHot(int temp) {
    return '🥵 На улице жарко ($temp°). Мы рекомендуем искать тень, носить одежду из дышащей ткани и пить достаточно воды.';
  }

  @override
  String recOutdoorCold(int temp) {
    return '🥶 На улице прохладно ($temp°). Оденьтесь потеплее, наденьте куртку и приготовьте горячий напиток.';
  }

  @override
  String recOutdoorWindy(String wind) {
    return '💨 Ожидаются порывистые ветры (до $wind км/ч). Закрепите вещи чтобы не сдуло.';
  }

  @override
  String get recOutdoorAllClear =>
      '🌳 Идеальная погода для встречи на открытом воздухе! Наслаждайтесь приятной погодой и свежим воздухом.';

  @override
  String get recOutdoorHeader => '🌳 Памятка на открытом воздухе:\n';

  @override
  String get savedLocations => 'Сохраненные места';

  @override
  String get saveLocation => 'Сохранить местоположение';

  @override
  String get removeLocation => 'Удалить местоположение';

  @override
  String get noSavedLocations => 'Сохраненные местоположения отсутствуют';

  @override
  String get locations => 'Места';

  @override
  String get currentLocation => 'Текущее место';

  @override
  String locationSavedMessage(String location) {
    return 'Сохранено $location';
  }
}
