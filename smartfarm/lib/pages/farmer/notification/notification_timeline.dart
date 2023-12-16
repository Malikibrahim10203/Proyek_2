import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ShowNotificationTimeline extends StatelessWidget {
  const ShowNotificationTimeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification example'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('show notification'),
          onPressed: () async {
            showNotification2b();
          },
        ),
      ),
    );
  }

  showNotification1a() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high channel',
      'Very important notification!!',
      description: 'the first notification',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Peringatan',
      'waktunya memberikan pupuk (NPK). Status tanah kekurangan nutrisi. Rekomendasi pupuk (..). Dosis pupuk (..).',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }

  showNotification1b() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high channel',
      'Very important notification!!',
      description: 'the first notification',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Peringatan',
      'waktunya memberikan pupuk (Urea). Status tanah kekurangan nutrisi. Rekomendasi pupuk (..). Dosis pupuk (..).',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }

  showNotification2a() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high channel',
      'Very important notification!!',
      description: 'the first notification',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Peringatan',
      'waktunya memberikan pupuk (Fosfor). Status tanah kekurangan nutrisi. Rekomendasi pupuk (..). Dosis pupuk (..).',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }

  showNotification2b() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high channel',
      'Very important notification!!',
      description: 'the first notification',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Peringatan',
      'waktunya memberikan pupuk (Kalium). Status tanah kekurangan nutrisi. Rekomendasi pupuk (..). Dosis pupuk (..).',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }
}