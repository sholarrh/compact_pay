// Adigun solafunmi

import 'package:compact_pay/screens/auth/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
import '../../widgets/show_snackbar.dart';
import '../../widgets/text_form_field.dart';
import '../../widgets/validator.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  void dispose() {
    ProviderClass().emailTextController.dispose();
    ProviderClass().passwordTextController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  bool _newIsLoading = false;

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
                      padding: const EdgeInsets.only(top: 64.0),
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
                          const SizedBox(
                            height: 21,
                          ),
                          InputField(
                            inputController: data.passwordTextController,
                            isPassword: false,
                            hintText: 'Enter Password',
                            hasSuffixIcon: false,
                            keyBoardType: TextInputType.emailAddress,
                            validator: validateEmail,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: MyText(
                              'Confirm Password',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: black,
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          InputField(
                            inputController: data.confirmPasswordTextController,
                            isPassword: true,
                            hintText: 'Enter Password',
                            hasSuffixIcon: true,
                            keyBoardType: TextInputType.text,
                            validator: validatePassword,
                          ),
                        ],
                      ),
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

                            Duration waitTime = const Duration(seconds: 4);
                            Future.delayed(waitTime, () {
                              _newIsLoading = false;
                              if (mounted) {
                                setState(() {});
                              }
                            });

                            try {
                              data.sendOtp();
                              if (await data.myAuth.sendOTP() == true) {
                                const ShowSnackBar(
                                  text: "OTP has been sent",
                                  duration: 5,
                                );
                                data.passwordTextController.clear();
                                data.confirmPasswordTextController.clear();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
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
                        child: _newIsLoading == false
                            ? MyText(
                                'Continue',
                                color: white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: mainBlue,
                                ),
                              ),
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
