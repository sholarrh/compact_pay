import 'package:compact_pay/screens/add_money/ussd/select_bank.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_button.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../widgets/show_snackbar.dart';
import '../../../widgets/validator.dart';
import 'confirm.dart';

class BankAccount extends StatefulWidget {
  const BankAccount({Key? key}) : super(key: key);

  @override
  State<BankAccount> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  // bool addMoney = false;
  bool isSwitched1 = false;

  final formKey = GlobalKey<FormState>();

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
                top: 17,
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
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
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.account_circle_sharp,
                              size: 50, color: mainBlue),
                          MyText(
                            'Choose\nBeneficiary',
                            textAlign: TextAlign.center,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: black,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 8),
                      child: MyText(
                        'Bank',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide.none,
                        ),
                        hintText: data.bankName == null
                            ? 'Select Bank'
                            : '  ${data.bankName}',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: close,
                        ),
                        prefixIcon: data.bankLogo != null
                            ? CircleAvatar(
                          radius: 2,
                          backgroundColor: mainBlue,
                          backgroundImage: NetworkImage(data.bankLogo!),
                        )
                            : null,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.arrow_drop_down_circle),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const SelectBank(
                                      addMoney: false,
                                    )));
                          },
                        ),
                        suffixIconColor: close,
                      ),
                    ),
                    const SizedBox(height: 24),
                    MyText(
                      'Account Number',
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
                      inputController: data.receiverAccountNumberTextController,
                      inputFormatters: FilteringTextInputFormatter.allow(
                        RegExp("[0-9]"),
                      ),
                    ),
                    const SizedBox(height: 25),
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
                      inputController: data.amountToSendTextController,
                    ),
                    const SizedBox(height: 25),
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
                      validator: validateFullName,
                      keyBoardType: TextInputType.name,
                      isPassword: false,
                      hasSuffixIcon: false,
                      inputController: data.transferDescriptionTextController,
                    ),
                    const SizedBox(height: 15),
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
                              if (kDebugMode) {
                                print(isSwitched1);
                              }
                            });
                          },
                          activeColor: lightGreen,
                          inactiveTrackColor: lightGrey2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 42),
                    MyButton(
                      height: 50,
                      width: double.infinity,
                      color: mainBlue,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          data.isLoading = true;
                          setState(() {});
                          data.delay(4);
                          try {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Confirm2()));
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
                            text: "There is an error",
                            duration: 5,
                          );
                        }
                      },
                      child: data.isLoading == false
                          ? MyText(
                        'Continue',
                        color: white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )
                          : const Center(
                        child: CircularProgressIndicator(
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
