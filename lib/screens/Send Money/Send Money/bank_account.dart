import 'package:compact_pay/screens/Send%20Money/Send%20Money/select_bank.dart';
import 'package:compact_pay/screens/add_money/ussd/select_bank.dart';
import 'package:compact_pay/screens/auth/verification.dart';
import 'package:compact_pay/screens/profile.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_button.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../widgets/show_snackbar.dart';
import '../../../widgets/validator.dart';
import '../../add_money/request_money/add_amount.dart';


class BankAccount extends StatefulWidget {
  const BankAccount({Key? key}) : super(key: key);

  @override
  State<BankAccount> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  bool isSwitched1 = false;

  TextEditingController _accountnumber = TextEditingController();
  TextEditingController _amount = TextEditingController();
  TextEditingController _description = TextEditingController();
  final formkey = GlobalKey<FormState>();
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
                  padding: const EdgeInsets.only(top: 70,),
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
                      const SizedBox(width: 30,),
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
                  padding: const EdgeInsets.only(left: 5, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: mainBlue,
                        size: 17,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      MyText(
                        'Beneficiaries',
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 304,left: 31.83),
                    child: Icon(Icons.account_circle_sharp, size: 50, color: mainBlue),
                  ),
                Padding(
                  padding: const EdgeInsets.only(right: 250.0, left: 21),
                  child: MyText('Choose\nBeneficiary',
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

                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Select Bank ',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: close,
                    ),
                    suffixIcon:  IconButton(
                      icon: Icon(Icons.arrow_drop_down_circle), onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelectBank2()));
                    },
                    ),
                    suffixIconColor: close,
                  ),
                ),


                const SizedBox(height: 8),
                InputField(
                  hintText: '012345678',
                  validator: validateAccountNumber,
                  keyBoardType: TextInputType.number,
                  isPassword: false,
                  hasSuffixIcon: false,
                  inputController: _accountnumber,
                ),
                SizedBox(height: 25),
                MyText(
                  'Amount',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                  fontFamily: 'Poppins',
                ),
                const SizedBox(height: 8),
                InputField(
                  hintText: 'N0.00',
                  validator: validateAmount,
                  keyBoardType: TextInputType.number,
                  isPassword: false,
                  hasSuffixIcon: false,
                  inputController: _amount,
                ),

                SizedBox(height: 25),
                MyText(
                  'Description(Optional)',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                  fontFamily: 'Poppins',
                ),
                const SizedBox(height: 8),
                InputField(
                  hintText: 'What’s this for?',
                  validator: null,
                  keyBoardType: TextInputType.name,
                  isPassword: false,
                  hasSuffixIcon: false,
                  inputController: _description,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      'Save beneficiary',
                      color: black2121,
                      fontFamily: 'Poppins',
                      fontSize: 10,
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
                SizedBox(height: 42),
                MyButton(
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: MyText(
                        'Continue',
                        color: white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),


        ],
            )))));
  }
}



