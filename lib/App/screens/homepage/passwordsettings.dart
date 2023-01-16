import 'package:flutter/material.dart';

import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/container_widget.dart';
import '../../../Core/widgets/my_text.dart';
import 'change_pin.dart';
import 'changepassword.dart';

// This The Code for the PasswordSettings Page
// Juwon's Code

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
                        'Password Settings',
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ],
                  ),
                ),
                const ContainerWidget(
                  title: 'Change Password',
                  subtitle: 'View and edit your password',
                  screen: ChangePassword(),
                  icon: Icons.key,
                ),
                const ContainerWidget(
                  title: 'Change Pin',
                  subtitle: 'View and edit your pin',
                  screen: ChangePin(),
                  icon: Icons.key,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
