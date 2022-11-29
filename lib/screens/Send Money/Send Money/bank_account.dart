import 'package:compact_pay/screens/profile.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../widgets/validator.dart';

class BankAccount extends StatefulWidget {
  const BankAccount({Key? key}) : super(key: key);

  @override
  State<BankAccount> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 51,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 17,
                        color: black2121,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      MyText(
                        'To Bank Account',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: black2121,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: mainBlue,
                      ),
                      MyText(
                        'Beneficiaries',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, right: 304, left: 31.83),
                    child: Icon(Icons.account_circle_sharp,
                        size: 50, color: mainBlue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250.0, left: 21),
                  child: MyText(
                    'Choose\nBeneficiary',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 315.0),
                  child: MyText(
                    'Bank',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 18),
                InputField2(
                  hintText: 'Select Bank',
                  keyBoardType: TextInputType.phone,
                  suffixIcon: DropdownButton<String>(
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
                        // dropdownValue = newValue!;
                      });
                    },
                  ),
                  inputController: data.phoneNumberTextController,
                ),
                //   prefixIcon: DropdownButton<String>(
                //     elevation: 16,
                //     style: const TextStyle(color: black),
                //     items: <String>[
                //       '+234',
                //       '+218',
                //       '+235',
                //       '+385',
                //       '+30',
                //       '+221',
                //       '+227',
                //       '+44',
                //       '+93',
                //       '+27',
                //       '+33',
                //       '+233',
                //       '+1229',
                //       '+594',
                //       '+256',
                //       '+263',
                //       '+260'
                //     ].map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: MyText(value),
                //       );
                //     }).toList(),
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         // dropdownValue = newValue!;
                //       });
                //     },
                //   ),
                //   inputController: data.phoneNumberTextController,
                // ),

                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(right: 250.0),
                  child: MyText(
                    ' Account Number',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                InputField(
                  hintText: '012345678',
                  validator: validateFullName,
                  keyBoardType: TextInputType.name,
                  isPassword: false,
                  hasSuffixIcon: false,
                  inputController: data.fullNameTextController,
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(right: 305.0),
                  child: MyText(
                    'Amount',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                InputField(
                  validator: validateEmail,
                  hintText: 'N0.00',
                  keyBoardType: TextInputType.name,
                  isPassword: false,
                  hasSuffixIcon: false,
                  inputController: data.emailTextController,
                ),

                const SizedBox(height: 8),
                Row(
                  children: [
                    MyText(
                      'Description',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: black,
                      fontFamily: 'Poppins',
                    ),
                    MyText(
                      '(Optional)',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: black,
                      fontFamily: 'Poppins',
                    )
                  ],
                ),
                const SizedBox(height: 9),
                InputField(
                  hintText: 'What’s this for?',
                  validator: validateFullName,
                  keyBoardType: TextInputType.name,
                  isPassword: false,
                  hasSuffixIcon: false,
                  inputController: data.fullNameTextController,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      'Save beneficiary',
                      color: black2121,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    Switch(
                      value: isSwitched1,
                      onChanged: (value) {
                        setState(() {
                          isSwitched1 = value;
                          print(isSwitched1);
                        });
                      },
                      activeColor: lightGreen,
                      inactiveTrackColor: lightGrey2,
                    ),
                  ],
                ),

                const SizedBox(height: 9),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
