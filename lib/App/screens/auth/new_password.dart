// Adigun solafunmi

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/provider/provider.dart';
import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/my_button.dart';
import '../../../Core/widgets/my_text.dart';
import '../../../Core/widgets/text_form_field.dart';
import '../../../Core/widgets/validator.dart';
import 'login.dart';


class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  void dispose() {
    ProviderClass().emailTextController.dispose();
    ProviderClass().passwordTextController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  bool _newIsLoading = false;

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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.02799,
                left: width * 0.0533,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: black2121,
                  size: 17,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.0533,
                right: width * 0.0533,
                top: height * 0.05788,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: MyText(
                        'Create New Password',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: black,
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.03448,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: MyText(
                              'New Password',
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: black,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InputField(
                            inputController: data.passwordTextController,
                            isPassword: false,
                            hintText: 'Enter Password',
                            hasSuffixIcon: false,
                            keyBoardType: TextInputType.emailAddress,
                            validator: validateEmail,
                            onChanged: (value) {
                              _updateFormFieldsFilled(value, 0);
                            },
                          ),
                          SizedBox(
                            height: height * 0.030788,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: MyText(
                              'Confirm Password',
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: black,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InputField(
                            inputController: data.confirmPasswordTextController,
                            isPassword: true,
                            hintText: 'Enter Password',
                            hasSuffixIcon: true,
                            keyBoardType: TextInputType.text,
                            validator: validatePassword,
                            onChanged: (value) {
                              _updateFormFieldsFilled(value, 1);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.0985),
                      child: MyButton(
                        height: 54,
                        width: double.infinity,
                        color:
                            _validate.contains(false) ? unValidated : mainBlue,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            _newIsLoading = true;
                            setState(() {});

                            Duration waitTime = const Duration(seconds: 4);
                            Future.delayed(waitTime, () {
                              _newIsLoading = false;
                              if (mounted) {
                                setState(() {});
                              }
                            });

                            try {
                              data.sendOtp();
                              if (await data.myAuth.sendOTP() == true) {
                                // const ShowSnackBar(
                                //   text: "OTP has been sent",
                                //   duration: 5,
                                // );
                                data.passwordTextController.clear();
                                data.confirmPasswordTextController.clear();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('There is an error'),
                                duration: Duration(seconds: 5),
                              ),
                            );
                          }
                        },
                        child: _newIsLoading == false
                            ? MyText(
                                'Continue',
                                color: white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: mainBlue,
                                ),
                              ),
                      ),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}