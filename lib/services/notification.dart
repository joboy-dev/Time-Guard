import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  /// Initialization code
  static Future init() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('mipmap/ic_launcher');

    const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }


  /// Function to show notification to the user
  static Future showNotification({var id = 0, required String title, required String body, var payload}) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    AndroidNotificationDetails androidSpecs = const AndroidNotificationDetails(
      'time_guard_id',
      'Time Guard Notifications',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );

    var notification = NotificationDetails(android: androidSpecs, iOS: const DarwinNotificationDetails());
    await flutterLocalNotificationsPlugin.show(id, title, body, notification);
  }
}