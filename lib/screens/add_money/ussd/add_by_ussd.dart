// adigun solafunmi

import 'package:compact_pay/screens/add_money/ussd/select_bank.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/currency_box.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/show_snackbar.dart';
import '../../../widgets/validator.dart';

class AddByUssd extends StatefulWidget {
  const AddByUssd({Key? key}) : super(key: key);

  @override
  State<AddByUssd> createState() => _AddByUssdState();
}

class _AddByUssdState extends State<AddByUssd> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   ProviderClass().Amnt();
  // }

  final _formKey = GlobalKey<FormState>();

  //bool addMoney = true;

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
            child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.close),
                            iconSize: 20,
                            color: close,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          MyText(
                            'Add By Ussd',
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
                    data.bankName == null
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
                                          'Add Bank',
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
                                                const SelectBank(
                                                  addMoney: true,
                                                )));
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
                         :Container(
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
                                                    const SelectBank(
                                                      addMoney: true,
                                                    )));
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
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            'Amount',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: black2121,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          TextFormField(
                            style: const TextStyle(
                              color: black2121,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'poppins',
                            ),
                            showCursor: true,
                            validator: validatePhoneNumber,
                            controller: data.amountToSendTextController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 0.7),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              fillColor: white,
                              prefixIcon: SizedBox(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      getCurrency(),
                                      style: const TextStyle(
                                        color: black2121,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins',
                                      ),
                                    ),
                                    // const SizedBox(
                                    //   width: 8,
                                    // ),

                                    // SizedBox(
                                    //   width: 1,
                                    //   child: Center(
                                    //     child: Container(
                                    //       width: 1,
                                    //       margin: const EdgeInsets.only(top: 2, bottom: 2),
                                    //       decoration: BoxDecoration(
                                    //         border: Border(
                                    //           left: Divider.createBorderSide(context, color: black2121, width: 1),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // const VerticalDivider(
                                    //   indent: 2,
                                    //   endIndent: 2,
                                    //   width: 1,
                                    //   thickness: 2,
                                    //   color: black2121,
                                    // ),
                                  ],
                                ),
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
                                    ussdBottomSheet(context, data);
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
      ),
    );
  }

  Future<dynamic> ussdBottomSheet(BuildContext context, ProviderClass data) {
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
          return Wrap(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    iconSize: 17,
                    color: close,
                    padding: const EdgeInsets.all(10),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 30),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: mainBlue,
                            backgroundImage: NetworkImage(data.bankLogo!),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyText(
                                data.bankName!,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: black2121,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 21.0),
                      child: MyText(
                        '${getCurrency()} ${data.amountToSendTextController.text}',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        fontFamily: 'poppins',
                        color: black,
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
                            'Dial the code below and follow the steps fund your \n account successfully.',
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            fontFamily: 'poppins',
                            color: black2121,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 64.0),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              '*737*000*6990#',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              fontFamily: 'poppins',
                              color: black,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.copy_sharp,
                              size: 18,
                              color: mainBlue,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1, bottom: 38),
                      child: MyButton(
                        height: 50,
                        width: double.infinity,
                        color: mainBlue,
                        onTap: () async {
                          //if (formKey.currentState!.validate()) {
                          data.isLoading = true;
                          setState(() {});
                          data.delay(4);
                          try {
                            data.amountToSendTextController.clear();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomNav()));
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
                          'Tap to call',
                          color: white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ]);
        });
  }
}
