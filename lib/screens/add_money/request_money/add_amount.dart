//ADIGUN SOLAFUNMI

import 'package:compact_pay/screens/add_money/request_money/request_complete.dart';
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

class AddAmount extends StatefulWidget {
  const AddAmount({Key? key}) : super(key: key);

  @override
  State<AddAmount> createState() => _AddAmountState();
}

class _AddAmountState extends State<AddAmount> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: backWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
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
                      'Add By Request',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 38.0, bottom: 15),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: MyText(
                  'TUNDE FEMI MARK',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: black2121,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: MyText(
                  '+2348134204991',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: black2121,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      'Amount',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                    TextFormField(
                      validator: validatePhoneNumber,
                      controller: data.amountToSendTextController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: cardColor,
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
                        filled: true,
                        focusColor: Colors.red,
                        hintText: 'Enter 100 ~ 99,999,999',
                        hintStyle: TextStyle(
                            color: black2121.withOpacity(0.4),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'poppins'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 8),
                      child: MyText(
                        'Description (Optional)',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: black2121,
                      ),
                    ),
                    TextFormField(
                      validator: validateFullName,
                      controller: data.transferDescriptionTextController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor: cardColor,
                        filled: true,
                        focusColor: Colors.red,
                        hintText: 'What’s this for?',
                        hintStyle: TextStyle(
                            color: black2121.withOpacity(0.4),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'poppins'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            'Save beneficiary',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: black2121,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 62),
                      child: MyButton(
                        height: 50,
                        width: double.infinity,
                        color: mainBlue,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            data.isLoading = true;
                            setState(() {});
                            data.delay(2);
                            try {
                              requestMoneyBottomSheet(context, data);
                            } catch (e, s) {
                              if (kDebugMode) {
                                print(e);
                              }
                              if (kDebugMode) {
                                print(s);
                              }
                            }
                          } else {
                            showSnackBar(context, black2121,
                                'Please fill the forms correctly');
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

  Future<dynamic> requestMoneyBottomSheet(BuildContext context, ProviderClass data) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        enableDrag: false,
        isDismissible: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close_rounded),
                      iconSize: 14,
                      color: close,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          'You are about to send a request of:',
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: black2121,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 21.0),
                    child: MyText(
                      '${getCurrency()} ${data.amountToSendTextController.text}.00',
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      fontFamily: 'poppins',
                      color: black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          'To',
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          color: black2121,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 47.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          '+2348134204991',
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          fontFamily: 'poppins',
                          color: black2121,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          'You can notify this recipient to send you money. This transaction will \n expire in 24 hours.',
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          fontSize: 10,
                          fontFamily: 'poppins',
                          color: black,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1, bottom: 30),
                    child: MyButton(
                      height: 50,
                      width: double.infinity,
                      color: mainBlue,
                      onTap: () async {
                        //if (formKey.currentState!.validate()) {
                        data.isLoading = true;
                        setState(() {});
                        data.delay(1);
                        try {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const RequestComplete()));
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
                        'Request',
                        color: white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          );
        });
  }
}
