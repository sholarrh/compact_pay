// import 'package:flutter/material.dart';
//
// import '../../models/user_details.dart';
// import '../../utils/app_colors.dart';
// import '../../widgets/my_text.dart';
//
// class LiveChat extends StatefulWidget {
//   // late String name;
//   // late String messageText;
//   // late String imageUrl;
//   // late String time;
//   // late bool isMessageRead;
//   @override
//   State<LiveChat> createState() => _LiveChatState();
// }
//
// class _LiveChatState extends State<LiveChat> {
//   // TextEditingController _textmessageController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: white,
//         body: SingleChildScrollView(
//             child: SafeArea(
//                 child: Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     child: Column(children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10, bottom: 40),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.close),
//                               iconSize: 17,
//                               color: black2121,
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                             ),
//                             const SizedBox(
//                               width: 30,
//                             ),
//                             MyText(
//                               'Live chat with bot',
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: black2121,
//                             ),
//                           ],
//                         ),
//                       ),
//                       MyText(
//                         'Active now',
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: black2121,
//                       ),
//                       SizedBox(height: 10),
//
//                       MyText(
//                         '12 DEC 2022 AT 11:59',
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: black2121,
//                       ),
//                       SizedBox(height: 10),
//
//                       Row(
//                         children: [
//                           Image.asset(
//                             'assets/images/Logo.png',
//                             height: 30,
//                             width: 30,
//                           ),
//                           Container(
//                             // margin: const EdgeInsets.symmetric(vertical: 5),
//                             // padding: const EdgeInsets.only(
//                             //     top: 12, bottom: 12, left: 12),
//                             height: 40,
//                             width: 200,
//                             decoration: BoxDecoration(
//                               color: Color(0xffDDDCDC),
//                               borderRadius: BorderRadius.circular(7),
//                             ),
//                             child: Center(
//                               child: MyText(
//                                 'Hi! How may i help you?',
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                                 color: black2121,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 500),
//
//                       // Stack(
//                       //   children: <Widget>[
//                       // ListView.builder(
//                       // itemCount: messages.length,
//                       //   shrinkWrap: true,
//                       //   padding: EdgeInsets.only(top: 10,bottom: 10),
//                       //   physics: NeverScrollableScrollPhysics(),
//                       //   itemBuilder: (context, index){
//                       //     return Container(
//                       //       padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
//                       //       child: Text(messages[index].messageContent),
//                       //     );
//                       //   },
//                       // ),
//                       // Align(
//                       Stack(children: <Widget>[
//                         Align(
//                           alignment: Alignment.bottomLeft,
//                           child: Container(
//                             padding:
//                                 EdgeInsets.only(left: 10, bottom: 10, top: 10),
//                             height: 60,
//                             width: double.infinity,
//                             color: Colors.white,
//                             child: Row(
//                               children: <Widget>[
//                                 GestureDetector(
//                                   onTap: () {},
//                                   child: Container(
//                                     height: 30,
//                                     width: 30,
//                                     decoration: BoxDecoration(
//                                       color: white,
//                                       borderRadius: BorderRadius.circular(30),
//                                     ),
//                                     child: Icon(
//                                       Icons.emoji_emotions_outlined,
//                                       color: Colors.yellow,
//                                       size: 20,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 Expanded(
//                                   child: TextField(
//                                     decoration: InputDecoration(
//                                         hintText: "Type your message",
//                                         hintStyle:
//                                             TextStyle(color: Colors.black54),
//                                         border: InputBorder.none),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 FloatingActionButton(
//                                   onPressed: () {},
//                                   child: Icon(
//                                     Icons.send,
//                                     color: Colors.white,
//                                     size: 18,
//                                   ),
//                                   backgroundColor: Colors.blue,
//                                   elevation: 0,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ])
//                     ])))));
//   }
// }
