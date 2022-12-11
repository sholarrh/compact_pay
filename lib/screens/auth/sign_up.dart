import 'package:compact_pay/screens/auth/verification.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_button.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../widgets/show_snackbar.dart';
import '../../widgets/validator.dart';

// This The Code for the Signup Page
// Juwon's Code
// Compact Pay

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  bool _signUpIsLoading = false;
  bool goToPasswordScreen = false;
  String dropdownValue = '+234';
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  final List<bool> _validate = [false, false];

  void _updateFormFieldsFilled(String val, int index) {
    if (val.isEmpty) {
      _validate.isNotEmpty ? _validate.removeAt(index) : null;
      _validate.insert(index, false);
      setState(() {});
    } else {
      //if (validate[index])
      _validate.isNotEmpty ? _validate.removeAt(index) : null;
      _validate.insert(index, true);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    iconSize: 17,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  MyText(
                    'Create Account',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: black,
                  ),
                  const SizedBox(height: 20),
                  MyText(
                    'First Name',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  const SizedBox(height: 8),
                  InputField(
                      hintText: 'Enter first name',
                      onChanged: (value) {
                        _updateFormFieldsFilled(value, 0);
                      },
                      validator: validateFullName,
                      keyBoardType: TextInputType.name,
                      isPassword: false,
                      hasSuffixIcon: false,
                      inputController: data.firstNameTextController),
                  const SizedBox(height: 25),
                  MyText(
                    'Middle Name ',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    hintText: 'Enter middle name',
                    validator: validateFullName,
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: false,
                    inputController: data.middleNameTextController,
                    onChanged: (value) {
                      _updateFormFieldsFilled(value, 1);
                    },
                  ),
                  const SizedBox(height: 25),
                  MyText(
                    'Last Name',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    hintText: 'Enter last name',
                    validator: validateFullName,
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: false,
                    inputController: data.lastNameTextController,
                    onChanged: (value) {
                      _updateFormFieldsFilled(value, 2);
                    },
                  ),
                  const SizedBox(height: 25),
                  MyText(
                    'Email Address',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    validator: validateEmail,
                    hintText: 'Email Address',
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: false,
                    inputController: data.emailTextController,
                    onChanged: (value) {
                      _updateFormFieldsFilled(value, 3);
                    },
                  ),
                  const SizedBox(height: 25),
                  MyText(
                    'Phone Number',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    hintText: '',
                    validator: validatePhoneNumber,
                    keyBoardType: TextInputType.phone,
                    isPassword: false,
                    hasSuffixIcon: false,
                    onChanged: (value) {
                      _updateFormFieldsFilled(value, 4);
                    },
                    prefixIcon: DropdownButton<String>(
                      value: dropdownValue,
                      elevation: 16,
                      style: const TextStyle(color: black),
                      items: <String>[
                        '+234',
                        '+218',
                        '+235',
                        '+385',
                        '+30',
                        '+221',
                        '+227',
                        '+44',
                        '+93',
                        '+27',
                        '+33',
                        '+233',
                        '+1229',
                        '+594',
                        '+256',
                        '+263',
                        '+260'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: MyText(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                    inputController: data.phoneNumberTextController,
                  ),
                  const SizedBox(height: 25),
                  MyText(
                    'Password',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  const SizedBox(height: 9),
                  InputField(
                    hintText: 'Enter Password',
                    validator: validatePassword,
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: true,
                    inputController: data.passwordTextController,
                    onChanged: (value) {
                      _updateFormFieldsFilled(value, 5);
                    },
                  ),
                  const SizedBox(height: 25),
                  MyText(
                    'Confirm Password',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  const SizedBox(height: 9),
                  InputField(
                    hintText: 'Enter Password',
                    validator: data.validateConfirmPassword,
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: true,
                    inputController: data.confirmPasswordTextController,
                    onChanged: (value) {
                      _updateFormFieldsFilled(value, 6);
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            // _updateFormFieldsFilled();
                            isChecked = value!;
                          });
                        },
                      ),
                      MyText(
                        'I agree to the ',
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: lightGrey,
                      ),
                      MyText(
                        'Terms of Service',
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: lightMainBlue,
                      ),
                      MyText(
                        '  and',
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: lightGrey,
                      ),
                      MyText(
                        '  Privacy Policy',
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: lightMainBlue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  MyButton(
                    height: 54,
                    width: double.infinity,
                    color: _validate.contains(false) ? unValidated : mainBlue,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        _signUpIsLoading = true;
                        setState(() {});

                        Duration waitTime = const Duration(seconds: 4);
                        Future.delayed(waitTime, () {
                          _signUpIsLoading = false;
                          if (mounted) {
                            setState(() {});
                          }
                        });

                        try {
                          data.sendOtp();
                          if (await data.myAuth.sendOTP() == true) {
                            const ShowSnackBar(
                              text: "OTP has been sent",
                              duration: 5,
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Verification(goToPasswordScreen)));
                          }
                        } catch (e, s) {
                          if (kDebugMode) {
                            print(e);
                          }
                          if (kDebugMode) {
                            print(s);
                          }
                        }
                      } else {
                        const ShowSnackBar(
                          text: "There is an error",
                          duration: 5,
                        );
                      }
                    },
                    child: _signUpIsLoading == false
                        ? MyText(
                            'Sign Up',
                            color: white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: white,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
