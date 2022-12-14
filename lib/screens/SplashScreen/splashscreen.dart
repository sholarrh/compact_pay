// This is the splash screen
import 'package:compact_pay/screens/auth/login.dart';
import 'package:compact_pay/screens/onboarding/onboarding2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_colors.dart';
import '../../widgets/my_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? initScreen;

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  initScreen != 1 ? const OnBoarding() : const Login()));
    });
  }

  Future<void> _asyncMethod() async {
    final storage = await SharedPreferences.getInstance();
    initScreen = storage.getInt('initScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
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
