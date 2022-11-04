



import 'package:compact_pay/screens/set_password.dart';
import 'package:compact_pay/widgets/otp_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {

   var pin1;
   var pin2;
   var pin3;
   var pin4;
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
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
                    children: [
                      OtpBox( obscureText: false,),
                      const SizedBox(width: 25,),
                      OtpBox( obscureText: false,),
                      const SizedBox(width: 25,),
                      OtpBox( obscureText: false,),
                      const SizedBox(width: 25,),
                      OtpBox(  obscureText: false,),
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
                        color: Color(0xff212121),
                      ),
                      MyText(
                        '59s',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff212121),
                      ),
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
                      if (data.formkey.currentState!.validate()) {
                        data.isLoading = true;

                        setState(() {});
                        Duration waitTime = const Duration(seconds: 4);
                        Future.delayed(waitTime, (){
                          if (mounted) {
                            data.isLoading = false;
                          }
                          setState(() {});
                        });

                        try {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const SetPassword()));

                        }
                        catch(e,s){
                          print(e);
                          print(s);
                        }
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'There is an error'),
                          duration: Duration(seconds: 5),),);
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