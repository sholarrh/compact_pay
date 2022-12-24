// Adigun solafunmi

import 'package:compact_pay/screens/auth/login.dart';
import 'package:compact_pay/screens/auth/new_password.dart';
import 'package:compact_pay/widgets/otp_box.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
import '../../widgets/show_snackbar.dart';

class Verification extends StatefulWidget {
  final bool goToPasswordScreen;

  const Verification(this.goToPasswordScreen, {super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  void initState() {
    super.initState();
    ProviderClass().startTimer();
    // ProviderClass().setCountDown();
  }

  bool _verificationIsLoading = false;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    //final seconds = data.strDigits(data.myDuration.inSeconds.remainder(60));
    return Scaffold(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    'OTP Verification',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: black,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.0677, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        OtpBox(
                          obscureText: false,
                        ),
                        OtpBox(
                          obscureText: false,
                        ),
                        OtpBox(
                          obscureText: false,
                        ),
                        OtpBox(
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.0887),
                    child: SizedBox(
                      width: double.infinity,
                      child: MyText(
                        'Didn\'t get code? ',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xff212121),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.03079),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          'Resend in ',
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(0xff212121),
                        ),
                        Countdown(
                          seconds: 60,
                          build: (_, double time) => MyText(
                            time.toString(),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.061576),
                    child: MyButton(
                      height: 54,
                      width: double.infinity,
                      color: mainBlue,
                      onTap: () async {
                        // print('this is the otp: ${data.otpCodeList.join("")}');
                        if (await data.myAuth
                                .verifyOTP(otp: data.otpCodeList.join("")) ==
                            true) {
                          _verificationIsLoading = true;
                          setState(() {});

                          Duration waitTime = const Duration(seconds: 4);
                          Future.delayed(waitTime, () {
                            _verificationIsLoading = false;
                            if (mounted) {
                              setState(() {});
                            }
                          });

                          try {
                            await data.postRegister().then((value) {
                              if (data.signUpResponse.statusCode == 200 ||
                                  data.signUpResponse.statusCode == 201) {
                                data.firstNameTextController.clear();
                                data.lastNameTextController.clear();
                                data.middleNameTextController.clear();
                                data.emailTextController.clear();
                                data.passwordTextController.clear();
                                data.confirmPasswordTextController.clear();
                                data.phoneNumberTextController.clear();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            widget.goToPasswordScreen
                                                ? const NewPassword()
                                                : const Login()));
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
                            text: "Invalid OTP",
                            duration: 5,
                          );
                        }
                      },
                      child: _verificationIsLoading == false
                          ? MyText(
                              'Continue',
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
          ]),
        ),
      ),
    );
  }
}
