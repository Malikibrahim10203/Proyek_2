import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ShowNotificationOutTime extends StatelessWidget {
  const ShowNotificationOutTime({Key? key}) : super(key: key);

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
            showNotification1a();
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
      'waktunya memberikan pupuk (nitrogen/fosfor/kalium). Status tanahkekurangan nutrisi. Rekomendasi pupuk …. Dosis pupuk …. ',
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
      'Status tanah kelebihan nutrisi. Jangan terlalu banyak memberi pupuk',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }
}