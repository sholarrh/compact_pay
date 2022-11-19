
import 'package:compact_pay/screens/auth/login.dart';
import 'package:compact_pay/screens/auth/new_password.dart';
import 'package:compact_pay/screens/set_transaction_pin.dart';
import 'package:compact_pay/widgets/otp_box.dart';
import 'package:flutter/material.dart';
//import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
import '../../widgets/show_snackbar.dart';

class Verification extends StatefulWidget {
  final bool goToPasswordScreen;

  const Verification(
      this.goToPasswordScreen, {super.key}
      );

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

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    //final seconds = data.strDigits(data.myDuration.inSeconds.remainder(60));
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    iconSize: 17,
                    onPressed: () {
                      Navigator.pop(context);
                    },),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 34.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: MyText(
                      'OTP Verification',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: black,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 74, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  const [
                      OtpBox(
                        obscureText: false,
                        ),
                      SizedBox(width: 25,),
                      OtpBox( obscureText: false,
                      ),
                      SizedBox(width: 25,),
                      OtpBox( obscureText: false,
                        ),
                      SizedBox(width: 25,),
                      OtpBox(  obscureText: false,
                       ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 56),
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
                  padding: const EdgeInsets.only(top: 25),
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
                            ),)
                      // MyText(
                      //   '59s',
                      //   textAlign: TextAlign.center,
                      //   fontWeight: FontWeight.w400,
                      //   fontSize: 12,
                      //   color: const Color(0xff212121),
                      // ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: MyButton(
                    height: 50,
                    width: double.infinity,
                    color: mainBlue,
                    onTap: () async {
                      print('this is the otp: ${data.otpCodeList.join("")}');
                       if (await data.myAuth.verifyOTP(otp: data.otpCodeList.join("")) == true) {
                        data.isLoading = true;
                        setState(() {});
                        data.delay(4);
                        try {
                          print(widget.goToPasswordScreen);
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  widget.goToPasswordScreen ?  const NewPassword()
                              :const Login()));
                        }
                        catch(e,s){
                          print(e);
                          print(s);
                        }
                      }
                      else{
                         const ShowSnackBar(
                           text: "Invalid OTP",
                           duration: 5,
                         );
                      }
                    },
                    child: data.isLoading == false ? MyText(
                      'Continue',
                      color: white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,)
                        : const Center(
                          child: CircularProgressIndicator(
                            color: mainBlue,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}