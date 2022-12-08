import 'dart:async';

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';

class ProviderClass extends ChangeNotifier {
  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _middleNameTextController =
      TextEditingController();
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
  final TextEditingController _amountToSendTextController =
      TextEditingController();
  final TextEditingController _bankNameTextController = TextEditingController();
  final TextEditingController _accountNumberTextController =
      TextEditingController();
  final TextEditingController _accountNameTextController =
      TextEditingController();
  final TextEditingController _transferDescriptionTextController =
      TextEditingController();
  final TextEditingController _cardNameTextController = TextEditingController();
  final TextEditingController _cardNumberTextController =
      TextEditingController();
  final TextEditingController _cardExpiryDateTextController =
      TextEditingController();
  final TextEditingController _cardCvvTextController = TextEditingController();

  final List<String> _otpCodeList = [];
  final List<String> _pinList = [];
  final List<String> _confirmPinList = [];

  List<String> get pinList => _pinList;

  List<String> get otpCodeList => _otpCodeList;

  List<String> get confirmPinList => _confirmPinList;

  //final _formKey = GlobalKey<FormState>();

  TextEditingController get fullNameTextController => _fullNameTextController;

  TextEditingController get firstNameTextController => _firstNameTextController;

  TextEditingController get middleNameTextController =>
      _middleNameTextController;

  TextEditingController get lastNameTextController => _lastNameTextController;

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

  TextEditingController get amountToSendTextController =>
      _amountToSendTextController;

  TextEditingController get bankNameTextController => _bankNameTextController;

  TextEditingController get accountNumberTextController =>
      _accountNumberTextController;

  TextEditingController get accountNameTextController =>
      _accountNameTextController;

  TextEditingController get transferDescriptionTextController =>
      _transferDescriptionTextController;

  // Pincode controllers
  final TextEditingController _pincodeField = TextEditingController();
  TextEditingController get pincodeField => _pincodeField;
  final TextEditingController _pinCode = TextEditingController();
  TextEditingController get pinCode => _pinCode;

  // airtime controllers

  final TextEditingController _startDate = TextEditingController();
  TextEditingController get startDate => _startDate;
  final TextEditingController _endDate = TextEditingController();
  TextEditingController get endDate => _endDate;

  // Electricity controllers
  final TextEditingController _chooseProvider = TextEditingController();
  TextEditingController get chooseProvider => _chooseProvider;
  final TextEditingController _meterNumber = TextEditingController();
  TextEditingController get meterNumber => _meterNumber;
  TextEditingController _amount = TextEditingController();
  TextEditingController get amount => _amount;

  // CARD DETAILS

  TextEditingController get cardNameTextController => _cardNameTextController;

  TextEditingController get cardNumberTextController =>
      _cardNumberTextController;

  TextEditingController get cardExpiryDateTextController =>
      _cardExpiryDateTextController;

  TextEditingController get cardCvvTextController => _cardCvvTextController;

  String? bankName;
  String? bankLogo;

  //GlobalKey<FormState> get formKey => _formKey;
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

  void delay(int seconds) {
    Duration waitTime = Duration(seconds: seconds);
    Future.delayed(waitTime, () {
      {
        isLoading = false;
      }
      notifyListeners();
    });
  }

  void sendOtp() async {
    myAuth.setConfig(
        appEmail: "compactPay@gmail.com",
        appName: "CompactPay",
        userEmail: emailTextController.text,
        otpLength: 4,
        otpType: OTPType.digitsOnly);
  }
}
