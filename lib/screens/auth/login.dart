


import 'package:compact_pay/screens/auth/verification.dart';
import 'package:compact_pay/screens/forgot_password.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
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

  bool goToPasswordScreen = false;

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
                      'Log In',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: black,
                    ),
                  ),
                ),

                Form(
                  key: data.formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            'Email Address',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
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

                      const SizedBox(height: 20,),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          'Password',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: black,
                        ),
                      ),

                      const SizedBox(height: 20,),

                      InputField(
                        inputController: data.passwordTextController,
                        isPassword: true,
                        hintText: 'Enter Password',
                        hasSuffixIcon: true,
                        keyBoardType: TextInputType.text,
                        validator: validatePassword,
                      ),
                    ],),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const ForgotPassword()));
                      },
                      child: MyText('Forgot Password?',
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
                          color: mainBlue,
                          onTap: () async {
                            if (data.formKey.currentState!.validate()) {
                          data.isLoading = true;
                          setState(() {});
                          data.delay(4);
                          try {
                            data.sendOtp();
                            if (await data.myAuth.sendOTP() == true) {
                              const ShowSnackBar(
                                text: "OTP has been sent",
                                duration: 5,
                              );
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
                              const ShowSnackBar(
                                text: "There is an error",
                                duration: 5,
                              );
                            }
                          },
                          child: data.isLoading == false ? MyText(
                            'Log In',
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
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => const Login()));
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
