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
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.03448),
                      child: MyText(
                        'Login',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: black2121,
                        // fontFamily: 'Poppins',
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
                          SizedBox(
                            height: height * 0.0123,
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
                          SizedBox(
                            height: height * 0.0246,
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
                          SizedBox(
                            height: height * 0.0123,
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
                      padding: EdgeInsets.only(top: height * 0.0246),
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
                      padding: EdgeInsets.only(top: height * 0.0246),
                      child: MyButton(
                        height: 54,
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
                                  data.userAddress == 'None'
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
                                } else {}
                              });
                            } catch (e, s) {
                              if (kDebugMode) {
                                print('e: $e');
                                SnackBar(
                                  content: MyText(data.errorMessage),
                                );
                              }
                              if (kDebugMode) {
                                print('s: $s');
                                ShowSnackBar(
                                  text: "$s",
                                  duration: 5,
                                );
                              }
                            }
                          } else {
                            SnackBar(
                              content: MyText(data.errorMessage),
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
                      padding: EdgeInsets.only(
                        top: height * 0.0246,
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
