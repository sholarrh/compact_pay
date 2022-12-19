import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/my_text.dart';

// This The Code for the NotificationSettings Page
// Juwon's Code

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

  // bool _pushIsLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: deepBlue1,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 31, bottom: 45),
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
                    const SizedBox(
                      width: 32,
                    ),
                    MyText(
                      'Notification Settings',
                      color: white,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    'Push Notification',
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  Switch(
                    value: isSwitched1,
                    onChanged: (value) {
                      setState(() {
                        isSwitched1 = value;
                      });
                    },
                    activeColor: lightGreen,
                    inactiveTrackColor: lightGrey2,
                    thumbColor: MaterialStateProperty.all(white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    'SMS Notification',
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  Switch(
                    value: isSwitched2,
                    onChanged: (value) {
                      setState(() {
                        isSwitched2 = value;
                      });
                    },
                    activeColor: lightGreen,
                    inactiveTrackColor: lightGrey2,
                    thumbColor: MaterialStateProperty.all(white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    'Email Notification',
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  Switch(
                    value: isSwitched3,
                    onChanged: (value) {
                      setState(() {
                        isSwitched3 = value;
                      });
                    },
                    activeColor: lightGreen,
                    inactiveTrackColor: lightGrey2,
                    thumbColor: MaterialStateProperty.all(white),
                  ),
                ],
              ),
              const SizedBox(height: 400),
              MyButton(
                onTap: () {},
                child: Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mainBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: MyText(
                      'Done',
                      color: white,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
