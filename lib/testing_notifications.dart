// import 'dart:async';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:compact_pay/utils/app_colors.dart';
// import 'package:compact_pay/widgets/my_button.dart';
// import 'package:compact_pay/widgets/my_text.dart';
// import 'package:compact_pay/widgets/text_form_field.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/services.dart';
//
//
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
//
//
// class TestingNotications extends StatefulWidget {
//   const TestingNotications({Key? key}) : super(key: key);
//
//   @override
//   State<TestingNotications> createState() => _TestingNoticationsState();
// }
//
// class _TestingNoticationsState extends State<TestingNotications> {
//   String? mToken = '';
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   final TextEditingController _userName = TextEditingController();
//   final TextEditingController _title = TextEditingController();
//   final TextEditingController _body = TextEditingController();
//
//   /// A notification action which triggers a App navigation event
//   static const String navigationActionId = 'id_3';
//
//   final StreamController didReceiveLocalNotificationStream =
//   StreamController.broadcast();
//
//   final StreamController<String?> selectNotificationStream =
//   StreamController<String?>.broadcast();
//
//   @pragma('vm:entry-point')
//   void notificationTapBackground(NotificationResponse notificationResponse) {
//     // ignore: avoid_print
//     print('notification(${notificationResponse.id}) action tapped: '
//         '${notificationResponse.actionId} with'
//         ' payload: ${notificationResponse.payload}');
//     if (notificationResponse.input?.isNotEmpty ?? false) {
//       // ignore: avoid_print
//       print(
//           'notification action tapped with input: ${notificationResponse.input}');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     requestPermission();
//     getToken();
//   }
//
//   initInfo() async{
//     var androidInitialize = const AndroidInitializationSettings('@mipmap/ic_launcher.png');
//     var iOSInitialize =  const DarwinInitializationSettings();
//     var initializationSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
//
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) {
//         switch (notificationResponse.notificationResponseType) {
//           case NotificationResponseType.selectedNotification:
//             selectNotificationStream.add(notificationResponse.payload);
//             break;
//           case NotificationResponseType.selectedNotificationAction:
//             if (notificationResponse.actionId == navigationActionId) {
//               selectNotificationStream.add(notificationResponse.payload);
//             }
//             break;
//         }
//       },
//       onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//     );
//     //
//     //     onSelectNotification: (String? payload) async {
//     //   try {
//     //     if (payload != null && payload.isNotEmpty) {
//     //
//     //     }else {
//     //
//     //     }
//     //   }catch (e) {
//     //   }
//     //   return;
//     // });
//   }
//
//   void requestPermission() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User Granted Permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print('User Granted Provisional Permission');
//     } else {
//       print('User declined or has not accepted Permission');
//     }
//   }
//
//   void getToken() async {
//     await FirebaseMessaging.instance.getToken().then((token) => setState(() {
//           mToken = token;
//           print('my token is: $mToken');
//           safeToken(token!);
//         }));
//   }
//
//   void safeToken(String token) async {
//     await FirebaseFirestore.instance.collection('UserToken').doc('User1').set({
//       'token': mToken,
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InputField(
//                 inputController: _userName,
//                 isPassword: false,
//                 hintText: 'Username',
//                 hasSuffixIcon: false,
//                 keyBoardType: TextInputType.name,
//               ),
//               InputField(
//                 inputController: _title,
//                 isPassword: false,
//                 hintText: 'Title',
//                 hasSuffixIcon: false,
//                 keyBoardType: TextInputType.name,
//               ),
//               InputField(
//                 inputController: _body,
//                 isPassword: false,
//                 hintText: 'Body',
//                 hasSuffixIcon: false,
//                 keyBoardType: TextInputType.name,
//               ),
//               MyButton(
//                   height: 60,
//                   width: double.infinity,
//                   color: mainBlue,
//                   // margin: const EdgeInsets.all(10),
//                   onTap: () async {
//                     String name = _userName.text.trim();
//                     String titleText = _title.text;
//                     String bodyText = _body.text;
//                   },
//                   child: MyText('Send Notification'))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
