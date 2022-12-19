import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/container_widget.dart';
import '../../../widgets/my_text.dart';
import '../../securitysettings.dart';

class AddBiometric extends StatefulWidget {
  const AddBiometric({Key? key}) : super(key: key);

  @override
  State<AddBiometric> createState() => _AddBiometricState();
}

class _AddBiometricState extends State<AddBiometric> {
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
                        'Add Biometrics',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ],
                  ),
                ),
                const ContainerWidget(
                  title: 'Touch ID / Face ID',
                  subtitle: 'Improve your security by adding Touch/Face ID',
                  screen: SecuritySettings(),
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

