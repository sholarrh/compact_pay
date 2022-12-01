import 'package:compact_pay/screens/changepassword.dart';
import 'package:compact_pay/screens/passwordsettings.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/my_text.dart';

// This The Code for the SecuritySettings Page
// Juwon's Code

class SecuritySettings extends StatefulWidget {
  const SecuritySettings({Key? key}) : super(key: key);

  @override
  State<SecuritySettings> createState() => _SecuritySettingsState();
}

class _SecuritySettingsState extends State<SecuritySettings> {
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
                        'Security Settings',
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
                  child: Column(
                    children: [
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Image.asset('assets/images/key.png'),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PasswordSettings()));
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: mainBlue,
                          ),
                        ),
                        title: MyText(
                          'Password Settings',
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: black2121,
                        ),
                        subtitle: MyText(
                          'Change Password and Pin',
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: ash2,
                        ),
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
                          leading:
                              Image.asset('assets/images/finger-cricle.png'),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: mainBlue,
                          ),
                          title: MyText(
                            'Biometric Verification',
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: black2121,
                          ),
                          subtitle: MyText(
                            'Enable Biometric Verification Settings',
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
