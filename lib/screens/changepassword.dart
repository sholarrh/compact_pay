import 'package:compact_pay/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../utils/app_colors.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text.dart';
import '../widgets/text_form_field.dart';
import '../widgets/validator.dart';

// This The Code for the ChangePassword Page
// Juwon's Code

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isLoading = false;

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: deepBlue1,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          color: white,
                          iconSize: 17,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        MyText(
                          'Change Password',
                          color: white,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  MyText('Old Password',
                      color: white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                  const SizedBox(height: 8),
                  InputField(
                    hintText: '',
                    validator: validatePassword,
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: true,
                    inputController: data.oldPassword,
                  ),
                  const SizedBox(height: 25),
                  MyText('New Password',
                      color: white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                  const SizedBox(height: 8),
                  InputField(
                    hintText: '',
                    validator: validatePassword,
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: true,
                    inputController: data.passwordTextController,
                  ),
                  const SizedBox(height: 25),
                  MyText('Repeat Password',
                      color: white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                  const SizedBox(height: 8),
                  InputField(
                    hintText: '',
                    validator: data.validateConfirmPassword,
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: true,
                    inputController: data.confirmPasswordTextController,
                  ),
                  const SizedBox(height: 80),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: MyButton(
                        height: 54,
                        width: double.infinity,
                        color: mainBlue,
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            _isLoading = true;
                            setState(() {});

                            Duration waitTime = const Duration(seconds: 4);
                            Future.delayed(waitTime, () {
                              _isLoading = false;
                              if (mounted) {
                                setState(() {});
                              }
                            });
                          }
                        },
                        child: _isLoading == false
                            ? MyText(
                                'Done',
                                color: white,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: white,
                                ),
                              ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
