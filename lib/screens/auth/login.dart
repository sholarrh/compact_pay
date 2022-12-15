// Adigun solafunmi
import 'package:compact_pay/screens/auth/kyc_verification.dart';
import 'package:compact_pay/screens/auth/sign_up.dart';
import 'package:compact_pay/screens/forgot_password.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/show_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
import '../../widgets/text_form_field.dart';
import '../../widgets/validator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // @override
  // void dispose() {
  //   ProviderClass().emailTextController.dispose();
  //   ProviderClass().passwordTextController.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool _loginIsLoading = false;
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
                right: 20,
                top: 47,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0, bottom: 28),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: MyText(
                          'Login',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: black2121,
                          // fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    Form(
                      // autovalidateMode: AutovalidateMode.always,
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
                            height: 20,
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
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: MyText(
                              'Password',
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: black,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InputField(
                            inputController: data.passwordTextController,
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
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPassword()));
                          },
                          child: MyText(
                            'Forgot Password?',
                            color: mainBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
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
                            _loginIsLoading = true;
                            setState(() {});

                            Duration waitTime = const Duration(seconds: 4);
                            Future.delayed(waitTime, () {
                              _loginIsLoading = false;
                              if (mounted) {
                                setState(() {});
                              }
                            });

                            try {
                              await data.postLogin().then((value) {
                                if (data.postLoginResponse.statusCode == 202) {
                                  data.passwordTextController.clear();
                                  data.emailTextController.clear();
                                  data.get();
                                  data.hasSetTransactionPin == false
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const KycVerification()))
                                      : Navigator.of(context)
                                          .pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const BottomNav()),
                                              (route) => false);
                                }
                              });
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
                        child: _loginIsLoading == false
                            ? MyText(
                                'Log In',
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
