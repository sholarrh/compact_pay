

import 'package:compact_pay/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
import '../../widgets/text_form_field.dart';
import '../../widgets/validator.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: white,
      body: SingleChildScrollView(
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
                        'Create New Password',
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
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            'New Password',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: black,
                          ),
                        ),

                        const SizedBox(height: 20,),

                        InputField(
                          inputController: data.emailTextController,
                          isPassword: false,
                          hintText: 'Enter Password',
                          hasSuffixIcon: false,
                          keyBoardType: TextInputType.emailAddress,
                          validator: validateEmail,),

                        const SizedBox(height: 20,),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            'Confirm Password',
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
                    padding: const EdgeInsets.only(top: 80),
                    child: MyButton(
                      height: 50,
                      width: double.infinity,
                      color: mainBlue,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
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
                        fontWeight: FontWeight.w700,
                        fontSize: 16,)
                          : const Center(
                            child: CircularProgressIndicator(
                          color: mainBlue,
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
