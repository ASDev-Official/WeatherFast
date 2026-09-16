import 'dart:convert';

class LocationAlertConfig {
  final String locationId;
  final String locationName;
  final bool enabled;

  // Severe & Flood
  final bool floodAlerts;
  final bool severeWeather;
  final bool highWind;
  final double windSpeedThreshold; // in km/h

  // Rain & Precipitation
  final bool rainAlerts;
  final int rainChanceThreshold; // 1-100%

  // Temperature & Sun
  final bool extremeHeat;
  final double heatThresholdC;
  final bool coldSnap;
  final double coldThresholdC;
  final bool uvAlert;
  final double uvThreshold;

  // Air Quality
  final bool aqiAlert;
  final int aqiThreshold;

  // Daily Briefing
  final bool dailyBriefing;
  final int dailyBriefingHour;
  final int dailyBriefingMinute;

  // Quiet Hours
  final bool quietHoursEnabled;
  final int quietHoursStartHour;
  final int quietHoursEndHour;

  const LocationAlertConfig({
    required this.locationId,
    required this.locationName,
    this.enabled = false,
    this.floodAlerts = true,
    this.severeWeather = true,
    this.highWind = true,
    this.windSpeedThreshold = 50.0,
    this.rainAlerts = true,
    this.rainChanceThreshold = 50,
    this.extremeHeat = false,
    this.heatThresholdC = 33.0,
    this.coldSnap = false,
    this.coldThresholdC = 10.0,
    this.uvAlert = false,
    this.uvThreshold = 8.0,
    this.aqiAlert = false,
    this.aqiThreshold = 100,
    this.dailyBriefing = false,
    this.dailyBriefingHour = 8,
    this.dailyBriefingMinute = 0,
    this.quietHoursEnabled = false,
    this.quietHoursStartHour = 22,
    this.quietHoursEndHour = 7,
  });

  LocationAlertConfig copyWith({
    String? locationId,
    String? locationName,
    bool? enabled,
    bool? floodAlerts,
    bool? severeWeather,
    bool? highWind,
    double? windSpeedThreshold,
    bool? rainAlerts,
    int? rainChanceThreshold,
    bool? extremeHeat,
    double? heatThresholdC,
    bool? coldSnap,
    double? coldThresholdC,
    bool? uvAlert,
    double? uvThreshold,
    bool? aqiAlert,
    int? aqiThreshold,
    bool? dailyBriefing,
    int? dailyBriefingHour,
    int? dailyBriefingMinute,
    bool? quietHoursEnabled,
    int? quietHoursStartHour,
    int? quietHoursEndHour,
  }) {
    return LocationAlertConfig(
      locationId: locationId ?? this.locationId,
      locationName: locationName ?? this.locationName,
      enabled: enabled ?? this.enabled,
      floodAlerts: floodAlerts ?? this.floodAlerts,
      severeWeather: severeWeather ?? this.severeWeather,
      highWind: highWind ?? this.highWind,
      windSpeedThreshold: windSpeedThreshold ?? this.windSpeedThreshold,
      rainAlerts: rainAlerts ?? this.rainAlerts,
      rainChanceThreshold: rainChanceThreshold ?? this.rainChanceThreshold,
      extremeHeat: extremeHeat ?? this.extremeHeat,
      heatThresholdC: heatThresholdC ?? this.heatThresholdC,
      coldSnap: coldSnap ?? this.coldSnap,
      coldThresholdC: coldThresholdC ?? this.coldThresholdC,
      uvAlert: uvAlert ?? this.uvAlert,
      uvThreshold: uvThreshold ?? this.uvThreshold,
      aqiAlert: aqiAlert ?? this.aqiAlert,
      aqiThreshold: aqiThreshold ?? this.aqiThreshold,
      dailyBriefing: dailyBriefing ?? this.dailyBriefing,
      dailyBriefingHour: dailyBriefingHour ?? this.dailyBriefingHour,
      dailyBriefingMinute: dailyBriefingMinute ?? this.dailyBriefingMinute,
      quietHoursEnabled: quietHoursEnabled ?? this.quietHoursEnabled,
      quietHoursStartHour: quietHoursStartHour ?? this.quietHoursStartHour,
      quietHoursEndHour: quietHoursEndHour ?? this.quietHoursEndHour,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'locationId': locationId,
      'locationName': locationName,
      'enabled': enabled,
      'floodAlerts': floodAlerts,
      'severeWeather': severeWeather,
      'highWind': highWind,
      'windSpeedThreshold': windSpeedThreshold,
      'rainAlerts': rainAlerts,
      'rainChanceThreshold': rainChanceThreshold,
      'extremeHeat': extremeHeat,
      'heatThresholdC': heatThresholdC,
      'coldSnap': coldSnap,
      'coldThresholdC': coldThresholdC,
      'uvAlert': uvAlert,
      'uvThreshold': uvThreshold,
      'aqiAlert': aqiAlert,
      'aqiThreshold': aqiThreshold,
      'dailyBriefing': dailyBriefing,
      'dailyBriefingHour': dailyBriefingHour,
      'dailyBriefingMinute': dailyBriefingMinute,
      'quietHoursEnabled': quietHoursEnabled,
      'quietHoursStartHour': quietHoursStartHour,
      'quietHoursEndHour': quietHoursEndHour,
    };
  }

  factory LocationAlertConfig.fromMap(Map<String, dynamic> map) {
    return LocationAlertConfig(
      locationId: map['locationId']?.toString() ?? '',
      locationName: map['locationName']?.toString() ?? '',
      enabled: map['enabled'] as bool? ?? false,
      floodAlerts: map['floodAlerts'] as bool? ?? true,
      severeWeather: map['severeWeather'] as bool? ?? true,
      highWind: map['highWind'] as bool? ?? true,
      windSpeedThreshold: (map['windSpeedThreshold'] as num?)?.toDouble() ?? 50.0,
      rainAlerts: map['rainAlerts'] as bool? ?? true,
      rainChanceThreshold: (map['rainChanceThreshold'] as num?)?.toInt() ?? 50,
      extremeHeat: map['extremeHeat'] as bool? ?? false,
      heatThresholdC: (map['heatThresholdC'] as num?)?.toDouble() ?? 33.0,
      coldSnap: map['coldSnap'] as bool? ?? false,
      coldThresholdC: (map['coldThresholdC'] as num?)?.toDouble() ?? 10.0,
      uvAlert: map['uvAlert'] as bool? ?? false,
      uvThreshold: (map['uvThreshold'] as num?)?.toDouble() ?? 8.0,
      aqiAlert: map['aqiAlert'] as bool? ?? false,
      aqiThreshold: (map['aqiThreshold'] as num?)?.toInt() ?? 100,
      dailyBriefing: map['dailyBriefing'] as bool? ?? false,
      dailyBriefingHour: (map['dailyBriefingHour'] as num?)?.toInt() ?? 8,
      dailyBriefingMinute: (map['dailyBriefingMinute'] as num?)?.toInt() ?? 0,
      quietHoursEnabled: map['quietHoursEnabled'] as bool? ?? false,
      quietHoursStartHour: (map['quietHoursStartHour'] as num?)?.toInt() ?? 22,
      quietHoursEndHour: (map['quietHoursEndHour'] as num?)?.toInt() ?? 7,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory LocationAlertConfig.fromJson(String source) =>
      LocationAlertConfig.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
