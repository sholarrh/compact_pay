import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_text.dart';
import 'enable_biometric.dart';

class Biometric_Auth extends StatefulWidget {
  const Biometric_Auth({Key? key}) : super(key: key);

  @override
  State<Biometric_Auth> createState() => _Biometric_AuthState();
}

class _Biometric_AuthState extends State<Biometric_Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          color: black2121,
                          iconSize: 17,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:20),

                  MyText('Biometric Authentication',
                    fontSize: 20,
                    fontWeight: FontWeight.w500 ,
                    color: black2121,
                  ),
                  SizedBox(height:35),
                  Image.asset('assets/images/face.png'),
                  MyText('Use biometric login with your fingerprint\n'
                    'or face for easier access to your'
                    'account.',
                    fontSize: 16,
                    fontWeight: FontWeight.w400 ,
                    color: black2121,
                  ),
                  SizedBox(height:36 ),
                  MyText('You can turn this feature on/off at any\n'
                    'time under Settings.',
                    fontSize: 16,
                    fontWeight: FontWeight.w400 ,
                    color: black2121,
                  ),
                  SizedBox(height:60 ),
                  MyButton(
                    child: Container(
                      height: 54,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: mainBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: GestureDetector(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BiometricVerification()));
                    },
                          child: MyText(
                            'Enable Biometric',
                            color: white,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:24 ),
                  GestureDetector(
                    onTap: (){},
                        child: MyText('Skip for now',
                          fontSize: 16,
                          fontWeight: FontWeight.w400 ,
                          color: black2121,
                        ),
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
  }

