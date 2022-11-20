import 'package:compact_pay/screens/notificationsettings.dart';
import 'package:compact_pay/screens/securitysettings.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/my_text.dart';

// This The Code for the Settings Page
// Juwon's Code

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: deepBlue1,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        color: white,
                        iconSize: 17,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      MyText(
                        'Settings',
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  color: white,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.notifications_none,
                            color: mainBlue,
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NotificationSettings()));
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: mainBlue,
                            ),
                          ),
                          title: MyText(
                            'Notification Settings',
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: black2121,
                          ),
                          subtitle: MyText(
                            'Push notification, sms notification and email notification',
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: ash2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  color: white,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.lock_outline_rounded,
                            color: mainBlue,
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SecuritySettings()));
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: mainBlue,
                            ),
                          ),
                          title: MyText(
                            'Security Settings',
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: black2121,
                          ),
                          subtitle: MyText(
                            'Password Settings and Biometric verification',
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: ash2,
                          ),
                        ),
                      ],
                    ),
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
