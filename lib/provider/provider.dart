

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';


class ProviderClass extends ChangeNotifier{
  final TextEditingController _fullnameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController = TextEditingController();

  final List<String> _otpCodeList = [];
  final List<String> _pinList = [];
  final List<String> _confirmPinList = [];

  List<String> get pinList  => _pinList;
  List<String> get otpCodeList  => _otpCodeList;
  List<String> get confirmPinList  => _confirmPinList;


  final _formkey = GlobalKey<FormState>();

  TextEditingController get fullnameTextController => _fullnameTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get phoneNumberTextController => _phoneNumberTextController;
  TextEditingController get confirmPasswordTextController => _confirmPasswordTextController;


  GlobalKey<FormState> get formkey => _formkey;
  bool isLoading = false;

  bool submitValid = false;
  EmailOTP myAuth = EmailOTP();

 // var response;

  void sendOtp() async {
    myAuth.setConfig(
        appEmail: "compactPay@gmail.com",
        appName: "CompactPay",
        userEmail: emailTextController.text,
        otpLength: 4,
        otpType: OTPType.digitsOnly
    );

  }

}