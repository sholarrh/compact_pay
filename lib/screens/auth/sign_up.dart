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
  bool goToPasswordScreen = false;
  String dropdownValue = '+234';
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

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
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
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
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        data.isLoading = true;
                        setState(() {});
                        data.delay(4);

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
                    child: Container(
                      height: 54,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: mainBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: data.isLoading == false
                          ? Center(
                        child: MyText(
                          'Sign Up',
                          color: white,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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
