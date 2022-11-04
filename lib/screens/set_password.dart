

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../utils/app_colors.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text.dart';
import '../widgets/otp_box.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({Key? key}) : super(key: key);

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: MyText(
                      'Set Transaction Pin',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: black,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 47),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: MyText(
                      'Enter transaction Pin',
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: black,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OtpBox(  obscureText: true,),
                      const SizedBox(width: 25,),
                      OtpBox( obscureText: true,),
                      const SizedBox(width: 25,),
                      OtpBox( obscureText: true,),
                      const SizedBox(width: 25,),
                      OtpBox( obscureText: true,),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: MyText(
                      'Confirm transaction Pin',
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: black,
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const OtpBox( obscureText: true,),
                      const SizedBox(width: 25,),
                      const OtpBox( obscureText: true,),
                      const SizedBox(width: 25,),
                      OtpBox( obscureText: true,),
                      const SizedBox(width: 25,),
                      OtpBox( obscureText: true,),
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
