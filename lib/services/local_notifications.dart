import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'Package:timezone/timezone.dart' as tz;

class LocalNotifications{

  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  
  
  static final onClickNotification = BehaviorSubject<String>();

// on tap Notification
static void onNotificationTap(NotificationResponse notificationResponse){
  onClickNotification.add(notificationResponse.payload!);
  
}


// initialize the local notifications
  static Future init() async {
    // Implement the code to initialize the local notifications
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
        onDidReceiveLocalNotification: ( id , title , body , payload ) => null );
final LinuxInitializationSettings initializationSettingsLinux =
    LinuxInitializationSettings(
        defaultActionName: 'Open notification');
        final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
    linux: initializationSettingsLinux);
_flutterLocalNotificationsPlugin.initialize(initializationSettings,
    onDidReceiveNotificationResponse: onNotificationTap,
    onDidReceiveBackgroundNotificationResponse: onNotificationTap);
_flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
    AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }


// show simple notification
  static Future<void> showSimpleNotification({
    required String title,
    required String body,
    required String payload,
    required int id,
  }) async {
    // Implement the code to show a notification
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
await _flutterLocalNotificationsPlugin.show(
    id, title, body, notificationDetails,
    payload: payload);
  }


// show periodic notification
static Future showPeriodicNotifications(
 { required String title,
    required String body,
    required String payload,
    required int id,
    required RepeatInterval interval
    }
)async{

 try{
   const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channel 2', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
  await _flutterLocalNotificationsPlugin.periodicallyShow(id, title, body, interval, notificationDetails);
 }catch(e){
  print(e.toString());
 }
}

// show scheduled notification
static Future showScheduledNotification(
  { required String title,
    required String body,
    required String payload,
    required int id,
    required interval
    }
)async{
 tz.initializeTimeZones();
 var localtime = tz.local;
 



  await _flutterLocalNotificationsPlugin.zonedSchedule(
    id, 
    title, 
    body,
    tz.TZDateTime.now(localtime).add( Duration(minutes: interval)),
      NotificationDetails(
        android: AndroidNotificationDetails(
            'channel 3', 'Water Reminder',
            channelDescription: 'your channel description')
            ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
       uiLocalNotificationDateInterpretation:  UILocalNotificationDateInterpretation.absoluteTime);

}

// cancel specific notification
static Future<void> cancelNotification(int id) async {
    // Implement the code to cancel the notification with the given id
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

//cancel set of notifications
static Future<void> cancelListNotifications(List ids)async{
for (var element in ids) { 
  _flutterLocalNotificationsPlugin.cancel(element);
}
}

// cancel all notifications
  static Future<void> cancelAllNotifications() async {
    // Implement the code to cancel all notifications
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

}