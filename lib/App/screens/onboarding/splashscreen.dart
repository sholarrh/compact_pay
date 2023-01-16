// This is the splash screen
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/size_config.dart';
import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/my_text.dart';
import '../auth/login.dart';
import 'onboarding2.dart';

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
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(317)),
                Image.asset('assets/images/Logo.png'),
                SizedBox(height: getProportionateScreenHeight(15.11)),
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
