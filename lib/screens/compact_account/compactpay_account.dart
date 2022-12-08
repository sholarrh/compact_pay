import 'package:compact_pay/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../widgets/currency_box.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
import '../../widgets/text_form_field.dart';

class CompactPayAccount extends StatefulWidget {
  const CompactPayAccount({Key? key}) : super(key: key);

  @override
  State<CompactPayAccount> createState() => _CompactPayAccountState();
}

class _CompactPayAccountState extends State<CompactPayAccount> {
  bool isSwitched1 = false;

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
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
                          'To CompactPay Acccount',
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: black2121,
                        ),
                      ],
                    ),
                  ),
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
                  Image.asset('assets/images/profile-circle.png'),
                  SizedBox(height: 9),
                  MyText(
                    '  Choose\nBeneficiary',
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: black2121,
                  ),
                  SizedBox(height: 36),
                  MyText(
                    ' Account Number',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: black2121,
                    fontFamily: 'Poppins',
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    hintText: '012345678',
                    validator: validateAccountNumber,
                    keyBoardType: TextInputType.number,
                    isPassword: false,
                    hasSuffixIcon: false,
                    inputController: data.accountNumberTextController,
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
                    hintText: '${getCurrency()} 0.00',
                    validator: validateAmount,
                    keyBoardType: TextInputType.number,
                    isPassword: false,
                    hasSuffixIcon: false,
                    inputController: data.amountToSendTextController,
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
                    inputController: data.transferDescriptionTextController,
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
                  SizedBox(height: 62),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
