import 'dart:math';

import '../l10n/app_localizations.dart';

class WeatherInsightsService {
  /// Generate comprehensive weather insights.
  /// [l10n] must be provided so that all returned strings are localised.
  Map<String, dynamic> generateInsights({
    required AppLocalizations l10n,
    required String condition,
    required int currentTemp,
    required int highTemp,
    required int lowTemp,
    required int humidity,
    required double windSpeed,
    required double uvIndex,
    required int aqi,
    required List<Map<String, dynamic>> dailyForecasts,
    required String country,
  }) {
    final trends = _analyzeTrends(dailyForecasts);
    final risks = _assessRisks(
      condition: condition,
      temp: currentTemp,
      high: highTemp,
      low: lowTemp,
      humidity: humidity,
      wind: windSpeed,
      uv: uvIndex,
      aqi: aqi,
    );

    return {
      'summary': _generateSummary(l10n, risks, trends),
      'recommendations': _generateRecommendations(l10n, risks, trends),
      'riskScores': risks,
      'trends': trends,
      'activities': _generateActivitySuggestions(l10n, risks, currentTemp, condition),
      'healthTips': _generateHealthTips(l10n, risks, uvIndex, currentTemp),
      'clothingAdvice':
          _generateClothingAdvice(l10n, currentTemp, highTemp, lowTemp, condition),
      'hourlyInsights': _generateHourlyInsights(l10n, dailyForecasts),
      'weekAhead': _generateWeekAheadInsights(l10n, dailyForecasts),
      'bestTimes': _findBestTimes(l10n, dailyForecasts, country),
    };
  }

  Map<String, double> _assessRisks({
    required String condition,
    required int temp,
    required int high,
    required int low,
    required int humidity,
    required double wind,
    required double uv,
    required int aqi,
  }) {
    return {
      'rain': _computeRainRisk(condition, humidity),
      'heat': _computeHeatRisk(high),
      'cold': _computeColdRisk(low),
      'wind': _computeWindRisk(wind),
      'uv': _computeUVRisk(uv),
      'air': _computeAirQualityRisk(aqi),
    };
  }

  double _computeAirQualityRisk(int aqi) {
    if (aqi >= 200) return 1.0;
    if (aqi >= 150) return 0.8;
    if (aqi >= 120) return 0.6;
    if (aqi >= 80) return 0.4;
    if (aqi >= 50) return 0.2;
    return 0.0;
  }

  double _computeRainRisk(String condition, int humidity) {
    double risk = 0.0;
    final lower = condition.toLowerCase();
    if (lower.contains('rain') || lower.contains('drizzle')) {
      risk += 0.8;
    } else if (lower.contains('cloud') || lower.contains('overcast')) {
      risk += 0.3;
    }
    if (humidity > 80) risk += 0.2;
    if (humidity > 90) risk += 0.1;
    return min(1.0, risk);
  }

  double _computeHeatRisk(int highTemp) {
    if (highTemp >= 35) return 1.0;
    if (highTemp >= 32) return 0.8;
    if (highTemp >= 30) return 0.6;
    if (highTemp >= 28) return 0.3;
    return 0.0;
  }

  double _computeColdRisk(int lowTemp) {
    if (lowTemp <= -10) return 1.0;
    if (lowTemp <= 0) return 0.8;
    if (lowTemp <= 5) return 0.5;
    if (lowTemp <= 10) return 0.2;
    return 0.0;
  }

  double _computeWindRisk(double windKph) {
    if (windKph >= 50) return 1.0;
    if (windKph >= 40) return 0.8;
    if (windKph >= 30) return 0.5;
    if (windKph >= 20) return 0.2;
    return 0.0;
  }

  double _computeUVRisk(double uv) {
    if (uv >= 11) return 1.0;
    if (uv >= 8) return 0.8;
    if (uv >= 6) return 0.6;
    if (uv >= 3) return 0.3;
    return 0.0;
  }

  Map<String, dynamic> _analyzeTrends(
      List<Map<String, dynamic>> dailyForecasts) {
    if (dailyForecasts.isEmpty) {
      return {'direction': 'stable', 'intensity': 0.0};
    }

    final first3Avg = _averageTemp(
        dailyForecasts.take(min(3, dailyForecasts.length)).toList());
    final last3 = dailyForecasts.length > 3
        ? dailyForecasts.sublist(max(0, dailyForecasts.length - 3))
        : dailyForecasts;
    final last3Avg = _averageTemp(last3);

    final direction = last3Avg > first3Avg
        ? 'warming'
        : last3Avg < first3Avg
            ? 'cooling'
            : 'stable';
    final intensity = (last3Avg - first3Avg).abs() / 20;

    return {
      'direction': direction,
      'intensity': min(1.0, intensity),
      'tempChange': (last3Avg - first3Avg).round(),
    };
  }

  double _averageTemp(List<Map<String, dynamic>> forecasts) {
    if (forecasts.isEmpty) return 20.0;
    double sum = 0;
    int count = 0;
    for (var f in forecasts) {
      final maxT = f['day']?['maxtemp_c'] as num?;
      if (maxT != null) {
        sum += maxT.toDouble();
        count++;
      }
    }
    return count > 0 ? sum / count : 20.0;
  }

  List<Map<String, String>> _generateActivitySuggestions(
      AppLocalizations l10n,
      Map<String, double> risks,
      int temp,
      String condition) {
    final activities = <Map<String, String>>[];

    // Check if air quality is poor
    final poorAirQuality = risks['air'] != null && risks['air']! > 0.5;

    if (poorAirQuality) {
      activities.add({
        'icon': '😷',
        'title': l10n.insightsActivityLimitOutdoorTitle,
        'description': l10n.insightsActivityLimitOutdoorDesc,
      });
      activities.add({
        'icon': '🏛️',
        'title': l10n.insightsActivityIndoorTitle,
        'description': l10n.insightsActivityIndoorDesc,
      });
      return activities;
    }

    if (risks['rain']! < 0.3 && temp > 15 && temp < 30) {
      activities.add({
        'icon': '🚴',
        'title': l10n.insightsActivityCyclingTitle,
        'description': l10n.insightsActivityCyclingDesc,
      });
    }

    if (risks['heat']! < 0.4 && risks['rain']! < 0.4) {
      activities.add({
        'icon': '⚽',
        'title': l10n.insightsActivityOutdoorSportsTitle,
        'description': l10n.insightsActivityOutdoorSportsDesc,
      });
    }

    if (temp > 25 && risks['rain']! < 0.5) {
      activities.add({
        'icon': '🏖️',
        'title': l10n.insightsActivityBeachTitle,
        'description': l10n.insightsActivityBeachDesc,
      });
    }

    if (risks['rain']! > 0.6) {
      activities.add({
        'icon': '🏛️',
        'title': l10n.insightsActivityIndoorTitle,
        'description': l10n.insightsActivityIndoorDesc,
      });
    }

    if (temp < 15 && risks['rain']! < 0.5) {
      activities.add({
        'icon': '🥾',
        'title': l10n.insightsActivityHikingTitle,
        'description': l10n.insightsActivityHikingDesc,
      });
    }

    return activities.isEmpty
        ? [
            {
              'icon': '🌤️',
              'title': l10n.insightsActivityGeneralTitle,
              'description': l10n.insightsActivityGeneralDesc,
            }
          ]
        : activities;
  }

  List<Map<String, String>> _generateHealthTips(
      AppLocalizations l10n,
      Map<String, double> risks,
      double uv,
      int temp) {
    final tips = <Map<String, String>>[];

    if (risks['air'] != null && risks['air']! > 0.5) {
      tips.add({
        'icon': '😷',
        'title': l10n.insightsHealthAirQualityTitle,
        'description': l10n.insightsHealthAirQualityDesc,
        'severity': 'high',
      });
    }

    if (risks['uv']! > 0.6) {
      tips.add({
        'icon': '☀️',
        'title': l10n.insightsHealthUVTitle,
        'description': l10n.insightsHealthUVDesc,
        'severity': 'high',
      });
    }

    if (risks['heat']! > 0.7) {
      tips.add({
        'icon': '💧',
        'title': l10n.insightsHealthHeatTitle,
        'description': l10n.insightsHealthHeatDesc,
        'severity': 'high',
      });
    }

    if (risks['cold']! > 0.6) {
      tips.add({
        'icon': '🧊',
        'title': l10n.insightsHealthColdTitle,
        'description': l10n.insightsHealthColdDesc,
        'severity': 'high',
      });
    }

    if (risks['wind']! > 0.5) {
      tips.add({
        'icon': '💨',
        'title': l10n.insightsHealthWindTitle,
        'description': l10n.insightsHealthWindDesc,
        'severity': 'medium',
      });
    }

    if (temp > 20 && temp < 25 && risks['rain']! < 0.3) {
      tips.add({
        'icon': '✨',
        'title': l10n.insightsHealthOptimalTitle,
        'description': l10n.insightsHealthOptimalDesc,
        'severity': 'low',
      });
    }

    return tips;
  }

  Map<String, String> _generateClothingAdvice(
      AppLocalizations l10n, int current, int high, int low, String condition) {
    String advice;
    String icon;

    if (high > 30) {
      icon = '🩳';
      advice = l10n.insightsClothingHot;
    } else if (high > 25) {
      icon = '👕';
      advice = l10n.insightsClothingWarm;
    } else if (high > 20) {
      icon = '👖';
      advice = l10n.insightsClothingMild;
    } else if (high > 15) {
      icon = '🧥';
      advice = l10n.insightsClothingCool;
    } else if (high > 10) {
      icon = '🧥';
      advice = l10n.insightsClothingCold;
    } else {
      icon = '🧤';
      advice = l10n.insightsClothingFreeze;
    }

    if (condition.toLowerCase().contains('rain')) {
      advice += l10n.insightsClothingRainSuffix;
      icon = '☔';
    }

    return {'icon': icon, 'advice': advice};
  }

  List<Map<String, dynamic>> _generateHourlyInsights(
      AppLocalizations l10n, List<Map<String, dynamic>> dailyForecasts) {
    final insights = <Map<String, dynamic>>[];

    if (dailyForecasts.isEmpty) return insights;

    final today = dailyForecasts.first;
    final hourly =
        (today['hour'] as List?)?.cast<Map<String, dynamic>>() ?? [];

    if (hourly.length >= 24) {
      // Morning (6-9am)
      final morningTemps = hourly
          .sublist(6, 10)
          .map((h) => h['temp_c'] as num?)
          .whereType<num>();
      if (morningTemps.isNotEmpty) {
        final avgMorning =
            morningTemps.reduce((a, b) => a + b) / morningTemps.length;
        insights.add({
          'time': l10n.insightsHourlyMorning,
          'temp': avgMorning.round(),
          'insight': avgMorning < 10
              ? l10n.insightsHourlyMorningChilly
              : l10n.insightsHourlyMorningComfort,
        });
      }

      // Afternoon (12-3pm)
      final afternoonTemps = hourly
          .sublist(12, 16)
          .map((h) => h['temp_c'] as num?)
          .whereType<num>();
      if (afternoonTemps.isNotEmpty) {
        final avgAfternoon =
            afternoonTemps.reduce((a, b) => a + b) / afternoonTemps.length;
        insights.add({
          'time': l10n.insightsHourlyAfternoon,
          'temp': avgAfternoon.round(),
          'insight': avgAfternoon > 30
              ? l10n.insightsHourlyAfternoonHot
              : l10n.insightsHourlyAfternoonPleasant,
        });
      }

      // Evening (6-9pm)
      final eveningTemps = hourly
          .sublist(18, 22)
          .map((h) => h['temp_c'] as num?)
          .whereType<num>();
      if (eveningTemps.isNotEmpty) {
        final avgEvening =
            eveningTemps.reduce((a, b) => a + b) / eveningTemps.length;
        insights.add({
          'time': l10n.insightsHourlyEvening,
          'temp': avgEvening.round(),
          'insight': avgEvening < 15
              ? l10n.insightsHourlyEveningCool
              : l10n.insightsHourlyEveningMild,
        });
      }
    }

    return insights;
  }

  Map<String, String> _generateWeekAheadInsights(
      AppLocalizations l10n, List<Map<String, dynamic>> dailyForecasts) {
    if (dailyForecasts.length < 7) {
      return {'summary': l10n.insightsWeekLimitedData};
    }

    final temps = dailyForecasts
        .take(7)
        .map((d) => d['day']?['maxtemp_c'] as num?)
        .whereType<num>()
        .toList();

    if (temps.isEmpty) {
      return {'summary': l10n.insightsWeekDataUnavailable};
    }

    final avgTemp = temps.reduce((a, b) => a + b) / temps.length;
    final maxTemp = temps.reduce(max);
    final minTemp = temps.reduce(min);

    String summary;
    if (maxTemp - minTemp > 10) {
      summary = l10n.insightsWeekVariableSwing(
          (maxTemp - minTemp).round().toString());
    } else {
      summary = l10n.insightsWeekStable;
    }

    if (avgTemp > 25) {
      summary += l10n.insightsWeekWarm;
    } else if (avgTemp < 15) {
      summary += l10n.insightsWeekCool;
    } else {
      summary += l10n.insightsWeekModerate;
    }

    return {'summary': summary, 'avgTemp': avgTemp.round().toString()};
  }

  Map<String, String> _findBestTimes(
      AppLocalizations l10n,
      List<Map<String, dynamic>> dailyForecasts,
      String country) {
    if (country.toLowerCase().contains('singapore')) {
      return {
        'title': l10n.insightsBestTimeSingapore,
        'description': l10n.insightsBestTimeSingaporeDesc,
      };
    }

    if (dailyForecasts.isEmpty) {
      return {
        'title': l10n.insightsBestTimeNoData,
        'description': l10n.insightsBestTimeNoDataDesc,
      };
    }

    final today = dailyForecasts.first;
    final hourly =
        (today['hour'] as List?)?.cast<Map<String, dynamic>>() ?? [];

    if (hourly.isEmpty) {
      return {
        'title': l10n.insightsBestTimeLimited,
        'description': l10n.insightsBestTimeLimitedDesc,
      };
    }

    // Find hour with best conditions (moderate temp, no rain, low wind)
    int bestHour = 12; // default to noon
    double bestScore = -1;

    for (int i = 6; i < 20; i++) {
      if (i >= hourly.length) break;
      final hour = hourly[i];
      final temp = (hour['temp_c'] as num?)?.toDouble() ?? 20;
      final rain = (hour['chance_of_rain'] as num?)?.toDouble() ?? 0;
      final wind = (hour['wind_kph'] as num?)?.toDouble() ?? 0;

      // Score based on ideal conditions: 20-25°C, low rain, low wind
      double score = 100 -
          (temp - 22.5).abs() * 2 - // Prefer 20-25°C
          rain / 2 - // Penalize rain chance
          wind / 4; // Penalize wind

      if (score > bestScore) {
        bestScore = score;
        bestHour = i;
      }
    }

    final String hourStr;
    if (bestHour == 12) {
      hourStr = l10n.insightsTimeNoon;
    } else if (bestHour > 12) {
      hourStr = l10n.insightsTimePM((bestHour - 12).toString());
    } else {
      hourStr = l10n.insightsTimeAM(bestHour.toString());
    }

    return {
      'title': l10n.insightsBestTimeAt(hourStr),
      'description': l10n.insightsBestTimeDesc,
    };
  }

  List<String> _generateRecommendations(
      AppLocalizations l10n,
      Map<String, double> risks,
      Map<String, dynamic> trends) {
    final recs = <String>[];

    if (risks['rain']! > 0.6) {
      recs.add(l10n.insightsRecRain);
    }
    if (risks['heat']! > 0.7) {
      recs.add(l10n.insightsRecHeatHigh);
    } else if (risks['heat']! > 0.4) {
      recs.add(l10n.insightsRecHeatMid);
    }
    if (risks['cold']! > 0.7) {
      recs.add(l10n.insightsRecCold);
    }
    if (risks['wind']! > 0.6) {
      recs.add(l10n.insightsRecWind);
    }
    if (risks['uv']! > 0.6) {
      recs.add(l10n.insightsRecUV);
    }
    if (risks['air'] != null && risks['air']! > 0.6) {
      recs.add(l10n.insightsRecAir);
    }
    if (trends['direction'] == 'warming') {
      recs.add(l10n.insightsRecWarming);
    } else if (trends['direction'] == 'cooling') {
      recs.add(l10n.insightsRecCooling);
    }

    return recs.isEmpty ? [l10n.insightsRecPleasant] : recs;
  }

  String _generateSummary(
      AppLocalizations l10n,
      Map<String, double> risks,
      Map<String, dynamic> trends) {
    final topRisks = risks.entries.where((e) => e.value > 0.5).toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (topRisks.isEmpty) return l10n.insightsSummaryAllClear;

    final risk = topRisks.first;
    switch (risk.key) {
      case 'rain':
        return l10n.insightsSummaryRain;
      case 'heat':
        return l10n.insightsSummaryHeat;
      case 'cold':
        return l10n.insightsSummaryCold;
      case 'wind':
        return l10n.insightsSummaryWind;
      case 'uv':
        return l10n.insightsSummaryUV;
      case 'air':
        return l10n.insightsSummaryAir;
      default:
        return l10n.insightsSummaryVariable;
    }
  }
}
