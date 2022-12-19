import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../widgets/currency_box.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  IconButton(
                      icon: const Icon(Icons.close),
                      iconSize: 17,
                      color: black_13,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  const SizedBox(
                    width: 30,
                  ),
                  MyText(
                    'Checkout',
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: black2121,
                  ),
                ]),
              ),
              const SizedBox(height: 24),
              MyText(
                'To',
                fontFamily: 'Poppins',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: black2121,
              ),
              const SizedBox(height: 10),
              MyText(
                '08153456789',
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: black2121,
              ),
              const SizedBox(height: 12),
              MyText(
                'Amount',
                fontFamily: 'Poppins',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: black2121,
              ),
              const SizedBox(height: 5),
              MyText(
                '${getCurrency()} ${data.amountToSendTextController.text}',
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: black2121,
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 13),
                width: double.infinity,
                height: 121,
                decoration: const BoxDecoration(
                  color: ashColor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          'From:',
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: black2121,
                        ),
                        MyText(
                          '0122342133',
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: black2121,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          'Network:',
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: black2121,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/Ellipse 188.png'),
                            SizedBox(width: 5),
                            MyText(
                              'GLO - 1 Day',
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: black2121,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          'Transaction fee:',
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: black2121,
                        ),
                        MyText(
                          '${getCurrency()}0.00',
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: black2121,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 300),
              MyButton(
                height: 54,
                width: double.infinity,
                color: mainBlue,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: ash3,
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 20, top: 30, right: 20),
                        decoration: const BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 123),
                              child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  MyText(
                                    'Input PIN',
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: black2121,
                                  ),
                                  const SizedBox(width: 100),
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    iconSize: 17,
                                    color: black_13,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                            PinCodeTextField(
                              appContext: context,
                              controller: data.pinCode,
                              length: 4,
                              obscureText: true,
                              autoFocus: true,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                print(value);
                              },
                              pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(10),
                                    fieldHeight: 54,
                                    fieldWidth: 54,
                                    inactiveColor: ash2,
                                    activeColor: mainBlue,
                                  ),
                                ),
                                SizedBox(height: 10),
                                MyText(
                                  'Forgot PIN?',
                                  fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: mainBlue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: MyText(
                  'Confirm',
                  color: white,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
