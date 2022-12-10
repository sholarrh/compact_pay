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
  //GlobalKey<FormState> get formKey => _formKey;
  bool isLoading = false;

  bool submitValid = false;

  // sign up
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _middleNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
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

  final TextEditingController _oldPassword = TextEditingController();

  TextEditingController get firstNameTextController => _firstNameTextController;

  TextEditingController get middleNameTextController =>
      _middleNameTextController;

  TextEditingController get lastNameTextController => _lastNameTextController;

  TextEditingController get passwordTextController => _passwordTextController;

  TextEditingController get oldPassword => _oldPassword;

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
  final TextEditingController _receiverAccountNumberTextController =
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

  TextEditingController get receiverAccountNumberTextController =>
      _receiverAccountNumberTextController;

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
  List<bool> validate = [false, false];

  void _updateFormFieldsFilled(String val, int index) {
    if (val.isEmpty) {
      validate.isNotEmpty ? validate.removeAt(index) : null;
      validate.insert(index, false);
      //_areFormFieldsFilled = false;
      // setState(() {});
    } else {
      //if (validate[index])
      validate.isNotEmpty ? validate.removeAt(index) : null;
      validate.insert(index, true);
      // setState(() {});
    }
    notifyListeners();
  }

  get updateFormFieldsFilled => _updateFormFieldsFilled;

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
  String? userId = '6391f4d522cf9e066f35f250';
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
      var postLoginResponseData = jsonDecode(postLoginResponse.body);

      // final storage = await SharedPreferences.getInstance();
      // storage.setString('token', postLoginResponseData['token']);
      // storage.setString('email', emailTextController.text);

      if (kDebugMode) {
        print(postLoginResponseData);
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

  //UPDATE KYC API

  late http.Response putKycResponse;

  Future<void> putKycUpdate() async {
    // final storage = await SharedPreferences.getInstance();
    // userId = await storage.getString('userId');
    // notifyListeners();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      //'Authorization': 'Bearer $token'
    };

    var payload = {
      "address": addressTextController.text,
      "validMeansOfIdentification": identificationTextController.text,
      "number": identificationNumberTextController.text,
      "bvn": bvnTextController.text,
      "transactionPin": "3264",
      "confirmTransactionPin": "3264"
    };

    var url = Uri.parse(
        'https://compactpay.onrender.com/api/users/update?id=6391f4d522cf9e066f35f250');

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

  Future<void> putTransactionPin() async {
    // final storage = await SharedPreferences.getInstance();
    // userId = await storage.getString('userId');
    // notifyListeners();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      //'Authorization': 'Bearer $token'
    };

    var payload = {
      "transactionPin": pinList.join(""),
      "confirmTransactionPin": confirmPinList.join(""),
    };

    var url = Uri.parse(
        'https://compactpay.onrender.com/api/users/transpin?id=6391f4d522cf9e066f35f250');

    try {
      putTransactionPinResponse = await http.put(url,
          headers: requestHeaders, body: json.encode(payload));

      if (kDebugMode) {
        print('Response status: ${putTransactionPinResponse.statusCode}');
      }
      if (kDebugMode) {
        print('Response status: ${jsonDecode(putTransactionPinResponse.body)}');
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

  final TextEditingController _firstNamess = TextEditingController();
  final TextEditingController _lastNamess = TextEditingController();

  TextEditingController get firstNamess => _firstNamess;

  TextEditingController get lastNamess => _lastNamess;

  bool _error = false;
  String _errorMessage = '';

  bool get error => _error;

  String get errorMessage => _errorMessage;

  var responsedata;
  late http.Response getResponse;

  Future get() async {
    // final storage = await SharedPreferences.getInstance();
    // token = await storage.getString('token');
    // print(firstName);
    // print(lastName);

    var url = Uri.parse(
        'https://compactpay.onrender.com/api/users/adigun.solafunmi@gmail.com');
    getResponse = await http.get(
      url,
    );

    // if (kDebugMode) {
    //   print('Response status: ${getResponse.statusCode}');
    //}
    if (getResponse.statusCode == 200) {
      final storage = await SharedPreferences.getInstance();
      try {
        responsedata = jsonDecode(getResponse.body);
        _firstNamess.text = responsedata['data']![0]['firstName'];
        _lastNamess.text = responsedata['data']![0]['lastName'];
        notifyListeners();
        print('firstnamePrivate ${_firstNamess.text}');
        print('firstnamePrivate ${_lastNamess.text}');

        storage.setString('firstName', firstName!);
        storage.setString('lastName', lastName!);
        notifyListeners();

        // if (kDebugMode) {
        //   print(firstName);
        //   print(lastName);
        // }
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
    return responsedata;

    // var request = http.Request(
    //     'GET',
    //     Uri.parse(
    //         'https://compact-pay.herokuapp.com/api/users/$emailTextController'));
    //
    // http.StreamedResponse getResponse = await request.send();

    // if (getResponse.statusCode == 200) {
    //   if (kDebugMode) {
    //     print(jsonDecode(getResponse.body));
    //     print(await getResponse.stream.bytesToString());
    //   }
    // } else {
    //   if (kDebugMode) {
    //     print(getResponse.reasonPhrase);
    //   }
    // }
  }
}
