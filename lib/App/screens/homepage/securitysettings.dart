import 'package:compact_pay/App/screens/homepage/passwordsettings.dart';
import 'package:flutter/material.dart';

import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/container_widget.dart';
import '../../../Core/widgets/my_text.dart';
import '../auth/Biometric Verification/enable_biometric.dart';

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
                        'Security Settings',
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ],
                  ),
                ),
                const ContainerWidget(
                  title: 'Password Settings',
                  subtitle: 'Change Password and Pin',
                  screen: PasswordSettings(),
                  icon: Icons.key,
                ),
                const ContainerWidget(
                  title: 'Biometric Verification',
                  subtitle: 'Enable Biometric Verification Settings',
                  screen: BiometricVerification(),
                  icon: Icons.fingerprint,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
