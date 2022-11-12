

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/my_text.dart';
import 'edit_profile.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 17,
                        onPressed: () {
                          Navigator.pop(context);
                        },),
                      const SizedBox(width: 30,),
                      MyText('Edit Profile',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ],
                  ),
                ),


                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 12.0),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Row(
                        children: [
                          const Icon(Icons.notifications,
                            color: mainBlue,),
                          const SizedBox(width: 9,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText('Notification Settings',
                                fontSize: 12,
                                fontWeight: FontWeight.w500 ,
                                color: black2121,
                              ),
                              const SizedBox(height: 2,),
                              MyText('Push notification, sms notification and email notification',
                                fontSize: 9,
                                fontWeight: FontWeight.w500 ,
                                color: const Color(0xff8A8D8F),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const EditProfile()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined,
                          color: mainBlue,
                          size: 14,
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 12.0),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Row(
                        children: [
                          const Icon(Icons.lock_outline_sharp,
                            color: mainBlue,),
                          const SizedBox(width: 9,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText('Security Settings',
                                fontSize: 12,
                                fontWeight: FontWeight.w500 ,
                                color: black2121,
                              ),
                              const SizedBox(height: 2,),
                              MyText('Password Settings and Biometric verification',
                                fontSize: 9,
                                fontWeight: FontWeight.w500 ,
                                color: const Color(0xff8A8D8F),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const EditProfile()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined,
                          color: mainBlue,
                          size: 14,
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
