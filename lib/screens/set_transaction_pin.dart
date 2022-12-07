// Adigun solafunmi

import 'package:compact_pay/widgets/bottom_nav.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../utils/app_colors.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text.dart';
import '../widgets/otp_box.dart';
import '../widgets/show_snackbar.dart';

class SetTransactionPin extends StatefulWidget {
  const SetTransactionPin({Key? key}) : super(key: key);

  @override
  State<SetTransactionPin> createState() => _SetTransactionPinState();
}

class _SetTransactionPinState extends State<SetTransactionPin> {
  bool _setIsLoading = false;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: IconButton(
                icon: const Icon(Icons.close),
                iconSize: 17,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 61),
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
                      children: const [
                        OtpBox1(
                          obscureText: true,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox1(
                          obscureText: true,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox1(
                          obscureText: true,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox1(
                          obscureText: true,
                        ),
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
                      children: const [
                        OtpBox2(
                          obscureText: true,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox2(
                          obscureText: true,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox2(
                          obscureText: true,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox2(
                          obscureText: true,
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
                        // print(data.pinList.join(""));
                        // print(data.confirmPinList.join(""));
                        if (data.pinList.join("") ==
                            data.confirmPinList.join("")) {
                          data.isLoading = true;
                          setState(() {});

                          Duration waitTime = const Duration(seconds: 4);
                          Future.delayed(waitTime, () {
                            _setIsLoading = false;
                            if (mounted) {
                              setState(() {});
                            }
                          });

                          try {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomNav()));
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
                            text: "Transaction pin does not match",
                            duration: 5,
                          );
                        }
                      },
                      child: _setIsLoading == false
                          ? MyText(
                              'Continue',
                              color: white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            )
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
          ]),
        ),
      ),
    );
  }
}
