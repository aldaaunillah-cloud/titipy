import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {

  static final FlutterLocalNotificationsPlugin
      flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future initialize() async {

    FirebaseMessaging messaging =
        FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    String? token =
        await messaging.getToken();

    print("FCM TOKEN:");
    print(token);

    const AndroidInitializationSettings
        androidInitializationSettings =
        AndroidInitializationSettings(
            '@mipmap/ic_launcher');

    const InitializationSettings
        initializationSettings =
        InitializationSettings(
      android:
          androidInitializationSettings,
    );

    await flutterLocalNotificationsPlugin
        .initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen(

      (RemoteMessage message) {

        flutterLocalNotificationsPlugin
            .show(
          0,

          message.notification?.title ??
              "Notifikasi",

          message.notification?.body ??
              "",

          const NotificationDetails(

            android: AndroidNotificationDetails(
              'titipy_channel',
              'Titipy Notification',
              importance:
                  Importance.max,
              priority:
                  Priority.high,
            ),
          ),
        );
      },
    );
  }
}