import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_button.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../widgets/currency_box.dart';

class Confirm extends StatefulWidget {
  const Confirm({Key? key}) : super(key: key);

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          iconSize: 17,
                          color: black_13,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        MyText(
                          'Confirm',
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: black2121,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                MyText(
                  'To',
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                ),
                const SizedBox(height: 19),
                MyText(
                  'TUNDE FEMI MARK',
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: black2121,
                ),
                const SizedBox(height: 19),
                MyText(
                  '${getCurrency()}1,000',
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: black2121,
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 13),
                  width: double.infinity,
                  height: 81,
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
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            'Description:',
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: black2121,
                          ),
                          MyText(
                            'Shoe',
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
                const SizedBox(height: 300),
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
                          padding: const EdgeInsets.only(
                              left: 20, top: 30, right: 20),
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
                                    controller: data.pinCodeField,
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
                                  const SizedBox(height: 10),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
