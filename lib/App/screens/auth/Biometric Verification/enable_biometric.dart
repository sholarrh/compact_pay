import 'package:flutter/material.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widgets/my_button.dart';
import '../../../../Core/widgets/my_text.dart';
import 'add_biometric.dart';

class BiometricVerification extends StatefulWidget {
  const BiometricVerification({Key? key}) : super(key: key);

  @override
  State<BiometricVerification> createState() => _BiometricVerificationState();
}

class _BiometricVerificationState extends State<BiometricVerification> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

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
                      'Biometric Verification',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: white,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    'Enable Biometric',
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
              Padding(
                padding: const EdgeInsets.only(top: 500.0),
                child: MyButton(
                  height: 54,
                  width: double.infinity,
                  color: mainBlue,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddBiometric()));
                  },
                  child: MyText(
                    'Add Biometric',
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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