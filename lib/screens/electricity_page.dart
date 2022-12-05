import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/my_button.dart';

class ElectricityPage extends StatefulWidget {
  const ElectricityPage({Key? key}) : super(key: key);

  @override
  State<ElectricityPage> createState() => _ElectricityPageState();
}

class _ElectricityPageState extends State<ElectricityPage> {
  TextEditingController _chooseprovider = TextEditingController();
  TextEditingController _meternumber = TextEditingController();
  TextEditingController _amount = TextEditingController();
  String dropdownValue = '+234';
  String selected = "first";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 17,
                        color: black_13,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 8),
                      MyText(
                        'Electricity',
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: black2121,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                MyText(
                  'Meter Type',
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 'first';
                        });
                      },
                      child: Container(
                        width: 161,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: selected == 'first' ? lightBlue : white,
                        ),
                        child: Center(
                          child: MyText(
                            'Prepaid',
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: mainBlue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 'second';
                        });
                      },
                      child: Container(
                        width: 161,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: selected == 'second' ? lightBlue : white,
                        ),
                        child: Center(
                          child: MyText(
                            'Prepaid',
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: black2121,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                MyText(
                  'Servcie Provider',
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                ),
                SizedBox(height: 8),
                InputField3(
                  inputController: _chooseprovider,
                  hintText: 'Choose Provider',
                  suffixIcon: DropdownButton<String>(
                    value: dropdownValue,
                    elevation: 16,
                    style: const TextStyle(color: black),
                    items: <String>[
                      '+234',
                      '+218',
                      '+235',
                      '+385',
                      '+30',
                      '+221',
                      '+227',
                      '+44',
                      '+93',
                      '+27',
                      '+33',
                      '+233',
                      '+1229',
                      '+594',
                      '+256',
                      '+263',
                      '+260'
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
                ),
                SizedBox(height: 20),
                MyText(
                  'Meter Number',
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                ),
                InputField3(
                  inputController: _meternumber,
                  hintText: 'Enter Meter Number',
                ),
                SizedBox(height: 20),
                MyText(
                  'Amount',
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                ),
                SizedBox(height: 8),
                InputField3(
                  inputController: _amount,
                  hintText: 'Enter Amount',
                  keyBoardType: TextInputType.number,
                ),
                SizedBox(height: 70),
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
                                      color: black_13,
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
