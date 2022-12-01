
// This is the splash screen
import 'package:compact_pay/screens/onboarding/onboarding2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/my_text.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 10),(){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const OnBoarding()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:darkBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 317),
                Image.asset('assets/images/Logo.png'),
                const SizedBox(height: 15.11),
                MyText(
                  'CompactPay',
                  color: white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}