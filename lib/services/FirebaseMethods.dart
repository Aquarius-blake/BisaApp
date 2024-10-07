import 'package:bisa_app/services/local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future<void> handleBackgroundMessage(RemoteMessage message)async{
  print('Title : ${message.notification?.title}');
  print('body : ${message.notification?.body}');
  print('payload : ${message.data}');
}

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initfirebaseNotifs()async{
    await _firebaseMessaging.requestPermission();
    final FCM = await _firebaseMessaging.getToken();
    print("Token: $FCM");
   await SharedPreferences.getInstance().then((value) {
      value.setString('FCMToken', FCM ?? "" );
    });

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message){
      final notification = message.notification;
      if(notification==null){
        return;
      }else{
        LocalNotifications.showSimpleNotification(
          title: notification.title ?? "", body: notification.body ?? "", payload: "", id: notification.hashCode
          );
      }
    });
  }


}