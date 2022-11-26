// Adigun solafunmi

import 'package:compact_pay/screens/securitysettings.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/container_widget.dart';
import '../widgets/my_text.dart';
import 'notificationsettings.dart';

// This The Code for the Settings Page

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
                  padding: const EdgeInsets.only(top: 10, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 17,
                        color: white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      MyText(
                        'Settings',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ],
                  ),
                ),
                const ContainerWidget(
                  title: 'Notification Settings',
                  subtitle:
                      'Push notification, sms notification and email notification',
                  screen: NotificationSettings(),
                  icon: Icons.notifications,
                ),
                const ContainerWidget(
                  title: 'Security Settings',
                  subtitle: 'Password Settings and Biometric verification',
                  screen: SecuritySettings(),
                  icon: Icons.lock_outline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
