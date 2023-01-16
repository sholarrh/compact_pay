import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/provider/provider.dart';
import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/my_button.dart';
import '../../../Core/widgets/my_text.dart';
import '../../../Core/widgets/text_form_field.dart';
import '../../../Core/widgets/validator.dart';
import '../auth/login.dart';

// This The Code for the ChangePassword Page
// Juwon's Code

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isLoading = false;

  final formKey = GlobalKey<FormState>();

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
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 31, bottom: 45),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            size: 17,
                            color: white,
                          ),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        MyText(
                          'Change Password',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ],
                    ),
                  ),
                  MyText(
                    'Old Password',
                    color: white,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                  const SizedBox(height: 10),
                  InputField2(
                    hintText: '',
                    validator: validatePassword,
                    keyBoardType: TextInputType.name,
                    hasSuffixIcon: true,
                    inputController: data.oldPassword,
                  ),
                  const SizedBox(height: 25),
                  MyText('New Password',
                      color: white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                  const SizedBox(height: 10),
                  InputField2(
                    hintText: '',
                    validator: validatePassword,
                    keyBoardType: TextInputType.name,
                    hasSuffixIcon: true,
                    inputController: data.passwordTextController,
                  ),
                  const SizedBox(height: 25),
                  MyText('Repeat Password',
                      color: white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                  const SizedBox(height: 10),
                  InputField2(
                    hintText: '',
                    validator: data.validateConfirmPassword,
                    keyBoardType: TextInputType.name,
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
                          if (formKey.currentState!.validate()) {
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
