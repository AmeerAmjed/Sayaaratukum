import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/route_manager.dart';
import 'package:sayaaratukum/ui/route/page.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() => _notificationService;

  NotificationService._internal();

  static const channelId = "1";
  static const channelName = "newProduct";

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    channelId,
    channelName,
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  static const DarwinNotificationDetails _iOSNotificationDetails =
      DarwinNotificationDetails();

  static const NotificationDetails notificationDetails = NotificationDetails(
    android: _androidNotificationDetails,
    iOS: _iOSNotificationDetails,
  );

  Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings(
      defaultPresentAlert: false,
      defaultPresentBadge: false,
      defaultPresentSound: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
      // onDidReceiveBackgroundNotificationResponse: onSelectNotification,
    );
  }

  Future<void> onSelectNotification(NotificationResponse payload) async {
    await Get.toNamed(RouteScreen.notification);
  }

  Future<void> requestPermissions() async {
    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestPermission();
      const AndroidNotificationChannel androidNotificationChannel =
          AndroidNotificationChannel(
        channelId,
        channelName,
        playSound: true,
        importance: Importance.high,
      );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidNotificationChannel);
    }
  }

  static Future<void> show({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
