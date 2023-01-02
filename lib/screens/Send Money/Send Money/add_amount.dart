import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/bottom_nav.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/text_form_field.dart';
import '../../../widgets/validator.dart';

class AddAmount extends StatefulWidget {
  const AddAmount({Key? key}) : super(key: key);

  @override
  State<AddAmount> createState() => _AddAmountState();
}

class _AddAmountState extends State<AddAmount> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

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
                  padding: const EdgeInsets.only(top: 51,),
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
                const SizedBox(height: 10),
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
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const Profile()));
                //   },
                //
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 15, right: 304,left: 31.83),
                //     child: Icon(Icons.account_circle_sharp, size: 50, color: mainBlue),
                //   ),
                // ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, right: 304, left: 31.83),
                  child: Icon(Icons.account_circle_sharp,
                      size: 50, color: mainBlue),
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
                const SizedBox(height: 8),
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
                      TextFormField(
                        validator: validatePhoneNumber,
                        controller: data.amountToSendTextController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: cardColor,
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(
                                width: 2,
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
                    ],
                  ),
                ),
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
                  // validator: validateFullName,
                  keyBoardType: TextInputType.name,
                  isPassword: false,
                  hasSuffixIcon: false,
                  inputController: data.firstNameTextController,
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
                  //validator: validatePhoneNumber,
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
                    MyText('(Optional)',
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
                  keyBoardType: TextInputType.name,
                  isPassword: false,
                  hasSuffixIcon: false,
                  inputController: data.firstNameTextController,
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                const Padding(
                  padding: EdgeInsets.only(bottom: 21.0),
                  // child: MyText(
                  //   '${getCurrency()} ${data.amountToSendTextController.text}',
                  //   fontWeight: FontWeight.w600,
                  //   fontSize: 24,
                  //   fontFamily: 'poppins',
                  //   color: black,
                  // ),
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
                  padding: const EdgeInsets.only(bottom: 66.0),
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
                  padding: const EdgeInsets.only(top: 1, bottom: 30),
                  child: MyButton(
                    height: 50,
                    width: double.infinity,
                    color: mainBlue,
                    onTap: () async {
                      //if (formKey.currentState!.validate()) {
                      data.isLoading = true;
                      // setState(() {});
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
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: MyButton(
                    height: 50,
                    width: double.infinity,
                    color: mainBlue,
                    onTap: () async {
                      var formKey;
                      if (formKey.currentState!.validate()) {
                        data.isLoading = true;
                        // setState(() {});
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
                        // const ShowSnackBar(
                        //   text: "There is an error",
                        //   duration: 5,
                        // );
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
          ]),
        );
      });
}



