import 'package:flutter/material.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_button.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Confirm2 extends StatefulWidget {
  const Confirm2({Key? key}) : super(key: key);

  @override
  State<Confirm2> createState() => _Confirm2State();
}

class _Confirm2State extends State<Confirm2> {
  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 24),
                MyText(
                  'To',
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                ),
                SizedBox(height: 19),
                MyText(
                  'TUNDE FEMI MARK',
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: black2121,
                ),
                SizedBox(height: 19),
                MyText(
                  'N 1,000',
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: black2121,
                ),
                SizedBox(height: 30),
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
                                  '0122342133',
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
                              child: Image.asset(
                                'assets/images/gtblogo.jpg',
                                height: 14.6,
                                width: 14.6,
                              ),
                            ),
                            MyText(
                              'Guaranty Trust Bank',
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                        SizedBox(
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
                              'Shoe',
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
                SizedBox(height: 300),
                MyButton(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        color: ash3,
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 20, top: 30, right: 20),
                          decoration: BoxDecoration(
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
                                    SizedBox(width: 100),
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
                              SizedBox(height: 25),
                              PinCodeTextField(
                                appContext: context,
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
