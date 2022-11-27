import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/currency_box.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/otp_box.dart';
import '../../../widgets/show_snackbar.dart';
import '../../../widgets/validator.dart';
import 'add_new_card.dart';

class AddByCard extends StatefulWidget {
  const AddByCard({Key? key}) : super(key: key);

  @override
  State<AddByCard> createState() => _AddByCardState();
}

class _AddByCardState extends State<AddByCard> {
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
            child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
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
                            'Add By Card',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: black2121,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 8),
                      child: Image.asset('assets/images/ussd image.png'),
                    ),
                    MyText(
                      'Fund Method',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                    data.bankName == null &&
                            data.cardNumberTextController.text.isEmpty
                        ? Container(
                            margin: const EdgeInsets.only(top: 12, bottom: 30),
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 12, left: 12),
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.wallet_sharp,
                                      color: mainBlue,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        MyText(
                                          'Add New Card',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: black2121,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AddNewCard()));
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: mainBlue,
                                    size: 12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.only(top: 12, bottom: 30),
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 12, left: 12),
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: mainBlue,
                                      backgroundImage:
                                          NetworkImage(data.bankLogo!),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        MyText(
                                          data.bankName!,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: black2121,
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        MyText(
                                          '**** ${data.cardNumberTextController.text.substring(data.cardNumberTextController.text.length - 4)}',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                          color: black2121.withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    MyText(
                                      'Change',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: black2121,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddNewCard()));
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: mainBlue,
                                        size: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                    MyText(
                      'Select or enter amount',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CurrencyBox(
                            amount: '100',
                          ),
                          CurrencyBox(
                            amount: '200',
                          ),
                          CurrencyBox(
                            amount: '500',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, right: 15, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CurrencyBox(
                            amount: '1000',
                          ),
                          CurrencyBox(
                            amount: '2000',
                          ),
                          CurrencyBox(
                            amount: '5000',
                          ),
                        ],
                      ),
                    ),
                    MyText(
                      'Amount',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
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
                                  try {
                                    cardBottomSheet(context, data);
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
                                      'Fund',
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
      ),
    );
  }

  Future<dynamic> cardBottomSheet(BuildContext context, ProviderClass data) {
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
              IconButton(
                icon: const Icon(Icons.close),
                iconSize: 12,
                color: close,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 40),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          'Input PIN',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: black2121,
                          fontFamily: 'Poppins',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        OtpBox2(
                          obscureText: false,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox2(
                          obscureText: false,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox2(
                          obscureText: false,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        OtpBox2(
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 214.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          'Forgot PIN?',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'poppins',
                          color: mainBlue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          );
        });
  }
}
