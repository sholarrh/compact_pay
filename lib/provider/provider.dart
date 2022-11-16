

import 'dart:async';

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';



class ProviderClass extends ChangeNotifier{
  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController =
      TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  final TextEditingController _bvnTextController = TextEditingController();
  final TextEditingController _genderTextController = TextEditingController();
  final TextEditingController _ageTextController = TextEditingController();
  final TextEditingController _referralCodeTextController =
      TextEditingController();
  final TextEditingController _oldTransactionPin = TextEditingController();
  final TextEditingController _newTransactionPin = TextEditingController();
  final TextEditingController _confirmTransactionPin = TextEditingController();

  final List<String> _otpCodeList = [];
  final List<String> _pinList = [];
  final List<String> _confirmPinList = [];

  List<String> get pinList => _pinList;

  List<String> get otpCodeList => _otpCodeList;

  List<String> get confirmPinList => _confirmPinList;

  final _formKey = GlobalKey<FormState>();

  TextEditingController get fullNameTextController => _fullNameTextController;

  TextEditingController get passwordTextController => _passwordTextController;

  TextEditingController get emailTextController => _emailTextController;

  TextEditingController get phoneNumberTextController =>
      _phoneNumberTextController;

  TextEditingController get confirmPasswordTextController =>
      _confirmPasswordTextController;

  TextEditingController get bvnTextController => _bvnTextController;

  TextEditingController get genderTextController => _genderTextController;

  TextEditingController get ageTextController => _ageTextController;

  TextEditingController get referralCodeTextController =>
      _referralCodeTextController;

  TextEditingController get oldTransactionPin => _oldTransactionPin;

  TextEditingController get newTransactionPin => _newTransactionPin;

  TextEditingController get confirmTransactionPin => _confirmTransactionPin;

  GlobalKey<FormState> get formKey => _formKey;
  bool isLoading = false;

  bool submitValid = false;
  EmailOTP myAuth = EmailOTP();

  final CountdownController _controller = CountdownController(autoStart: true);

  CountdownController get controller => _controller;

  void startTimer() {
    controller.start();
    }
  void pauseTimer() {
    controller.pause();
  }

  void restartTimer() {
    controller.restart();
  }

  void countdown() {
    controller.start();
  }

  // Timer? countdownTimer;
  // Duration myDuration =   Duration(days: 5);
  // String strDigits(int n) => n.toString().padLeft(2, '0');
  //
  // void startTimer() {
  //   countdownTimer =
  //       Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  // }
  // // Step 4
  // void stopTimer() {
  //   countdownTimer!.cancel();
  //   notifyListeners();
  // }
  // // Step 5
  // void resetTimer() {
  //   stopTimer();
  //   myDuration = Duration(days: 5);
  //   notifyListeners();
  // }
  // // Step 6
  // void setCountDown() {
  //   const reduceSecondsBy = 1;
  //   final seconds = myDuration.inSeconds - reduceSecondsBy;
  //     if (seconds < 0) {
  //       countdownTimer!.cancel();
  //     } else {
  //       myDuration = Duration(seconds: seconds);
  //     }
  //   notifyListeners();
  // }




  void delay(int seconds){
    Duration waitTime =  Duration(seconds: seconds);
    Future.delayed(waitTime, (){
      {isLoading = false;}
      notifyListeners();
    });
  }

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