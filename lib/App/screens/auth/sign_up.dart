import 'package:compact_pay/App/screens/auth/verification.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/provider/provider.dart';
import '../../../Core/size_config.dart';
import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/my_button.dart';
import '../../../Core/widgets/my_text.dart';
import '../../../Core/widgets/show_snackbar.dart';
import '../../../Core/widgets/text_form_field.dart';
import '../../../Core/widgets/validator.dart';

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
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
                top: getProportionateScreenHeight(22.73),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: black2121,
                      size: 17,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15.79),
                  ),
                  MyText(
                    'Create Account',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: black,
                  ),
                  SizedBox(height: getProportionateScreenHeight(28)),
                  MyText(
                    'First Name',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
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
                  SizedBox(height: getProportionateScreenHeight(25)),
                  MyText(
                    'Middle Name ',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
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
                  SizedBox(height: getProportionateScreenHeight(25)),
                  MyText(
                    'Last Name',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
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
                  SizedBox(height: getProportionateScreenHeight(25)),
                  MyText(
                    'Email Address',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  InputField(
                    validator: validateEmail,
                    hintText: 'Email Address',
                    keyBoardType: TextInputType.emailAddress,
                    isPassword: false,
                    hasSuffixIcon: false,
                    inputController: data.emailTextController,
                    onChanged: (value) {
                      _updateFormFieldsFilled(value, 3);
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(25)),
                  MyText(
                    'Phone Number',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
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
                          child: MyText(
                            value,
                            fontSize: 14,
                          ),
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
                  SizedBox(height: getProportionateScreenHeight(25)),
                  MyText(
                    'Password',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
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
                  SizedBox(height: getProportionateScreenHeight(25)),
                  MyText(
                    'Confirm Password',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
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
                  SizedBox(height: getProportionateScreenHeight(15)),
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
                  Padding(
                    padding: EdgeInsets.only(
                        top: getProportionateScreenHeight(20),
                        bottom: getProportionateScreenHeight(47)),
                    child: MyButton(
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
                              showSnackBar(
                                  context, black2121, 'OTP has been sent');
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
                          showSnackBar(context, black2121,
                              'Please check that you filled the form correctly');
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