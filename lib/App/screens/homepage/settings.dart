// Adigun solafunmi

import 'package:compact_pay/App/screens/homepage/securitysettings.dart';
import 'package:flutter/material.dart';

import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/container_widget.dart';
import '../../../Core/widgets/my_text.dart';
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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: darkBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.0533,
              right: width * 0.0533,
              top: height * 0.02799,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 45),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          size: 17,
                          color: white,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.08,
                      ),
                      MyText(
                        'Settings',
                        fontSize: 14,
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
                  icon: Icons.notifications_none,
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
