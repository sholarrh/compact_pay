

import 'package:flutter/cupertino.dart';

class ProviderClass extends ChangeNotifier{
  final TextEditingController _fullnameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  TextEditingController get fullnameTextController => _fullnameTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get phoneNumberTextController => _phoneNumberTextController;
  TextEditingController get confirmPasswordTextController => _confirmPasswordTextController;


  GlobalKey<FormState> get formkey => _formkey;
  bool isLoading = false;

}