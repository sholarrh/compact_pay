import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/my_text.dart';

class PasswordSettings extends StatefulWidget {
  const PasswordSettings({Key? key}) : super(key: key);

  @override
  State<PasswordSettings> createState() => _PasswordSettingsState();
}

class _PasswordSettingsState extends State<PasswordSettings> {
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
                        'Password Settings',
                        color: white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: mainBlue,
                        ),
                        title: MyText(
                          'Change Password',
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: black2121,
                        ),
                        subtitle: MyText(
                          'View and edit your password',
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
                  child: Column(
                    children: [
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Image.asset('assets/images/key.png'),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: mainBlue,
                        ),
                        title: MyText(
                          'Change Pin',
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: black2121,
                        ),
                        subtitle: MyText(
                          'View and edit your pin',
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: ash2,
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
