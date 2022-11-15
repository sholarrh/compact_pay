

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
  final _formkey = GlobalKey<FormState>();
  GlobalKey<FormState> get formkey => _formkey;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: white,
      body:  SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 18,),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    padding: const EdgeInsets.only(top: 14.0),
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
                    key: formkey,
                    child: Column(
                      children: [
                        const SizedBox(height: 40,),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            'Email Address',
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: black,
                          ),
                        ),

                        const SizedBox(height: 20,),

                        InputField(
                          inputController: data.emailTextController,
                          isPassword: false,
                          hintText: 'Enter Email Address',
                          hasSuffixIcon: false,
                          keyBoardType: TextInputType.emailAddress,
                          validator: validateEmail,),
                      ],),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: MyButton(
                      height: 50,
                      width: double.infinity,
                      color: mainBlue,
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          data.isLoading = true;
                          setState(() {});

                          data.delay(4);

                          try {
                            data.sendOtp();
                            if (await data.myAuth.sendOTP() == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                    content: Text("OTP has been sent"),
                              ));
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>  Verification(goToPasswordScreen)));
                            }
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
                        fontWeight: FontWeight.w600,
                        fontSize: 16,)
                          : const Center(
                            child: CircularProgressIndicator(
                              color: mainBlue,
                        ),
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 20,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText('Don\'t have an Account ? ',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color(0xff212121)),

                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const SignUp()));
                          },
                          child: MyText('Sign Up',
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
        ),
      ),
    );
  }
}
