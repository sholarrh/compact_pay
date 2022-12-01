//ADIGUN SOLAFUNMI

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

class KycVerification extends StatefulWidget {
  const KycVerification({Key? key}) : super(key: key);

  @override
  State<KycVerification> createState() => _KycVerificationState();
}

class _KycVerificationState extends State<KycVerification> {
  String dropdownValue = 'National Identification Number';

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 22),
                child: IconButton(
                  icon: const Icon(Icons.close),
                  iconSize: 14,
                  color: close,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              MyText(
                'KYC Verification',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: black2121,
                fontFamily: 'Poppins',
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 27.0, bottom: 8),
                      child: MyText(
                        'Address',
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: black2121,
                      ),
                    ),
                    InputField(
                      inputController: data.addressTextController,
                      isPassword: false,
                      hintText: 'Enter Address',
                      hasSuffixIcon: false,
                      keyBoardType: TextInputType.name,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 8),
                      child: MyText(
                        'Valid Means of Identification',
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: black2121,
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      enableFeedback: true,
                      hint: MyText(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: black2121.withOpacity(0.4),
                        'Choose',
                      ),
                      dropdownColor: white,
                      isExpanded: true,
                      iconSize: 30,
                      borderRadius: BorderRadius.circular(7),
                      iconEnabledColor: black2121.withOpacity(0.9),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: black2121.withOpacity(0.9),
                        fontFamily: 'Poppins',
                      ),
                      items: <String>[
                        'National Identification Number',
                        'Voters Card',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: MyText(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 8),
                      child: MyText(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                        'Number',
                      ),
                    ),
                    InputField(
                      inputController: data.identificationNumberTextController,
                      isPassword: false,
                      hintText: 'Enter number',
                      hasSuffixIcon: false,
                      keyBoardType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 8),
                      child: MyText(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                        'Bank verification Number (BVN)',
                      ),
                    ),
                    InputField(
                      inputController: data.bvnTextController,
                      isPassword: false,
                      hintText: 'Enter BVN',
                      hasSuffixIcon: false,
                      keyBoardType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 8),
                      child: MyText(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                        'Password',
                      ),
                    ),
                    InputField(
                      inputController: data.passwordTextController,
                      isPassword: true,
                      hintText: 'Enter Password',
                      hasSuffixIcon: true,
                      keyBoardType: TextInputType.name,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
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
                              data.addressTextController.clear();
                              data.passwordTextController.clear();
                              data.bvnTextController.clear();
                              data.identificationNumberTextController.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
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
                        child: data.isLoading == false
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
      ),
    );
  }
}
