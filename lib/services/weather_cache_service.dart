import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class WeatherCacheSnapshot {
  const WeatherCacheSnapshot({
    required this.locationQuery,
    required this.weatherData,
    required this.forecastData,
    required this.fetchedAt,
  });

  final String locationQuery;
  final Map<String, dynamic> weatherData;
  final Map<String, dynamic> forecastData;
  final DateTime fetchedAt;
}

class WeatherCacheService {
  static const _keyWeatherSnapshot = 'weather_snapshot_v1';

  static Future<void> saveSnapshot({
    required String locationQuery,
    required Map<String, dynamic> weatherData,
    required Map<String, dynamic> forecastData,
    DateTime? fetchedAt,
  }) async {
    await saveSnapshotFor(
      locationQuery,
      weatherData: weatherData,
      forecastData: forecastData,
      fetchedAt: fetchedAt,
    );
    // Also save as default snapshot for backward compatibility
    final prefs = await SharedPreferences.getInstance();
    final payload = <String, dynamic>{
      'locationQuery': locationQuery,
      'weatherData': weatherData,
      'forecastData': forecastData,
      'fetchedAt': (fetchedAt ?? DateTime.now().toUtc()).toIso8601String(),
    };
    await prefs.setString(_keyWeatherSnapshot, jsonEncode(payload));
  }

  static Future<WeatherCacheSnapshot?> loadSnapshot() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_keyWeatherSnapshot);
    if (raw == null || raw.isEmpty) {
      return null;
    }

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) {
        return null;
      }

      final query = (decoded['locationQuery'] ?? '').toString();
      final weatherData = decoded['weatherData'];
      final forecastData = decoded['forecastData'];
      final fetchedAtRaw = (decoded['fetchedAt'] ?? '').toString();

      if (query.isEmpty ||
          weatherData is! Map<String, dynamic> ||
          forecastData is! Map<String, dynamic>) {
        return null;
      }

      return WeatherCacheSnapshot(
        locationQuery: query,
        weatherData: weatherData,
        forecastData: forecastData,
        fetchedAt: DateTime.tryParse(fetchedAtRaw) ?? DateTime.now().toUtc(),
      );
    } catch (_) {
      return null;
    }
  }

  static String _getCleanKey(String query) {
    // Replace characters that might be problematic in preference keys
    return query.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_');
  }

  static Future<void> saveSnapshotFor(
    String query, {
    required Map<String, dynamic> weatherData,
    required Map<String, dynamic> forecastData,
    DateTime? fetchedAt,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final payload = <String, dynamic>{
      'locationQuery': query,
      'weatherData': weatherData,
      'forecastData': forecastData,
      'fetchedAt': (fetchedAt ?? DateTime.now().toUtc()).toIso8601String(),
    };
    final key = '${_keyWeatherSnapshot}_${_getCleanKey(query)}';
    await prefs.setString(key, jsonEncode(payload));
  }

  static Future<WeatherCacheSnapshot?> loadSnapshotFor(String query) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '${_keyWeatherSnapshot}_${_getCleanKey(query)}';
    final raw = prefs.getString(key);
    if (raw == null || raw.isEmpty) {
      return null;
    }

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) {
        return null;
      }

      final resolvedQuery = (decoded['locationQuery'] ?? '').toString();
      final weatherData = decoded['weatherData'];
      final forecastData = decoded['forecastData'];
      final fetchedAtRaw = (decoded['fetchedAt'] ?? '').toString();

      if (resolvedQuery.isEmpty ||
          weatherData is! Map<String, dynamic> ||
          forecastData is! Map<String, dynamic>) {
        return null;
      }

      return WeatherCacheSnapshot(
        locationQuery: resolvedQuery,
        weatherData: weatherData,
        forecastData: forecastData,
        fetchedAt: DateTime.tryParse(fetchedAtRaw) ?? DateTime.now().toUtc(),
      );
    } catch (_) {
      return null;
    }
  }

  static Future<void> clearSnapshotFor(String query) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '${_keyWeatherSnapshot}_${_getCleanKey(query)}';
    await prefs.remove(key);
  }
}
