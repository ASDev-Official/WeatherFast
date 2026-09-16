import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import '../models/location_alert_config.dart';
import 'preferences_service.dart';
import 'notification_service.dart';
import 'global_data.dart';
import '../weather_service.dart';
import '../weather_service_sg.dart';

class WeatherAlertEngine {
  static final WeatherAlertEngine _instance = WeatherAlertEngine._internal();
  factory WeatherAlertEngine() => _instance;
  WeatherAlertEngine._internal();

  /// Cooldown intervals to prevent notification spam
  static const Duration _rainCooldown = Duration(hours: 3);
  static const Duration _severeCooldown = Duration(hours: 2);
  static const Duration _tempCooldown = Duration(hours: 4);
  static const Duration _windCooldown = Duration(hours: 3);
  static const Duration _aqiCooldown = Duration(hours: 4);
  static const Duration _floodCooldown = Duration(hours: 2);

  /// Evaluates all enabled location alert configs and sends notifications
  Future<void> evaluateAlerts() async {
    try {
      // 1. Check current location config
      final currentConfig = await PreferencesService.loadLocationAlertConfig(
        'current_location',
        defaultName: 'Current Location',
      );
      if (currentConfig.enabled) {
        await _evaluateLocation(currentConfig, isCurrentLocation: true);
      }

      // 2. Check all saved locations
      final savedLocations = await PreferencesService.loadSavedLocations();
      for (final loc in savedLocations) {
        final config = await PreferencesService.loadLocationAlertConfig(loc, defaultName: loc);
        if (config.enabled) {
          await _evaluateLocation(config, isCurrentLocation: false);
        }
      }
    } catch (e, st) {
      debugPrint('WeatherAlertEngine.evaluateAlerts error: $e\n$st');
    }
  }

  Future<void> _evaluateLocation(
    LocationAlertConfig config, {
    required bool isCurrentLocation,
  }) async {
    final now = DateTime.now();

    // Check quiet hours (suppresses non-severe alerts)
    final inQuietHours = _isQuietHours(config, now);

    // Resolve location coordinate / query
    String? query;
    double? lat;
    double? lon;

    if (isCurrentLocation) {
      try {
        final pos = await Geolocator.getLastKnownPosition();
        if (pos != null) {
          lat = pos.latitude;
          lon = pos.longitude;
          query = '$lat,$lon';
        }
      } catch (_) {}

      if (query == null) {
        query = await PreferencesService.loadLastLocationQuery();
        if (query != null && query.contains(',')) {
          final parts = query.split(',');
          lat = double.tryParse(parts[0]);
          lon = double.tryParse(parts[1]);
        }
      }
    } else {
      query = config.locationId;
      if (query.contains(',')) {
        final parts = query.split(',');
        lat = double.tryParse(parts[0]);
        lon = double.tryParse(parts[1]);
      }
    }

    if (query == null || query.isEmpty) return;

    // Detect if this is Singapore
    final isSg = await _detectIfSingapore(lat: lat, lon: lon, query: query);

    if (isSg) {
      await _evaluateSingapore(config, lat: lat ?? 1.3521, lon: lon ?? 103.8198, inQuietHours: inQuietHours);
    } else {
      await _evaluateGlobal(config, query: query, inQuietHours: inQuietHours);
    }
  }

  bool _isQuietHours(LocationAlertConfig config, DateTime now) {
    if (!config.quietHoursEnabled) return false;
    final start = config.quietHoursStartHour;
    final end = config.quietHoursEndHour;

    if (start < end) {
      return now.hour >= start && now.hour < end;
    } else {
      // Wraps around midnight (e.g. 22:00 to 07:00)
      return now.hour >= start || now.hour < end;
    }
  }

  Future<bool> _detectIfSingapore({double? lat, double? lon, required String query}) async {
    final lowerQuery = query.toLowerCase();
    if (lowerQuery.contains('singapore')) return true;

    if (lat != null && lon != null) {
      if (lat >= 1.15 && lat <= 1.50 && lon >= 103.55 && lon <= 104.15) {
        return true;
      }
    }

    // Check saved flag or cached snapshot if available
    final isSingaporeFlag = await PreferencesService.loadIsSingapore();
    if (query == 'current_location' && isSingaporeFlag) {
      return true;
    }

    return false;
  }

  // ==========================================
  // Singapore Alert Evaluation (NEA & PUB data)
  // ==========================================
  Future<void> _evaluateSingapore(
    LocationAlertConfig config, {
    required double lat,
    required double lon,
    required bool inQuietHours,
  }) async {
    final sgService = SingaporeWeatherService();
    final now = DateTime.now();

    // 1. PUB Flood Alerts (Severe - bypasses quiet hours)
    if (config.floodAlerts) {
      try {
        final floodAlerts = await sgService.fetchFloodAlerts();
        if (floodAlerts.isNotEmpty) {
          final firstAlert = floodAlerts.first;
          final headline = firstAlert['headline']?.toString() ?? 'Flood Warning';
          final area = firstAlert['area']?.toString() ?? '';
          final desc = firstAlert['description']?.toString() ?? '';
          final instruction = firstAlert['instruction']?.toString() ?? '';
          final alertKey = '$headline|$area';

          final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'flood');
          final lastIds = await PreferencesService.loadLastFloodAlertIds();

          final isNewAlert = !lastIds.contains(alertKey);
          final cooldownExpired = lastSent == null || now.difference(lastSent) > _floodCooldown;

          if (isNewAlert || cooldownExpired) {
            final title = '⚠️ $headline${area.isNotEmpty ? ' - $area' : ''}';
            final body = desc.isNotEmpty
                ? '$desc${instruction.isNotEmpty ? '\n$instruction' : ''}'
                : (instruction.isNotEmpty ? instruction : 'Heavy flood risk reported in your area.');

            await NotificationService().showNotification(
              id: _generateNotificationId(config.locationId, 'flood'),
              title: title,
              body: body,
              channelId: NotificationService.channelSevere,
            );

            await PreferencesService.saveLastAlertTimestamp(config.locationId, 'flood', now);
            await PreferencesService.saveLastFloodAlertIds([alertKey]);
          }
        }
      } catch (e) {
        debugPrint('PUB flood alert check failed: $e');
      }
    }

    // 2. Weather conditions from NEA
    try {
      final sgData = await sgService.fetchWeatherFromCoords(lat, lon);
      final current = sgData['current'] as Map<String, dynamic>? ?? {};
      final conditionText = (current['condition']?['text'] ?? '').toString();
      final tempC = (current['temp_c'] as num?)?.toDouble() ?? 0.0;
      final windKph = (current['wind_kph'] as num?)?.toDouble() ?? 0.0;
      final aqi = (current['aqi'] as num?)?.toInt() ?? 0;
      final hourly = (sgData['widget_next_hours'] as List?) ?? [];

      // Check Severe Weather (Thunderstorm / Heavy Storm)
      if (config.severeWeather) {
        final condLower = conditionText.toLowerCase();
        final isSevere = condLower.contains('thunder') ||
            condLower.contains('storm') ||
            condLower.contains('heavy rain') ||
            condLower.contains('squall');

        if (isSevere) {
          final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'severe');
          if (lastSent == null || now.difference(lastSent) > _severeCooldown) {
            await NotificationService().showNotification(
              id: _generateNotificationId(config.locationId, 'severe'),
              title: '⚡ Severe Storm Alert • ${config.locationName}',
              body: '$conditionText detected in ${current['area_name'] ?? config.locationName}. Take shelter indoors.',
              channelId: NotificationService.channelSevere,
            );
            await PreferencesService.saveLastAlertTimestamp(config.locationId, 'severe', now);
          }
        }
      }

      // If in quiet hours, skip the remaining non-severe notifications
      if (inQuietHours) return;

      // Check Rain Alerts
      if (config.rainAlerts) {
        bool hasImpendingRain = false;
        String rainReason = conditionText;

        final condLower = conditionText.toLowerCase();
        if (condLower.contains('shower') || condLower.contains('rain')) {
          hasImpendingRain = true;
        } else {
          // Check next 2-3 hours forecast
          for (int i = 0; i < hourly.length && i < 3; i++) {
            final h = hourly[i];
            final hChance = (h['chance_of_rain'] as num?)?.toInt() ?? 0;
            final hCond = (h['condition']?['text'] ?? '').toString().toLowerCase();
            if (hChance >= config.rainChanceThreshold || hCond.contains('rain') || hCond.contains('shower')) {
              hasImpendingRain = true;
              rainReason = h['condition']?['text'] ?? 'Rain showers';
              break;
            }
          }
        }

        if (hasImpendingRain) {
          final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'rain');
          if (lastSent == null || now.difference(lastSent) > _rainCooldown) {
            await NotificationService().showNotification(
              id: _generateNotificationId(config.locationId, 'rain'),
              title: '🌧️ Rain Alert • ${config.locationName}',
              body: '$rainReason expected in ${config.locationName}. Don\'t forget your umbrella!',
              channelId: NotificationService.channelWeather,
            );
            await PreferencesService.saveLastAlertTimestamp(config.locationId, 'rain', now);
          }
        }
      }

      // Check High Wind
      if (config.highWind && windKph >= config.windSpeedThreshold) {
        final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'wind');
        if (lastSent == null || now.difference(lastSent) > _windCooldown) {
          await NotificationService().showNotification(
            id: _generateNotificationId(config.locationId, 'wind'),
            title: '💨 High Wind Warning • ${config.locationName}',
            body: 'Strong winds detected up to ${windKph.round()} km/h. Secure loose outdoor objects.',
            channelId: NotificationService.channelWeather,
          );
          await PreferencesService.saveLastAlertTimestamp(config.locationId, 'wind', now);
        }
      }

      // Check Temperature Extremes
      if (config.extremeHeat && tempC >= config.heatThresholdC) {
        final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'heat');
        if (lastSent == null || now.difference(lastSent) > _tempCooldown) {
          await NotificationService().showNotification(
            id: _generateNotificationId(config.locationId, 'heat'),
            title: '☀️ Extreme Heat Advisory • ${config.locationName}',
            body: 'Temperature has reached ${tempC.round()}°C. Stay hydrated and avoid prolonged sun exposure.',
            channelId: NotificationService.channelWeather,
          );
          await PreferencesService.saveLastAlertTimestamp(config.locationId, 'heat', now);
        }
      }

      if (config.coldSnap && tempC <= config.coldThresholdC && tempC > 0) {
        final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'cold');
        if (lastSent == null || now.difference(lastSent) > _tempCooldown) {
          await NotificationService().showNotification(
            id: _generateNotificationId(config.locationId, 'cold'),
            title: '❄️ Cold Temperature Alert • ${config.locationName}',
            body: 'Temperature has dropped to ${tempC.round()}°C.',
            channelId: NotificationService.channelWeather,
          );
          await PreferencesService.saveLastAlertTimestamp(config.locationId, 'cold', now);
        }
      }

      // Check Air Quality (PSI)
      if (config.aqiAlert && aqi >= config.aqiThreshold) {
        final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'aqi');
        if (lastSent == null || now.difference(lastSent) > _aqiCooldown) {
          await NotificationService().showNotification(
            id: _generateNotificationId(config.locationId, 'aqi'),
            title: '😷 Unhealthy Air Quality Alert • ${config.locationName}',
            body: 'Air Quality (PSI) is at $aqi. Consider reducing strenuous outdoor physical exertion.',
            channelId: NotificationService.channelWeather,
          );
          await PreferencesService.saveLastAlertTimestamp(config.locationId, 'aqi', now);
        }
      }

      // Check Daily Briefing
      await _checkDailyBriefing(config, sgData, now);
    } catch (e) {
      debugPrint('Singapore weather alert check failed: $e');
    }
  }

  // ==========================================
  // Global Alert Evaluation (Open-Meteo data)
  // ==========================================
  Future<void> _evaluateGlobal(
    LocationAlertConfig config, {
    required String query,
    required bool inQuietHours,
  }) async {
    final weatherService = WeatherService();
    final now = DateTime.now();

    try {
      final allData = await weatherService.fetchAllWeatherData(query);
      final weather = allData['weather'] ?? {};
      final forecast = allData['forecast'] ?? {};

      final current = weather['current'] as Map<String, dynamic>? ?? {};
      final tempC = (current['temp_c'] as num?)?.toDouble() ?? 0.0;
      final windKph = (current['wind_kph'] as num?)?.toDouble() ?? 0.0;
      final aqi = (current['aqi'] as num?)?.toInt() ?? 0;
      final uv = (current['uv'] as num?)?.toDouble() ?? 0.0;
      final conditionText = (current['condition']?['text'] ?? '').toString();

      // Check Severe Weather
      if (config.severeWeather) {
        final condLower = conditionText.toLowerCase();
        final isSevere = condLower.contains('thunder') ||
            condLower.contains('storm') ||
            condLower.contains('squall') ||
            condLower.contains('blizzard') ||
            condLower.contains('tornado');

        if (isSevere) {
          final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'severe');
          if (lastSent == null || now.difference(lastSent) > _severeCooldown) {
            await NotificationService().showNotification(
              id: _generateNotificationId(config.locationId, 'severe'),
              title: '⚡ Severe Storm Warning • ${config.locationName}',
              body: '$conditionText detected for ${config.locationName}. Stay safe indoors.',
              channelId: NotificationService.channelSevere,
            );
            await PreferencesService.saveLastAlertTimestamp(config.locationId, 'severe', now);
          }
        }
      }

      // If in quiet hours, skip remaining non-severe notifications
      if (inQuietHours) return;

      // Check Rain Alerts
      if (config.rainAlerts) {
        bool hasImpendingRain = false;
        final condLower = conditionText.toLowerCase();
        if (condLower.contains('rain') || condLower.contains('shower') || condLower.contains('drizzle')) {
          hasImpendingRain = true;
        } else {
          // Check upcoming hourly forecast
          final forecastDays = (forecast['forecast']?['forecastday'] as List?) ?? [];
          if (forecastDays.isNotEmpty) {
            final hours = (forecastDays.first['hour'] as List?) ?? [];
            for (final h in hours) {
              final timeStr = h['time']?.toString() ?? '';
              final hTime = DateTime.tryParse(timeStr);
              if (hTime != null && hTime.isAfter(now) && hTime.isBefore(now.add(const Duration(hours: 3)))) {
                final chance = (h['chance_of_rain'] as num?)?.toInt() ?? 0;
                if (chance >= config.rainChanceThreshold) {
                  hasImpendingRain = true;
                  break;
                }
              }
            }
          }
        }

        if (hasImpendingRain) {
          final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'rain');
          if (lastSent == null || now.difference(lastSent) > _rainCooldown) {
            await NotificationService().showNotification(
              id: _generateNotificationId(config.locationId, 'rain'),
              title: '🌧️ Rain Alert • ${config.locationName}',
              body: 'Rain expected in ${config.locationName}. Grab an umbrella before you leave!',
              channelId: NotificationService.channelWeather,
            );
            await PreferencesService.saveLastAlertTimestamp(config.locationId, 'rain', now);
          }
        }
      }

      // Check Wind Alerts
      if (config.highWind && windKph >= config.windSpeedThreshold) {
        final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'wind');
        if (lastSent == null || now.difference(lastSent) > _windCooldown) {
          await NotificationService().showNotification(
            id: _generateNotificationId(config.locationId, 'wind'),
            title: '💨 High Wind Warning • ${config.locationName}',
            body: 'Strong winds recorded up to ${windKph.round()} km/h.',
            channelId: NotificationService.channelWeather,
          );
          await PreferencesService.saveLastAlertTimestamp(config.locationId, 'wind', now);
        }
      }

      // Check Heat Alert
      if (config.extremeHeat && tempC >= config.heatThresholdC) {
        final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'heat');
        if (lastSent == null || now.difference(lastSent) > _tempCooldown) {
          await NotificationService().showNotification(
            id: _generateNotificationId(config.locationId, 'heat'),
            title: '☀️ Extreme Heat Advisory • ${config.locationName}',
            body: 'Temperature is ${tempC.round()}°C. Stay hydrated and seek shade.',
            channelId: NotificationService.channelWeather,
          );
          await PreferencesService.saveLastAlertTimestamp(config.locationId, 'heat', now);
        }
      }

      // Check Cold Snap
      if (config.coldSnap && tempC <= config.coldThresholdC) {
        final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'cold');
        if (lastSent == null || now.difference(lastSent) > _tempCooldown) {
          await NotificationService().showNotification(
            id: _generateNotificationId(config.locationId, 'cold'),
            title: '❄️ Cold Weather Alert • ${config.locationName}',
            body: 'Temperature has dropped to ${tempC.round()}°C. Bundle up!',
            channelId: NotificationService.channelWeather,
          );
          await PreferencesService.saveLastAlertTimestamp(config.locationId, 'cold', now);
        }
      }

      // Check UV Alert
      if (config.uvAlert && uv >= config.uvThreshold) {
        final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'uv');
        if (lastSent == null || now.difference(lastSent) > _tempCooldown) {
          await NotificationService().showNotification(
            id: _generateNotificationId(config.locationId, 'uv'),
            title: '🕶️ High UV Advisory • ${config.locationName}',
            body: 'UV Index is currently ${uv.toStringAsFixed(1)}. Sun protection is strongly advised.',
            channelId: NotificationService.channelWeather,
          );
          await PreferencesService.saveLastAlertTimestamp(config.locationId, 'uv', now);
        }
      }

      // Check AQI
      if (config.aqiAlert && aqi >= config.aqiThreshold) {
        final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'aqi');
        if (lastSent == null || now.difference(lastSent) > _aqiCooldown) {
          await NotificationService().showNotification(
            id: _generateNotificationId(config.locationId, 'aqi'),
            title: '😷 Air Quality Advisory • ${config.locationName}',
            body: 'Air Quality Index has reached $aqi. Sensitive individuals should take precautions.',
            channelId: NotificationService.channelWeather,
          );
          await PreferencesService.saveLastAlertTimestamp(config.locationId, 'aqi', now);
        }
      }

      // Check Daily Briefing
      await _checkDailyBriefing(config, weather, now);
    } catch (e) {
      debugPrint('Global weather alert check failed: $e');
    }
  }

  // ==========================================
  // Daily Morning Forecast Briefing
  // ==========================================
  Future<void> _checkDailyBriefing(
    LocationAlertConfig config,
    Map<String, dynamic> weatherData,
    DateTime now,
  ) async {
    if (!config.dailyBriefing) return;

    // Check if the current time matches the scheduled time within a 45 min window
    final scheduledMinutes = config.dailyBriefingHour * 60 + config.dailyBriefingMinute;
    final currentMinutes = now.hour * 60 + now.minute;
    final diff = currentMinutes - scheduledMinutes;

    if (diff >= 0 && diff < 45) {
      final lastSent = await PreferencesService.loadLastAlertTimestamp(config.locationId, 'briefing');
      final alreadySentToday = lastSent != null &&
          lastSent.year == now.year &&
          lastSent.month == now.month &&
          lastSent.day == now.day;

      if (!alreadySentToday) {
        final current = weatherData['current'] as Map<String, dynamic>? ?? {};
        final condition = current['condition']?['text'] ?? 'Fair';
        final useFahrenheit = GlobalData.useFahrenheit;

        final num? tempVal = useFahrenheit ? current['temp_f'] : current['temp_c'];
        final num? highVal = useFahrenheit
            ? weatherData['widget_today_high_f']
            : weatherData['widget_today_high_c'];
        final num? lowVal = useFahrenheit
            ? weatherData['widget_today_low_f']
            : weatherData['widget_today_low_c'];

        final unit = useFahrenheit ? '°F' : '°C';
        final tempStr = tempVal != null ? '${tempVal.round()}$unit' : '';
        final highLowStr = (highVal != null && lowVal != null)
            ? 'High ${highVal.round()}$unit / Low ${lowVal.round()}$unit'
            : '';

        final title = '🌤️ Good Morning! Today in ${config.locationName}';
        final body = '$condition, currently $tempStr. $highLowStr. Have a wonderful day!';

        await NotificationService().showNotification(
          id: _generateNotificationId(config.locationId, 'briefing'),
          title: title,
          body: body,
          channelId: NotificationService.channelBriefing,
        );

        await PreferencesService.saveLastAlertTimestamp(config.locationId, 'briefing', now);
      }
    }
  }

  /// Sends a sample notification immediately for testing
  Future<void> sendTestAlert(LocationAlertConfig config) async {
    await NotificationService().initialize();
    await NotificationService().showNotification(
      id: 9999,
      title: '🔔 Test Weather Alert • ${config.locationName}',
      body: 'Weather notifications are working perfectly for ${config.locationName}!',
      channelId: NotificationService.channelWeather,
    );
  }

  int _generateNotificationId(String locationId, String alertType) {
    return (locationId.hashCode ^ alertType.hashCode).abs() % 100000;
  }
}
