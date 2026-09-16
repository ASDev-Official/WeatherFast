import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  static const String channelSevere = 'wf_severe_alerts';
  static const String channelWeather = 'wf_weather_alerts';
  static const String channelBriefing = 'wf_daily_briefing';

  Future<void> initialize() async {
    if (_initialized || kIsWeb) return;

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const linuxSettings = LinuxInitializationSettings(defaultActionName: 'Open');

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
      macOS: darwinSettings,
      linux: linuxSettings,
    );

    await _notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification click if needed
      },
    );

    // Create Notification Channels for Android
    final androidPlugin = _notificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlugin != null) {
      await androidPlugin.createNotificationChannel(
        const AndroidNotificationChannel(
          channelSevere,
          'Severe Weather & Flood Alerts',
          description: 'High-priority alerts for flash floods, thunderstorms, and severe conditions',
          importance: Importance.max,
          enableVibration: true,
          playSound: true,
        ),
      );

      await androidPlugin.createNotificationChannel(
        const AndroidNotificationChannel(
          channelWeather,
          'Weather Advisories & Rain',
          description: 'Alerts for impending rain, high winds, and temperature shifts',
          importance: Importance.high,
          enableVibration: true,
          playSound: true,
        ),
      );

      await androidPlugin.createNotificationChannel(
        const AndroidNotificationChannel(
          channelBriefing,
          'Daily Weather Briefing',
          description: 'Daily morning weather summary notifications',
          importance: Importance.defaultImportance,
          playSound: true,
        ),
      );
    }

    _initialized = true;
  }

  Future<bool> requestPermissions() async {
    if (kIsWeb) return false;

    // Android 13+
    final androidPlugin = _notificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlugin != null) {
      final granted = await androidPlugin.requestNotificationsPermission();
      return granted ?? false;
    }

    // iOS
    final iosPlugin = _notificationsPlugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (iosPlugin != null) {
      final granted = await iosPlugin.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    // macOS
    final macPlugin = _notificationsPlugin.resolvePlatformSpecificImplementation<
        MacOSFlutterLocalNotificationsPlugin>();
    if (macPlugin != null) {
      final granted = await macPlugin.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    return true;
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String channelId = channelWeather,
    String? payload,
  }) async {
    if (kIsWeb) return;
    if (!_initialized) {
      await initialize();
    }

    final isSevere = channelId == channelSevere;

    final androidDetails = AndroidNotificationDetails(
      channelId,
      channelId == channelSevere
          ? 'Severe Weather & Flood Alerts'
          : (channelId == channelBriefing ? 'Daily Weather Briefing' : 'Weather Advisories & Rain'),
      channelDescription: isSevere ? 'High-priority severe and flood alerts' : 'Weather forecast alerts',
      importance: isSevere ? Importance.max : (channelId == channelBriefing ? Importance.defaultImportance : Importance.high),
      priority: isSevere ? Priority.max : Priority.high,
      showWhen: true,
      styleInformation: BigTextStyleInformation(
        body,
        contentTitle: title,
        summaryText: isSevere ? 'Severe Weather Alert' : 'WeatherFast',
      ),
    );

    final darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      interruptionLevel: isSevere ? InterruptionLevel.critical : InterruptionLevel.active,
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
      macOS: darwinDetails,
    );

    await _notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  Future<void> cancel(int id) async {
    if (kIsWeb) return;
    await _notificationsPlugin.cancel(id);
  }

  Future<void> cancelAll() async {
    if (kIsWeb) return;
    await _notificationsPlugin.cancelAll();
  }
}
