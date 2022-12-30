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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.02799,
                left: width * 0.0533,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: black2121,
                  size: 17,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.0533,
                right: width * 0.0533,
                top: height * 0.05788,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    'Set Transaction Pin',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: black,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.03325),
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
                        OtpBox1(
                          obscureText: true,
                        ),
                        OtpBox1(
                          obscureText: true,
                        ),
                        OtpBox1(
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.0369),
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
                        OtpBox2(
                          obscureText: true,
                        ),
                        OtpBox2(
                          obscureText: true,
                        ),
                        OtpBox2(
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.061576),
                    child: MyButton(
                      height: 54,
                      width: double.infinity,
                      color: mainBlue,
                      onTap: () async {
                        if (data.pinList.join("") ==
                            data.confirmPinList.join("")) {
                          _setIsLoading = true;
                          setState(() {});

                          Duration waitTime = const Duration(seconds: 4);
                          Future.delayed(waitTime, () {
                            _setIsLoading = false;
                            if (mounted) {
                              setState(() {});
                            }
                          });

                          try {
                            await data.putTransactionPin().then((value) {
                              if (data.putTransactionPinResponse.statusCode ==
                                      200 ||
                                  data.putTransactionPinResponse.statusCode ==
                                      201) {
                                data.pinList.clear();
                                data.confirmPinList.clear();
                                data.hasSetTransactionPin = true;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BottomNav(),
                                  ),
                                );
                              } else {
                                showSnackBar(context, black2121,
                                    'status code: ${data.putTransactionPinResponse.statusCode}\n${data.errorMessage}');
                              }
                            });
                          } catch (e, s) {
                            if (kDebugMode) {
                              print(e);
                            }
                            if (kDebugMode) {
                              print(s);
                            }
                          }
                        } else {
                          showSnackBar(context, black2121,
                              'Transaction pin does not match');
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
