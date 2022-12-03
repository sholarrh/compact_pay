import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
import '../../widgets/otp_box.dart';
import '../../widgets/show_snackbar.dart';

class Tv extends StatefulWidget {
  const Tv({Key? key}) : super(key: key);

  @override
  State<Tv> createState() => _TvState();
}

class _TvState extends State<Tv> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  String dropdownValue1 = 'National Identification Number';

  String dropdownValue2 = 'National Identification Number';

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          iconSize: 12,
                          color: close,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        MyText(
                          'Tv',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: black2121,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: mainBlue,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        MyText(
                          'History',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: mainBlue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Biller',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue1,
                      enableFeedback: true,
                      hint: MyText(
                        'Choose a Biller',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: black2121.withOpacity(0.4),
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
                          dropdownValue1 = newValue!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 20),
                      child: MyText(
                        'Smartcard Number',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                      ),
                    ),
                    InputField(
                      inputController: data.smartCardNumberTextController,
                      isPassword: false,
                      hintText: 'Enter smartcard number',
                      hasSuffixIcon: false,
                      keyBoardType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 20),
                      child: MyText(
                        'Package',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue2,
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
                          dropdownValue2 = newValue!;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 20),
                      child: MyText(
                        'Phone Number',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                      ),
                    ),
                    InputField(
                      inputController: data.smartCardNumberTextController,
                      isPassword: false,
                      hintText: 'Enter phone number',
                      hasSuffixIcon: false,
                      keyBoardType: TextInputType.number,
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
                              cardBottomSheet(context, data);
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
                                'Fund',
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

  Future<dynamic> cardBottomSheet(BuildContext context, ProviderClass data) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        )),
        enableDrag: false,
        isDismissible: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(children: [
              IconButton(
                icon: const Icon(Icons.close),
                iconSize: 12,
                color: close,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 40),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          'Input PIN',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: black2121,
                          fontFamily: 'Poppins',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        OtpBox2(
                          obscureText: false,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox2(
                          obscureText: false,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox2(
                          obscureText: false,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox2(
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 214.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          'Forgot PIN?',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'poppins',
                          color: mainBlue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          );
        });
  }
}
