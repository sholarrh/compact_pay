import 'dart:async';
import 'dart:convert';

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_controller.dart';

class ProviderClass extends ChangeNotifier {
  //GlobalKey<FormState> get formKey => _formKey;
  bool isLoading = false;

  bool submitValid = false;

  // sign up
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _middleNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController =
      TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();

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

  // KYC VERIFICATION
  final TextEditingController _addressTextController = TextEditingController();
  final TextEditingController _identificationNumberTextController =
      TextEditingController();

  final TextEditingController _identificationTextController =
      TextEditingController();
  final TextEditingController _bvnTextController = TextEditingController();

  TextEditingController get addressTextController => _addressTextController;

  TextEditingController get identificationNumberTextController =>
      _identificationNumberTextController;

  TextEditingController get identificationTextController =>
      _identificationTextController;

  TextEditingController get bvnTextController => _bvnTextController;

// TRANSACTION PIN
  final TextEditingController _oldTransactionPin = TextEditingController();
  final TextEditingController _newTransactionPin = TextEditingController();
  final TextEditingController _confirmTransactionPin = TextEditingController();

  TextEditingController get oldTransactionPin => _oldTransactionPin;

  TextEditingController get newTransactionPin => _newTransactionPin;

  TextEditingController get confirmTransactionPin => _confirmTransactionPin;

  // BANK DETAILS
  String? bankName;
  String? bankLogo;
  double? accountBalance;

  final TextEditingController _amountToSendTextController =
      TextEditingController();
  final TextEditingController _bankNameTextController = TextEditingController();
  final TextEditingController _accountNumberTextController =
      TextEditingController();
  final TextEditingController _accountNameTextController =
      TextEditingController();
  final TextEditingController _transferDescriptionTextController =
      TextEditingController();

  TextEditingController get amountToSendTextController =>
      _amountToSendTextController;

  TextEditingController get bankNameTextController => _bankNameTextController;

  TextEditingController get accountNumberTextController =>
      _accountNumberTextController;

  TextEditingController get accountNameTextController =>
      _accountNameTextController;

  TextEditingController get transferDescriptionTextController =>
      _transferDescriptionTextController;

  // CARD DETAILS
  final TextEditingController _cardNameTextController = TextEditingController();
  final TextEditingController _cardNumberTextController =
      TextEditingController();
  final TextEditingController _cardExpiryDateTextController =
      TextEditingController();
  final TextEditingController _cardCvvTextController = TextEditingController();

  TextEditingController get cardNameTextController => _cardNameTextController;

  TextEditingController get cardNumberTextController =>
      _cardNumberTextController;

  TextEditingController get cardExpiryDateTextController =>
      _cardExpiryDateTextController;

  TextEditingController get cardCvvTextController => _cardCvvTextController;

  // USER DETAILS
  final TextEditingController _genderTextController = TextEditingController();
  final TextEditingController _ageTextController = TextEditingController();
  final TextEditingController _referralCodeTextController =
      TextEditingController();

  TextEditingController get genderTextController => _genderTextController;

  TextEditingController get ageTextController => _ageTextController;

  TextEditingController get referralCodeTextController =>
      _referralCodeTextController;

  String? profilePicture;

  // OTP DETAILS
  final List<String> _otpCodeList = [];
  final List<String> _pinList = [];
  final List<String> _confirmPinList = [];

  List<String> get pinList => _pinList;

  List<String> get otpCodeList => _otpCodeList;

  List<String> get confirmPinList => _confirmPinList;

  //final _formKey = GlobalKey<FormState>();

  //TV
  final TextEditingController _smartCardNumberTextController =
      TextEditingController();

  TextEditingController get smartCardNumberTextController =>
      _smartCardNumberTextController;

  // COUNTDOWN TIMER

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

  // OTP SERVICE
  EmailOTP myAuth = EmailOTP();

  void sendOtp() async {
    myAuth.setConfig(
        appEmail: "compactPay@gmail.com",
        appName: "CompactPay",
        userEmail: emailTextController.text,
        otpLength: 4,
        otpType: OTPType.digitsOnly);
  }

  // CONFIRM PASSWORD
  String? validateConfirmPassword(String? formConfirmPassword) {
    if (confirmPasswordTextController.text != passwordTextController.text) {
      return 'Passwords do not match.';
    }

    return null;
  }

// SHARED PREFERENCES
  Future<void> sharedPreferences() async {
    final storage = await SharedPreferences.getInstance();
    token = await storage.getString('token');
    userEmail = await storage.getString('email');
    notifyListeners();
  }

  String? token;
  String? userEmail;

  // sign up api
  var signUpResponse;

  Future<void> postRegister() async {
    var url = Uri.parse('https://compact-pay.herokuapp.com/api/users/signup');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': '*/*',
    };
    var payload = {
      "firstName": firstNameTextController.text,
      "middleName": middleNameTextController.text,
      "lastName": firstNameTextController.text,
      "email": emailTextController.text,
      "phoneNumber": phoneNumberTextController.text,
      "password": passwordTextController.text,
      "confirmPassword": confirmPasswordTextController.text,
    };
    try {
      signUpResponse = await http.post(url,
          headers: requestHeaders, body: jsonEncode(payload));
      print('Response status: ${signUpResponse.statusCode}');
      print('Response body: ${signUpResponse.body}');
    } catch (e, s) {
      print(e);
      print(s);
    }
    notifyListeners();
  }

  // Login Api
  var postLoginResponse;

  Future<void> postLogin() async {
    var url = Uri.parse('https://compact-pay.herokuapp.com/api/users/login');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': '*/*',
    };
    var payload = {
      "password": passwordTextController.text,
      "email": emailTextController.text
    };

    try {
      postLoginResponse = await http.post(url,
          headers: requestHeaders, body: jsonEncode(payload));
      print('Response status: ${postLoginResponse.statusCode}');
      print('Response body: ${postLoginResponse.body}');
      notifyListeners();
      var responseData = jsonDecode(postLoginResponse.body);

      final storage = await SharedPreferences.getInstance();
      storage.setString('token', responseData['token']);
      storage.setString('email', emailTextController.text);

      print(responseData);
      notifyListeners();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  //UPDATE KYC API
  var putKycResponse;

  Future<void> putKycUpdate() async {
    final storage = await SharedPreferences.getInstance();
    token = await storage.getString('token');
    notifyListeners();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var payload = {
      "address": addressTextController.text,
      "validMeansOfIdentification": identificationTextController.text,
      "bvn": bvnTextController.text,
      // "isAvailable": isAvailableTextController.text,
    };
    notifyListeners();

    var url = Uri.parse(
        'https://compact-pay.herokuapp.com/api/users/update?id=$token');

    try {
      putKycResponse = await http.put(url,
          headers: requestHeaders, body: json.encode(payload));
      print(url);
      print('Response status: ${putKycResponse.statusCode}');
      notifyListeners();
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  // GET USER DETAILS
// run shared preference before any app that needs token
  var getResponse;
// Future<PetModel> get() async {
//   final storage = await SharedPreferences.getInstance();
//   token = await storage.getString('token');
//   notifyListeners();
//   Map<String, String> requestHeaders = {
//     'Content-type': 'application/json',
//     'Accept': '*/*',
//     'Authorization': 'Bearer $token'
//   };
//   var url =Uri.parse('https://compact-pay.herokuapp.com/api/users/$userEmail');
//   getResponse = await http.get(url, headers: requestHeaders);
//
//   print('Response status: ${getResponse.statusCode}');
//
//
//   if (getResponse.statusCode == 200){
//     try{
//       responsedata = getCLassModelFromJson(getResponse.body);
//       print(responsedata.data!);
//       _error = false;
//     } catch(e){
//       _error = true;
//       _errorMessage = e.toString();
//
//     }
//   }else{
//     _error = true;
//     _errorMessage = 'It could be your Internet Connection';
//
//   }
//   notifyListeners();
//   return responsedata;
// }
}
