import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:email_otp/email_otp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../widgets/image_button.dart';

class ProviderClass extends ChangeNotifier {
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

  final TextEditingController _fullNameTextController = TextEditingController();

  TextEditingController get fullNameTextController => _fullNameTextController;
  final TextEditingController _oldPassword = TextEditingController();

  TextEditingController get oldPassword => _oldPassword;

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
  String? userAccountNumber;
  double? accountBalance;

  final TextEditingController _amountToSendTextController =
      TextEditingController();
  final TextEditingController _bankNameTextController = TextEditingController();
  final TextEditingController _receiverAccountNumberTextController =
      TextEditingController();
  final TextEditingController _accountNameTextController =
      TextEditingController();
  final TextEditingController _transferDescriptionTextController =
      TextEditingController();

  TextEditingController get amountToSendTextController =>
      _amountToSendTextController;

  TextEditingController get bankNameTextController => _bankNameTextController;

  TextEditingController get receiverAccountNumberTextController =>
      _receiverAccountNumberTextController;

  TextEditingController get accountNameTextController =>
      _accountNameTextController;

  TextEditingController get transferDescriptionTextController =>
      _transferDescriptionTextController;

  // Pincode controllers
  final TextEditingController _pinCodeField = TextEditingController();

  TextEditingController get pinCodeField => _pinCodeField;

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
  final TextEditingController _amount = TextEditingController();

  TextEditingController get amount => _amount;

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

  //TV
  final TextEditingController _smartCardNumberTextController =
      TextEditingController();

  final TextEditingController _billerTextController = TextEditingController();

  final TextEditingController _packageTextController = TextEditingController();

  final TextEditingController _tvPhoneNumberTextController =
      TextEditingController();

  final TextEditingController _tvStartDateTextController =
      TextEditingController();

  final TextEditingController _tvEndDateTextController =
      TextEditingController();

  TextEditingController get billerTextController => _billerTextController;

  TextEditingController get packageTextController => _packageTextController;

  TextEditingController get smartCardNumberTextController =>
      _smartCardNumberTextController;

  TextEditingController get tvPhoneNumberTextController =>
      _tvPhoneNumberTextController;

  TextEditingController get tvStartDateTextController =>
      _tvStartDateTextController;

  TextEditingController get tvEndDateTextController => _tvEndDateTextController;

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

  // CHANGE CONTAINER COLOR
  // List<bool> validate = [false, false];
  //
  // void _updateFormFieldsFilled(String val, int index) {
  //   if (val.isEmpty) {
  //     validate.isNotEmpty ? validate.removeAt(index) : null;
  //     validate.insert(index, false);
  //     //_areFormFieldsFilled = false;
  //     // setState(() {});
  //   } else {
  //     //if (validate[index])
  //     validate.isNotEmpty ? validate.removeAt(index) : null;
  //     validate.insert(index, true);
  //     // setState(() {});
  //   }
  //   notifyListeners();
  // }

  //get updateFormFieldsFilled => _updateFormFieldsFilled;

  // PICK IMAGE

  File? image;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    try {
      if (image == null) return;

      final imageTemporary = File(image.path);

      this.image = imageTemporary;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image $e');
      }
    }
    notifyListeners();
  }

  // IMAGE BOTTOM SHEET
  Future<dynamic> showImageBottomSheet(
      BuildContext context, ProviderClass data) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        )),
        enableDrag: false,
        isDismissible: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                ImageButton(),
              ],
            ),
          );
        });
  }

// SHARED PREFERENCES
  Future<void> sharedPreferences() async {
    final storage = await SharedPreferences.getInstance();
    userId = storage.getString('userId');
    userEmail = storage.getString('email');
    firstName = storage.getString('firstName');
    lastName = storage.getString('lastName');
    print('shared preference: $firstName');
    notifyListeners();
  }

  String? token;
  String? userId;
  String? userEmail;

  // sign up api
  late http.Response signUpResponse;

  Future<void> postRegister() async {
    var url = Uri.parse('https://compactpay.onrender.com/api/users/signup');
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
      if (kDebugMode) {
        print('Response status: ${signUpResponse.statusCode}');
      }
      if (kDebugMode) {
        print('Response body: ${signUpResponse.body}');
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }
      if (kDebugMode) {
        print(s);
      }
    }

    var signUpResponseDecoded = jsonDecode(signUpResponse.body);
    if (kDebugMode) {
      print('Response body 2: $signUpResponseDecoded');
    }
    if (kDebugMode) {
      print('Response body 2: ${signUpResponseDecoded['user']['_id']}');
    }

    final storage = await SharedPreferences.getInstance();
    storage.setString('userId', signUpResponseDecoded['user']['_id']);
    storage.setString('email', emailTextController.text);
    notifyListeners();
  }

  // Login Api
  late http.Response postLoginResponse;

  Future<void> postLogin() async {
    var url = Uri.parse('https://compactpay.onrender.com/api/users/login');
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
      if (kDebugMode) {
        print('Response status: ${postLoginResponse.statusCode}');
      }
      if (kDebugMode) {
        print('Response body: ${postLoginResponse.body}');
      }
      // var postLoginResponseData = jsonDecode(postLoginResponse.body);

      final storage = await SharedPreferences.getInstance();
      storage.setInt('initScreen', 1);
      storage.setString('email', emailTextController.text);
      hasSetTransactionPin = storage.getBool('hasSetTransactionPin');
      notifyListeners();
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }
      if (kDebugMode) {
        print(s);
      }
    }
  }

  //UPDATE KYC API

  late http.Response putKycResponse;

  Future<void> putKycUpdate() async {
    final storage = await SharedPreferences.getInstance();
    userId = storage.getString('userId');
    notifyListeners();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    var payload = {
      "address": addressTextController.text,
      "validMeansOfIdentification": identificationTextController.text,
      "number": identificationNumberTextController.text,
      "bvn": bvnTextController.text,
      "password": passwordTextController.text,
    };

    var url = Uri.parse(
        'https://compactpay.onrender.com/api/users/update?id=$userId');

    try {
      putKycResponse = await http.put(url,
          headers: requestHeaders, body: json.encode(payload));

      if (kDebugMode) {
        print('Response status: ${putKycResponse.statusCode}');
      }
      if (kDebugMode) {
        print('Response status: ${jsonDecode(putKycResponse.body)}');
      }
      notifyListeners();
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }
      if (kDebugMode) {
        print(s);
      }
    }
  }

  late http.Response putTransactionPinResponse;
  bool? hasSetTransactionPin;

  Future<void> putTransactionPin() async {
    final storage = await SharedPreferences.getInstance();
    userId = storage.getString('userId');
    notifyListeners();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    var payload = {
      "transactionPin": pinList.join(""),
      "confirmTransactionPin": confirmPinList.join(""),
    };

    var url = Uri.parse(
        'https://compactpay.onrender.com/api/users/transpin?id=$userId');
    try {
      putTransactionPinResponse = await http.put(url,
          headers: requestHeaders, body: json.encode(payload));

      if (kDebugMode) {
        print('Response status: ${putTransactionPinResponse.statusCode}');
      }
      if (kDebugMode) {
        print('Response status: ${jsonDecode(putTransactionPinResponse.body)}');
      }
      final storage = await SharedPreferences.getInstance();
      storage.setBool('hasSetTransactionPin', true);
      notifyListeners();
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }
      if (kDebugMode) {
        print(s);
      }
    }
  }

  // USER FORGOT PASSWORD
  late http.Response putForgotPasswordResponse;

  Future<void> putForgotPassword() async {
    // final storage = await SharedPreferences.getInstance();
    // userId = await storage.getString('userId');
    // notifyListeners();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    var payload = {
      "email": emailTextController.text,
    };

    var url =
        Uri.parse('https://compactpay.onrender.com/api/users/forgotpassword');

    try {
      putForgotPasswordResponse = await http.put(url,
          headers: requestHeaders, body: json.encode(payload));

      if (kDebugMode) {
        print('Response status: ${putForgotPasswordResponse.statusCode}');
      }
      if (kDebugMode) {
        print('Response status: ${jsonDecode(putForgotPasswordResponse.body)}');
      }
      notifyListeners();
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }
      if (kDebugMode) {
        print(s);
      }
    }
  }

  // USER RESET PASSWORD
  late http.Response putResetPasswordResponse;

  Future<void> putResetPassword() async {
    // final storage = await SharedPreferences.getInstance();
    // userId = await storage.getString('userId');
    // notifyListeners();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    var payload = {
      "newPassword": passwordTextController.text,
      "confirmPassword": confirmPasswordTextController.text,
      "email": "adigun.solafunmi@gmail.com",
      "otp": "503q99"
    };

    var url =
        Uri.parse('https://compactpay.onrender.com/api/users/resetpassword');

    try {
      putResetPasswordResponse = await http.put(url,
          headers: requestHeaders, body: json.encode(payload));

      if (kDebugMode) {
        print('Response status: ${putResetPasswordResponse.statusCode}');
      }
      if (kDebugMode) {
        print('Response status: ${jsonDecode(putResetPasswordResponse.body)}');
      }
      notifyListeners();
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }
      if (kDebugMode) {
        print(s);
      }
    }
  }

  // GET USER DETAILS
// run shared preference before any app that needs token

  String? accountNumber;
  String? firstName;
  String? lastName;
  String? lastLogin;

  bool _error = false;
  String _errorMessage = '';

  bool get error => _error;

  String get errorMessage => _errorMessage;

  late http.Response getResponse;
  var responseData;

  Future get() async {
    final storage = await SharedPreferences.getInstance();
    userEmail = storage.getString('email');
    notifyListeners();

    var url = Uri.parse('https://compactpay.onrender.com/api/users/$userEmail');
    getResponse = await http.get(
      url,
    );
    if (kDebugMode) {
      print('Response status: ${getResponse.statusCode}');
      print('Response body: ${getResponse.body}');
    }
    if (getResponse.statusCode == 200) {
      final storage = await SharedPreferences.getInstance();
      try {
        responseData = jsonDecode(getResponse.body);
        firstName = responseData['data']![0]['firstName'];
        lastName = responseData['data']![0]['lastName'];
        lastLogin =
            responseData['data']![0]['updatedAt'].toString().substring(0, 10);
        notifyListeners();
        print('${responseData['data']![0]['firstName']}');
        print('${responseData['data']![0]['lastName']}');
        print(
            'last login: ${responseData['data']![0]['updatedAt'].toString().substring(0, 10)}');

        storage.setString('firstName', firstName!);
        storage.setString('lastName', lastName!);
        notifyListeners();

        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
      }
    } else {
      _error = true;
      _errorMessage = 'It could be your Internet Connection';
    }
    notifyListeners();
    //return responseData;
  }
}
