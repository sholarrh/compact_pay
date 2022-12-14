//Adigun solafunmi

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../utils/app_colors.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text.dart';
import '../widgets/text_form_field.dart';
import '../widgets/validator.dart';
import 'auth/sign_up.dart';
import 'auth/verification.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool goToPasswordScreen = true;
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  bool _forgotIsLoading = false;

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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  iconSize: 17,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 18,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 61.0, bottom: 29),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: MyText(
                          'Forgot Password',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: black,
                        ),
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: MyText(
                              'Email Address',
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: black,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InputField(
                            inputController: data.emailTextController,
                            isPassword: false,
                            hintText: 'Enter Email Address',
                            hasSuffixIcon: false,
                            keyBoardType: TextInputType.emailAddress,
                            validator: validateEmail,
                            onChanged: (value) {
                              _updateFormFieldsFilled(value, 0);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: MyButton(
                        height: 50,
                        width: double.infinity,
                        color:
                            _validate.contains(false) ? unValidated : mainBlue,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            _forgotIsLoading = true;
                            setState(() {});

                            Duration waitTime = const Duration(seconds: 4);
                            Future.delayed(waitTime, () {
                              _forgotIsLoading = false;
                              if (mounted) {
                                setState(() {});
                              }
                            });

                            try {
                              data.sendOtp();
                              data.emailTextController.clear();
                              if (await data.myAuth.sendOTP() == true) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("OTP has been sent"),
                                ));
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('There is an error'),
                                duration: Duration(seconds: 5),
                              ),
                            );
                          }
                        },
                        child: _forgotIsLoading == false
                            ? MyText(
                                'Continue',
                                color: white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: mainBlue,
                                ),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText('Don\'t have an Account ? ',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xff212121)),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: MyText(
                              'Sign Up',
                              color: mainBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
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
