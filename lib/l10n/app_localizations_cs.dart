// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get home => 'Domů';

  @override
  String get insights => 'Přehledy';

  @override
  String get settings => 'Nastavení';

  @override
  String get updatingWeather => 'Aktualizace počasí…';

  @override
  String get locationServicesDisabled =>
      'Služby určování polohy jsou vypnuté. Zapněte je v Nastavení.';

  @override
  String get locationPermissionDenied =>
      'Oprávnění k poloze bylo odepřeno. Zapněte ho, aby aplikace mohla určit vaši polohu.';

  @override
  String get unableToFetchLocation =>
      'Počasí pro dané místo se nepodařilo načíst. Zkuste to prosím znovu.';

  @override
  String failedToLoadWeather(String error) {
    return 'Počasí se nepodařilo načíst: $error';
  }

  @override
  String get searchPlace => 'Hledat místo';

  @override
  String get close => 'Zavřít';

  @override
  String get cityRegionOrCoordinates => 'Město, region nebo souřadnice';

  @override
  String get loadingLocation => 'Načítání místa…';

  @override
  String get searchLocation => 'Hledat místo';

  @override
  String get useCurrentLocation => 'Použít aktuální polohu';

  @override
  String get clear => 'Jasno';

  @override
  String get dummyTime => 'Po, 1. ledna • 12:00';

  @override
  String get daytime => 'Den';

  @override
  String get night => 'Noc';

  @override
  String get dummyHighLow => 'Max. 80° · Min. 60°';

  @override
  String highLowTemp(String high, String low) {
    return 'Max. $high°  ·  Min. $low°';
  }

  @override
  String get feelsLike => 'Pocitová teplota';

  @override
  String get humidity => 'Vlhkost';

  @override
  String get uvIndex => 'UV index';

  @override
  String get dewPoint => 'Rosný bod';

  @override
  String get wind => 'Vítr';

  @override
  String get airQuality => 'Kvalita ovzduší';

  @override
  String get visibility => 'Dohlednost';

  @override
  String get precipChance => 'Pravděpodobnost srážek';

  @override
  String get hourlyForecast => 'Hodinová předpověď';

  @override
  String get regionalOutlook => 'Výhled pro region';

  @override
  String get dataFromOpenMeteo => 'Data od Open-Meteo';

  @override
  String get dataFromNea => 'Data od NEA';

  @override
  String get todaysSuggestion => 'Dnešní doporučení';

  @override
  String get adviceRain =>
      'Vezměte si lehkou bundu do deště a nezastavujte se.';

  @override
  String get adviceSnow => 'Oblékněte se ve vrstvách a pozor na kluzké cesty.';

  @override
  String get adviceStorm => 'Zůstaňte uvnitř; hrozí blesky.';

  @override
  String get adviceClear =>
      'Venku je skvělé světlo. Doporučujeme sluneční brýle.';

  @override
  String get adviceClearNight => 'Dnes v noci bude jasná obloha.';

  @override
  String get adviceCloud =>
      'Dnes mírná oblačnost — ideální počasí na procházku.';

  @override
  String get adviceDefault =>
      'Zůstaňte v pohodlí a za několik hodin se podívejte znovu.';

  @override
  String get futureAdviceRain =>
      'Asi za 3 hodiny bude pravděpodobně pršet. Mějte po ruce deštník.';

  @override
  String get futureAdviceSnow =>
      'Později dnes bude sněžit — na cestu si vyhraďte více času.';

  @override
  String get futureAdviceStorm =>
      'Během několika hodin hrozí bouřka. Venkovní činnosti brzy dokončete.';

  @override
  String get futureAdviceClear =>
      'V příštích hodinách bude počasí stabilní — vhodná doba být venku.';

  @override
  String get today => 'Dnes';

  @override
  String get tomorrow => 'Zítra';

  @override
  String nextDays(int count) {
    return '${count}denní předpověď';
  }

  @override
  String get weather => 'Počasí';

  @override
  String precipPercent(String percent) {
    return 'Srážky: $percent %';
  }

  @override
  String toTime(String time) {
    return 'do $time';
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
    return 'Analýzu se nepodařilo načíst: $error';
  }

  @override
  String get weatherInsights => 'Přehledy počasí';

  @override
  String get analyzingConditions => 'Probíhá analýza podmínek…';

  @override
  String get activitySuggestions => 'Návrhy aktivit';

  @override
  String get healthAndSafety => 'Zdraví a bezpečnost';

  @override
  String get whatToWear => 'Co si obléct';

  @override
  String get todaysTimeline => 'Dnešní časová osa';

  @override
  String get weekAhead => 'Příští týden';

  @override
  String get selectLocationFromHome => 'Vyberte místo na domovské obrazovce';

  @override
  String get toViewDetailedInsights => 'pro zobrazení podrobné analýzy';

  @override
  String get widgetsRefreshed => 'Widgety byly aktualizovány';

  @override
  String widgetRefreshFailed(String error) {
    return 'Aktualizace widgetu se nezdařila: $error';
  }

  @override
  String get language => 'Jazyk';

  @override
  String get systemDefault => 'Výchozí nastavení systému';

  @override
  String get preferences => 'Předvolby';

  @override
  String get useFahrenheit => 'Použít stupně Fahrenheita';

  @override
  String get showingFahrenheit => 'Zobrazuje se °F';

  @override
  String get showingCelsius => 'Zobrazuje se °C';

  @override
  String get about => 'O aplikaci';

  @override
  String get openSourceLicenses => 'Licence otevřeného softwaru';

  @override
  String get viewLicensesForOpenSourcePackages =>
      'Zobrazit licence balíčků s otevřeným zdrojovým kódem';

  @override
  String usedInWeatherFastVersion(String version) {
    return ' použitých ve WeatherFast $version';
  }

  @override
  String get debug => 'Ladění';

  @override
  String get forceRefreshWidgets => 'Vynutit aktualizaci widgetů';

  @override
  String get reloadWidgetDataWarning =>
      'Znovu načíst data widgetu (POUŽÍVEJTE STŘÍDMĚ!)';

  @override
  String get testRatingBottomSheet => 'Otestovat spodní panel hodnocení';

  @override
  String get simulateSuccessfulWeatherFetchTrigger =>
      'Simulovat úspěšné načtení počasí';

  @override
  String get resetRatingPreferences => 'Resetovat předvolby hodnocení';

  @override
  String get resetShownCountAndTimestamps =>
      'Resetovat počet zobrazení a časová razítka';

  @override
  String get ratingPreferencesReset => 'Předvolby hodnocení byly resetovány';

  @override
  String get support => 'Podpora';

  @override
  String get systemStatus => 'Stav systému';

  @override
  String get checkOperationalStatusOfServices =>
      'Zkontrolovat provozní stav služeb';

  @override
  String get helpAndFeedback => 'Nápověda a zpětná vazba';

  @override
  String get getHelpOrSendFeedback => 'Získat pomoc nebo odeslat zpětnou vazbu';

  @override
  String versionBuildNumber(String version, String buildNumber) {
    return 'Verze $version ($buildNumber)';
  }

  @override
  String get featureRequest => 'Návrh funkce';

  @override
  String get suggestFeature => 'Navrhněte novou funkci pro WeatherFast';

  @override
  String get bugReport => 'Hlášení chyby';

  @override
  String get reportBug => 'Nahlásit chybu nebo problém';

  @override
  String get notifications => 'Oznámení';

  @override
  String get loadingNotificationTitle => 'Načítání názvu oznámení…';

  @override
  String get loadingNotificationDesc => 'Načítání popisu oznámení…';

  @override
  String failedToLoadNotifications(String error) {
    return 'Oznámení se nepodařilo načíst: $error';
  }

  @override
  String errorLoadingNotifications(String error) {
    return 'Chyba při načítání oznámení: $error';
  }

  @override
  String get retry => 'Zkusit znovu';

  @override
  String get noNewNotifications => 'Žádná nová oznámení';

  @override
  String get notificationTitle => 'Oznámení';

  @override
  String get couldNotOpenLink => 'Odkaz se nepodařilo otevřít';

  @override
  String get openLink => 'Otevřít odkaz';

  @override
  String get mapSettings => 'Nastavení mapy';

  @override
  String get radarOpacity => 'Průhlednost radaru';

  @override
  String get dataSources => 'Zdroje dat';

  @override
  String get mapLayers => 'Vrstvy mapy:';

  @override
  String get baseMapsMapbox => 'Podkladové mapy poskytuje Mapbox.';

  @override
  String get weatherData => 'Data o počasí:';

  @override
  String get livePrecipitationRainviewer =>
      'Živé radarové vrstvy srážek poskytuje RainViewer.';

  @override
  String get attribution => 'Uvedení zdroje:';

  @override
  String get attributionText =>
      '© Mapbox, © přispěvatelé OpenStreetMap, © RainViewer.';

  @override
  String get weatherMap => 'Mapa počasí';

  @override
  String get loading => 'Načítání…';

  @override
  String get enjoyingWeatherFast => 'Líbí se vám WeatherFast?';

  @override
  String get rateAppDescription =>
      'Pokud se vám naše aplikace líbí, věnujte prosím chvíli jejímu hodnocení v Obchodě Play. Vaše podpora pro nás moc znamená!';

  @override
  String get rateNow => 'Ohodnotit nyní';

  @override
  String get remindMeLater => 'Připomenout za 2 dny';

  @override
  String get noThanks => 'Ne, děkuji';

  @override
  String neaAttribution(String date) {
    return 'Obsahuje informace z dvouhodinové, čtyřiadvacetihodinové a čtyřdenní předpovědi počasí, o teplotě vzduchu, srážkách, relativní vlhkosti, relativní vlhkosti, rychlosti větru a indexu znečištění ovzduší (PSI) v Singapuru od National Environment Agency a o povodňových výstrahách v Singapuru od PUB, singapurské národní vodohospodářské agentury, získané $date; tyto informace jsou k dispozici podle podmínek ';
  }

  @override
  String get sgOpenDataLicence =>
      'Singapurská licence pro otevřená data verze 1.0';

  @override
  String get weatherDataProvidedByOM => 'Data o počasí poskytuje Open-Meteo';

  @override
  String get neaWebsite => 'Web NEA';

  @override
  String get dataGovSg => 'Data.gov.sg';

  @override
  String get website => 'Webové stránky';

  @override
  String get apiDocs => 'Dokumentace API';

  @override
  String get terms => 'Podmínky použití';

  @override
  String get loadingClearWeather => 'Jasno';

  @override
  String get loadingTempF => '72 °F';

  @override
  String get tapToViewInteractiveRadar =>
      'Klepnutím zobrazíte interaktivní radar';

  @override
  String get weatherMapsUnavailableOnWeb =>
      'Mapy počasí nejsou na webu k dispozici';

  @override
  String get interactiveWeatherRadarDescription =>
      'Interaktivní meteorologický radar a mapy ve vysokém rozlišení jsou optimalizované pro mobilní prostředí.';

  @override
  String get getItOnPlayStore => 'Získat v Obchodě Play';

  @override
  String get multipleFloodAlerts => 'Více povodňových varování';

  @override
  String activeWarnings(int count) {
    return 'Počet aktivních varování: $count';
  }

  @override
  String get tapToViewAllAlerts => 'Klepnutím zobrazíte všechna varování';

  @override
  String get activeFloodAlerts => 'Aktivní povodňová varování';

  @override
  String get area => 'Oblast';

  @override
  String get description => 'Popis';

  @override
  String get instruction => 'Pokyny';

  @override
  String get severity => 'Závažnost';

  @override
  String get response => 'Odpověď';

  @override
  String get flashFloodWarning => 'Varování před přívalovou povodní!';

  @override
  String get floodAlert => 'Povodňové varování';

  @override
  String incompleteLocalisationMessage(String language) {
    return 'Lokalizace pro jazyk $language není dokončena.';
  }

  @override
  String get helpLocalizeWeatherFast => 'Pomozte lokalizovat WeatherFast';

  @override
  String get ok => 'OK';

  @override
  String get notificationsTooltip => 'Oznámení';

  @override
  String get units => 'Jednotky';

  @override
  String get temperatureWindVisibility => 'Teplota, vítr, dohlednost';

  @override
  String get temperature => 'Teplota';

  @override
  String get celsius => 'Celsia (°C)';

  @override
  String get fahrenheit => 'Fahrenheita (°F)';

  @override
  String get windSpeedLabel => 'Rychlost větru';

  @override
  String get unitKmh => 'km/h';

  @override
  String get unitMph => 'mph';

  @override
  String get unitMs => 'm/s';

  @override
  String get unitKnots => 'uzly';

  @override
  String get unitKilometers => 'Kilometry (km)';

  @override
  String get unitMiles => 'Míle (mi)';

  @override
  String get performanceMode => 'Režim výkonu';

  @override
  String get disableExtraVisualEffects => 'Vypnout další vizuální efekty';

  @override
  String get bestTimesTitle => 'Nejlepší časy';

  @override
  String get insightsActivityLimitOutdoorTitle => 'Omezte venkovní námahu';

  @override
  String get insightsActivityLimitOutdoorDesc =>
      'Kvalita ovzduší je špatná — upřednostněte nenáročné aktivity nebo pobyt uvnitř';

  @override
  String get insightsActivityIndoorTitle => 'Aktivity v interiéru';

  @override
  String get insightsActivityIndoorDesc =>
      'Navštivte muzeum, kavárnu nebo zábavu v interiéru';

  @override
  String get insightsActivityCyclingTitle => 'Ideální na cyklistiku';

  @override
  String get insightsActivityCyclingDesc =>
      'Skvělé počasí na projížďku na kole — mírné teploty a jasná obloha';

  @override
  String get insightsActivityOutdoorSportsTitle => 'Venkovní sport';

  @override
  String get insightsActivityOutdoorSportsDesc =>
      'Ideální podmínky pro venkovní aktivity a sport';

  @override
  String get insightsActivityBeachTitle => 'Den na pláži';

  @override
  String get insightsActivityBeachDesc =>
      'Ideální počasí na pláž — vezměte si opalovací krém!';

  @override
  String get insightsActivityHikingTitle => 'Počasí na turistiku';

  @override
  String get insightsActivityHikingDesc =>
      'Chladné a příjemné počasí na procházku přírodou';

  @override
  String get insightsActivityGeneralTitle => 'Obecné aktivity';

  @override
  String get insightsActivityGeneralDesc =>
      'Mírné počasí — podle toho plánujte';

  @override
  String get insightsHealthAirQualityTitle => 'Upozornění na kvalitu ovzduší';

  @override
  String get insightsHealthAirQualityDesc =>
      'Venku zvažte roušku a omezte intenzivní aktivitu, dokud se ovzduší nezlepší.';

  @override
  String get insightsHealthUVTitle => 'Ochrana před UV je zásadní';

  @override
  String get insightsHealthUVDesc =>
      'Každé 2 hodiny naneste opalovací krém SPF 30+. Noste sluneční brýle a klobouk.';

  @override
  String get insightsHealthHeatTitle => 'Dodržujte pitný režim';

  @override
  String get insightsHealthHeatDesc =>
      'Pravidelně pijte vodu. Mezi 11:00 a 15:00 se vyhněte dlouhému pobytu na slunci.';

  @override
  String get insightsHealthColdTitle => 'Upozornění na chladné počasí';

  @override
  String get insightsHealthColdDesc =>
      'Dávejte pozor na omrzliny. Oblékněte se ve vrstvách a zakryjte končetiny.';

  @override
  String get insightsHealthWindTitle => 'Upozornění na vítr';

  @override
  String get insightsHealthWindDesc =>
      'Zajistěte volně položené předměty. Při řízení buďte opatrní.';

  @override
  String get insightsHealthOptimalTitle => 'Ideální podmínky';

  @override
  String get insightsHealthOptimalDesc =>
      'Ideální počasí pro fyzickou aktivitu a pobyt venku.';

  @override
  String get insightsClothingHot =>
      'Lehké prodyšné oblečení. Doporučujeme klobouk a sluneční brýle.';

  @override
  String get insightsClothingWarm =>
      'Pohodlné letní oblečení. Ráno a večer lehké vrstvy.';

  @override
  String get insightsClothingMild =>
      'Doporučujeme dlouhý rukáv nebo lehkou bundu.';

  @override
  String get insightsClothingCool =>
      'Budete potřebovat bundu nebo svetr. Doporučujeme dlouhé kalhoty.';

  @override
  String get insightsClothingCold =>
      'Teplá bunda je nezbytná. Pro pohodlí se oblékněte ve vrstvách.';

  @override
  String get insightsClothingFreeze =>
      'Je nutný těžký zimní kabát, rukavice a teplé vrstvy.';

  @override
  String get insightsClothingRainSuffix => ' Vezměte si nepromokavé vybavení.';

  @override
  String get insightsHourlyMorning => 'Ráno';

  @override
  String get insightsHourlyAfternoon => 'Odpoledne';

  @override
  String get insightsHourlyEvening => 'Večer';

  @override
  String get insightsHourlyMorningChilly =>
      'Chladný začátek dne — vezměte si další vrstvu';

  @override
  String get insightsHourlyMorningComfort => 'Příjemné ranní teploty';

  @override
  String get insightsHourlyAfternoonHot => 'Vrchol horka — vyhledejte stín';

  @override
  String get insightsHourlyAfternoonPleasant => 'Očekává se příjemné odpoledne';

  @override
  String get insightsHourlyEveningCool => 'Chladný večer — vezměte si bundu';

  @override
  String get insightsHourlyEveningMild => 'Mírné večerní podmínky';

  @override
  String get insightsWeekLimitedData =>
      'K dispozici jsou omezená data předpovědi';

  @override
  String get insightsWeekDataUnavailable =>
      'Data předpovědi nejsou k dispozici';

  @override
  String insightsWeekVariableSwing(String swing) {
    return 'Čeká nás proměnlivý týden s výkyvem teploty $swing °C. ';
  }

  @override
  String get insightsWeekStable =>
      'Očekávají se stabilní podmínky a stálé teploty. ';

  @override
  String get insightsWeekWarm => 'Po celý týden bude většinou teplo.';

  @override
  String get insightsWeekCool => 'Přetrvává chladné počasí.';

  @override
  String get insightsWeekModerate => 'Převládají mírné teploty.';

  @override
  String get insightsBestTimeSingapore => 'Nejlepší čas: 7–9 h a 17–20 h';

  @override
  String get insightsBestTimeSingaporeDesc =>
      'Ideální podmínky pro venkovní aktivity v Singapuru';

  @override
  String get insightsBestTimeNoData => 'Žádná data';

  @override
  String get insightsBestTimeNoDataDesc => 'Nejlepší časy nelze určit';

  @override
  String get insightsBestTimeLimited => 'Omezená data';

  @override
  String get insightsBestTimeLimitedDesc => 'Hodinová data nejsou k dispozici';

  @override
  String insightsBestTimeAt(String time) {
    return 'Nejlepší čas: $time';
  }

  @override
  String get insightsBestTimeDesc => 'Ideální podmínky pro venkovní aktivity';

  @override
  String insightsTimeAM(String hour) {
    return '$hour dop.';
  }

  @override
  String insightsTimePM(String hour) {
    return '$hour odp.';
  }

  @override
  String get insightsTimeNoon => '12 odp.';

  @override
  String get insightsRecRain => '☔ Vezměte si deštník — déšť je pravděpodobný';

  @override
  String get insightsRecHeatHigh =>
      '🌡️ Dodržujte pitný režim — varování před horkem';

  @override
  String get insightsRecHeatMid => '☀️ Použijte opalovací krém';

  @override
  String get insightsRecCold =>
      '🧊 Teple se oblékněte — čeká vás chladné počasí';

  @override
  String get insightsRecWind =>
      '💨 Zajistěte volně položené předměty — silný vítr';

  @override
  String get insightsRecUV => '🛡️ Vysoké UV — chraňte svou pokožku';

  @override
  String get insightsRecAir =>
      '😷 Kvalita ovzduší je špatná — omezte venkovní námahu';

  @override
  String get insightsRecWarming =>
      '📈 Trend oteplování — oblékněte se ve vrstvách';

  @override
  String get insightsRecCooling => '📉 Čeká nás ochlazení';

  @override
  String get insightsRecPleasant => '✨ Očekává se příjemné počasí';

  @override
  String get insightsSummaryAllClear =>
      'Vše je v pořádku — čekají vás skvělé podmínky!';

  @override
  String get insightsSummaryRain =>
      'Blíží se deštivý den — podle toho se připravte';

  @override
  String get insightsSummaryHeat =>
      'Horko a intenzivní slunce — udržujte se v chladu';

  @override
  String get insightsSummaryCold => 'Mrazivé podmínky — teple se oblékněte';

  @override
  String get insightsSummaryWind => 'Větrný den — přidržte si klobouk';

  @override
  String get insightsSummaryUV => 'Silné UV — chraňte se';

  @override
  String get insightsSummaryAir =>
      'Kvalita ovzduší je špatná — venku se nepřepínejte';

  @override
  String get insightsSummaryVariable => 'Očekávají se proměnlivé podmínky';

  @override
  String get weatherChoreographer => 'Dnešní události';

  @override
  String get tomorrowsEvents => 'Zítřejší události';

  @override
  String get weatherChoreographerSubtitle =>
      'Zobrazovat počasí pro události v kalendáři';

  @override
  String get calendarSettingsTitle => 'Synchronizace kalendáře';

  @override
  String get calendarSettingsSubtitle => 'Synchronizace kalendáře';

  @override
  String get calendarSettingsDescription =>
      'Po zapnutí WeatherFast prohledá vybrané kalendáře a najde události se zadaným místem. Pro tato místa pak přímo pod hlavní kartou počasí zobrazí přizpůsobené meteorologické přehledy.\n\nPoznámka k soukromí: WeatherFast nikdy neodesílá data kalendáře mimo vaše zařízení a veškeré zpracování probíhá přímo v zařízení.';

  @override
  String get enableChoreographer => 'Zapnout synchronizaci kalendáře';

  @override
  String get showWeatherForCalendarEvents =>
      'Zobrazovat počasí pro události v kalendáři';

  @override
  String get selectCalendars => 'Vybrat kalendáře';

  @override
  String get noCalendarsFound =>
      'Nebyly nalezeny žádné kalendáře nebo bylo odepřeno oprávnění.';

  @override
  String get unnamedCalendar => 'Kalendář bez názvu';

  @override
  String get newWeatherChoreographer => 'Novinka: synchronizace kalendáře';

  @override
  String get weatherChoreographerPromoDescription =>
      'WeatherFast nyní umí synchronizovat váš kalendář a přímo na domovské obrazovce zobrazit předpověď počasí pro nadcházející události.';

  @override
  String get weatherChoreographerPromoPrivacy =>
      'Poznámka k soukromí: Veškerá data kalendáře se bezpečně zpracovávají ve vašem zařízení a nikdy se neodesílají na žádné servery.';

  @override
  String get notNow => 'Teď ne';

  @override
  String get enable => 'Zapnout';

  @override
  String get resetCalendarPromo => 'Resetovat nabídku kalendáře';

  @override
  String get resetCalendarPromoSubtitle =>
      'Resetovat stav zobrazení spodního panelu synchronizace kalendáře';

  @override
  String get calendarPromoReset =>
      'Předvolby nabídky kalendáře byly resetovány';

  @override
  String get eventDetails => 'Podrobnosti události';

  @override
  String weatherForArea(String area) {
    return 'Počasí pro oblast $area';
  }

  @override
  String get loadingWeather => 'Načítání podrobností o počasí…';

  @override
  String get noWeatherAvailable =>
      'Podrobnosti o počasí pro toto místo nejsou momentálně k dispozici.';

  @override
  String get meetingEnvironment => 'Prostředí schůzky';

  @override
  String get indoor => 'Uvnitř';

  @override
  String get outdoor => 'Venku';

  @override
  String get smartRecommendations => 'Chytrá doporučení';

  @override
  String get recCommuteRain =>
      'Předpovídá se déšť. Nezapomeňte si na cestu vzít deštník nebo pláštěnku!';

  @override
  String recCommuteHot(int temp) {
    return 'Venku je velké horko ($temp°). Na cestu si vezměte lehké prodyšné oblečení, ale přibalte si i lehkou vrstvu, protože klimatizace v interiéru může být chladná!';
  }

  @override
  String recCommuteCold(int temp) {
    return 'Venku je chladno ($temp°). Oblečte si teplé vrstvy, které můžete po příchodu do vytápěného místa snadno upravit.';
  }

  @override
  String get recIndoorAllClear =>
      '🏢 Jelikož je schůzka uvnitř, budete v pohodlí a chráněni před počasím. Užijte si schůzku!';

  @override
  String get recIndoorCommuteHeader =>
      '🏢 V bezpečí uvnitř: Po příchodu budete chráněni před počasím. Na cestu:\n';

  @override
  String get recOutdoorRain =>
      '⚠️ Očekává se déšť! Důrazně doporučujeme vzít si deštník nebo přesunout schůzku do interiéru či pod přístřešek.';

  @override
  String recOutdoorHot(int temp) {
    return '🥵 Venku je horko ($temp°). Doporučujeme vyhledat stín, obléct si prodyšné oblečení a dodržovat pitný režim.';
  }

  @override
  String recOutdoorCold(int temp) {
    return '🥶 Venku je chladno ($temp°). Teple se oblékněte a zvažte teplý nápoj.';
  }

  @override
  String recOutdoorWindy(String wind) {
    return '💨 Očekávejte nárazový vítr (až $wind km/h). Zajistěte volné papíry a materiály.';
  }

  @override
  String get recOutdoorAllClear =>
      '🌳 Ideální počasí pro venkovní schůzku! Užijte si příjemné podmínky a čerstvý vzduch.';

  @override
  String get recOutdoorHeader => '🌳 Upozornění pro pobyt venku:\n';

  @override
  String get savedLocations => 'Uložená místa';

  @override
  String get saveLocation => 'Uložit místo';

  @override
  String get removeLocation => 'Odebrat místo';

  @override
  String get noSavedLocations => 'Žádná uložená místa';

  @override
  String get locations => 'Místa';

  @override
  String get currentLocation => 'Aktuální poloha';

  @override
  String locationSavedMessage(String location) {
    return 'Uloženo: $location';
  }
}
