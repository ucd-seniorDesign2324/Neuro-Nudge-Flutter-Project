import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Class for initializing and defining app notification service
class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin = 
    FlutterLocalNotificationsPlugin();

  // Initialize Android settings. Can add iOS settings if desired.
  Future<void> initNotifications() async {
    AndroidInitializationSettings initializationSettingsAndroid = 
      const AndroidInitializationSettings('neuro_icon.png');

      var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid
      );
      await _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: 
          (NotificationResponse notificationResponse) async{});
  }

  // Return notification configuration details
  notificationDetails(){
    return const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName',
        importance: Importance.max
        )
    );
  }

  // 
  Future showNotification( { int id = 0, String? title, String? body, String? payload} ) async {
      return _notificationsPlugin.show(id, title, body, await notificationDetails());
  }
}