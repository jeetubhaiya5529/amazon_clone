import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Request Notification Permissions
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user granted provisional permission');
    } else {
      print('user denied permission');
    }
  }

  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_notification');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: (payload) {
        // handleMessage(context, message);
      },
    );
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.notification!.title.toString());
      print(message.notification!.body.toString());
      print(message.data.toString());
      print(message.data['type']);
      print(message.data['id']);

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      } else {
        showNotification(message);
      }
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(10000).toString(),
      'High Importance Notification',
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
      showWhen: false,
      icon: 'ic_notification',
    );

    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  // Get Device Token
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  // If token expire referesh it
  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print('Refresh');
    });
  }

  // Future<void> setupInteractMessage(BuildContext context) async {
  //   // when app is terminated
  //   RemoteMessage? initialMessage =
  //       await FirebaseMessaging.instance.getInitialMessage();

  //   if (initialMessage != null) {
  //     handleMessage(context, initialMessage);
  //   }

  //   // when app is inBackground
  //   FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //     handleMessage(context, event);
  //   });
  // }

  // void handleMessage(BuildContext context, RemoteMessage message) {
  //   if (message.data['type'] == 'msg') {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => HomeScreen(
  //                   id: message.data['id'],
  //                 )));
  //   }
  // }
}
