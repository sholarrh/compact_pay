import 'package:compact_pay/screens/Send%20Money/Send%20Money/transfer_successful.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/currency_box.dart';
import 'package:compact_pay/widgets/my_button.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';

class Confirm2 extends StatefulWidget {
  const Confirm2({Key? key}) : super(key: key);

  @override
  State<Confirm2> createState() => _Confirm2State();
}

class _Confirm2State extends State<Confirm2> {
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
                          color: close,
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
                  '${getCurrency()} ${data.amountToSendTextController.text}',
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: black2121,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 16, right: 16),
                    width: double.infinity,
                    height: 121,
                    decoration: BoxDecoration(
                      color: lightGrey2,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              'From:',
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyText(
                                  data.receiverAccountNumberTextController.text,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: black2121,
                                ),
                                const SizedBox(
                                  width: 4.4,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyText(
                                  'Beneficiary Bank:',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: Image.network(
                                data.bankLogo!,
                                height: 14.6,
                                width: 14.6,
                              ),
                            ),
                            MyText(
                              data.bankName!,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyText(
                                  'Description:',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                            MyText(
                              data.transferDescriptionTextController.text,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 300),
                MyButton(
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      enableDrag: false,
                      isDismissible: true,
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                                    color: close,
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
                              length: 4,
                              obscureText: true,
                              autoFocus: true,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                if (kDebugMode) {
                                  print(value);
                                }
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 20),
                              child: MyButton(
                                height: 50,
                                width: double.infinity,
                                color: mainBlue,
                                onTap: () async {
                                  //if (formKey.currentState!.validate()) {
                                  data.isLoading = true;
                                  setState(() {});
                                  data.delay(4);
                                  try {
                                    data.accountNameTextController.clear();
                                    data.transferDescriptionTextController
                                        .clear();
                                    data.receiverAccountNumberTextController
                                        .clear();

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TransferSuccessful()));
                                  } catch (e, s) {
                                    if (kDebugMode) {
                                      print(e);
                                    }
                                    if (kDebugMode) {
                                      print(s);
                                    }
                                  }
                                },
                                child: MyText(
                                  'Send',
                                  color: white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: MyText(
                        'Confirm',
                        color: white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
