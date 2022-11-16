import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_text.dart';

class BiometricVerification extends StatefulWidget {
  const BiometricVerification({Key? key}) : super(key: key);

  @override
  State<BiometricVerification> createState() => _BiometricVerificationState();
}

class _BiometricVerificationState extends State<BiometricVerification> {
  @override



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
                      'Biometric Verification',
                      color: white,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  Switch(
                    value: isSwitched1,
                    onChanged: (value) {
                      setState(() {
                        isSwitched1 = value;
                        print(isSwitched1);
                      });
                    },
                    activeColor: lightGreen,
                    inactiveTrackColor: lightGrey2,
                  ),
                ],
              ),
              SizedBox(height: 400),
              MyButton(
                child: Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mainBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: MyText(
                      'Add Biometric',
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