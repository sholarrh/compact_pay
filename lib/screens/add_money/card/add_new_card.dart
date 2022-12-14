//ADIGUN SOLAFUNMI

import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:compact_pay/widgets/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/show_snackbar.dart';
import '../ussd/select_bank.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      iconSize: 12,
                      color: close,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    MyText(
                      'Add New Card',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Name on Card',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    InputField(
                      inputController: data.cardNameTextController,
                      isPassword: false,
                      hintText: 'Tola Kelechi',
                      hasSuffixIcon: false,
                      keyBoardType: TextInputType.name,
                      validator: validateFullName,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 8.0),
                      child: MyText(
                        'Card Number',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    InputField(
                      inputController: data.cardNumberTextController,
                      isPassword: false,
                      hintText: '4633 2021 2211 3003',
                      hasSuffixIcon: false,
                      keyBoardType: TextInputType.number,
                      validator: validateCardNumber,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 158,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: MyText(
                                    'Expiry Date',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: black2121,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                InputField(
                                  inputController:
                                      data.cardExpiryDateTextController,
                                  isPassword: false,
                                  hintText: '07/28',
                                  hasSuffixIcon: false,
                                  keyBoardType: TextInputType.number,
                                  validator: validateCardExpiryDateNumber,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 158,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: MyText(
                                    'CVV',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: black2121,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                InputField(
                                  inputController: data.cardCvvTextController,
                                  isPassword: false,
                                  hintText: '123',
                                  hasSuffixIcon: false,
                                  keyBoardType: TextInputType.number,
                                  validator: validateCardCvvNumber,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: MyText(
                        'The issuer of your debit card may request that you type in your card PIN in \n order to validate this transaction. CompactPay does not have access \n to your card PIN and do not store this personal information.',
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                        fontFamily: 'Poppins',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 180),
                      child: MyButton(
                        height: 50,
                        width: double.infinity,
                        color: mainBlue,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            _isLoading = true;
                            setState(() {});
                            Duration waitTime = const Duration(seconds: 4);
                            Future.delayed(waitTime, () {
                              _isLoading = false;
                              if (mounted) {
                                setState(() {});
                              }
                            });
                            try {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SelectBank(
                                    addMoney: 'Add new card',
                                  ),
                                ),
                              );
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
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: white,
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
      ),
    );
  }
}
