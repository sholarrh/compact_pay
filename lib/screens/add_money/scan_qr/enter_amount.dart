//ADIGUN SOLAFUNMI

import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/currency_box.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/show_snackbar.dart';
import '../../../widgets/validator.dart';

class EnterAmount extends StatefulWidget {
  const EnterAmount({Key? key}) : super(key: key);

  @override
  State<EnterAmount> createState() => _EnterAmountState();
}

class _EnterAmountState extends State<EnterAmount> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

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
                padding: const EdgeInsets.only(top: 10, bottom: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      alignment: Alignment.centerLeft,
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
                      'Enter Amount',
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
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: MyText(
                        'Amount',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: black2121,
                      ),
                    ),
                    TvInputField(
                      validator: validatePhoneNumber,
                      inputController: data.amountToSendTextController,
                      keyBoardType: TextInputType.number,
                      hintText: 'Enter 100 ~ 99,999,999',
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            getCurrency(),
                            style: const TextStyle(
                              color: black2121,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'poppins',
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const VerticalDivider(
                            width: 2,
                            color: black2121,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: MyButton(
                        height: 50,
                        width: double.infinity,
                        color: mainBlue,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            data.isLoading = true;
                            setState(() {});
                            data.delay(4);
                            try {} catch (e, s) {
                              if (kDebugMode) {
                                print(e);
                              }
                              if (kDebugMode) {
                                print(s);
                              }
                            }
                          } else {
                            showSnackBar(
                                context, black2121, 'Please enter an amount');
                          }
                        },
                        child: data.isLoading == false
                            ? MyText(
                          'Done',
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
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
