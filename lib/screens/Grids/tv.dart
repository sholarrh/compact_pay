import 'package:compact_pay/screens/tv/payment_successful.dart';
import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../utils/app_colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
import '../../widgets/otp_box.dart';
import '../../widgets/show_snackbar.dart';
import '../../widgets/validator.dart';

class Tv extends StatefulWidget {
  const Tv({Key? key}) : super(key: key);

  @override
  State<Tv> createState() => _TvState();
}

class _TvState extends State<Tv> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  bool beneficiarySwitch = false;
  bool schedulePaymentSwitch = false;

  static final List<String> tvBiller = ['DSTV', 'GoTV', 'StarTimes', 'SHOWMAX'];

  static final List<Map<String, String>> package = [
    {
      "Name": "Premium",
      "Amount": "21,000",
    },
    {
      "Name": "Compact Plus",
      "Amount": "14,250",
    },
    {
      "Name": "Compact",
      "Amount": "9,000",
    },
    {
      "Name": "Confam",
      "Amount": "5,300",
    },
    {
      "Name": "Yanga",
      "Amount": "2950",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: IconButton(
                icon: const Icon(Icons.close),
                iconSize: 17,
                color: close,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                MyText(
                                  'Tv',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: black2121,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  color: mainBlue,
                                  size: 12,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                MyText(
                                  'History',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: mainBlue,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: MyText(
                          'Biller',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: black2121,
                        ),
                      ),
                      TvInputField(
                        inputController: data.billerTextController,
                        hintText: 'Choose a Biller',
                        keyBoardType: TextInputType.name,
                        validator: validateFullName,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          iconSize: 27,
                          color: const Color(0xff292D32),
                          onPressed: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                ),
                                enableDrag: false,
                                isDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            MyText(
                                              'Choose a Biller',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: black2121,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(
                                                Icons.close,
                                                color: close,
                                                size: 17,
                                              ),
                                            ),
                                          ],
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          //physics: const NeverScrollableScrollPhysics(),
                                          itemCount: tvBiller.length,
                                          itemBuilder: (context, index) =>
                                              ListTile(
                                            onTap: () {
                                              data.billerTextController.text =
                                                  tvBiller[index];
                                              Navigator.pop(context);
                                            },
                                            leading: const CircleAvatar(
                                              radius: 17,
                                              backgroundColor:
                                                  Color(0xffBCB8B8),
                                            ),
                                            title: MyText(
                                              tvBiller[index],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: black2121,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 20),
                        child: MyText(
                          'Smartcard Number',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: black2121,
                        ),
                      ),
                      TvInputField(
                        inputController: data.smartCardNumberTextController,
                        hintText: 'Enter smartcard number',
                        keyBoardType: TextInputType.number,
                        validator: validatePhoneNumber,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 20),
                        child: MyText(
                          'Package',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: black2121,
                        ),
                      ),
                      TvInputField(
                        inputController: data.packageTextController,
                        hintText: 'Choose a Package',
                        keyBoardType: TextInputType.name,
                        validator: validateFullName,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          iconSize: 27,
                          color: const Color(0xff292D32),
                          onPressed: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                ),
                                enableDrag: false,
                                isDismissible: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            MyText(
                                              'Choose a Package',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: black2121,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(
                                                Icons.close,
                                                color: close,
                                                size: 17,
                                              ),
                                            ),
                                          ],
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          //physics: const NeverScrollableScrollPhysics(),
                                          itemCount: package.length,
                                          itemBuilder: (context, index) =>
                                              ListTile(
                                            onTap: () {
                                              data.packageTextController.text =
                                                  package[index]['Name']!;
                                              Navigator.pop(context);
                                            },
                                            trailing: const CircleAvatar(
                                              radius: 8,
                                              backgroundColor:
                                                  Color(0xffBCB8B8),
                                            ),
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                MyText(
                                                  package[index]['Name']!,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: black2121,
                                                ),
                                                MyText(
                                                  package[index]['Amount']!,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: black2121,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 20),
                        child: MyText(
                          'Phone Number',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: black2121,
                        ),
                      ),
                      TvInputField(
                        inputController: data.tvPhoneNumberTextController,
                        hintText: 'Enter phone number',
                        keyBoardType: TextInputType.number,
                        validator: validatePhoneNumber,
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.perm_contact_cal_rounded,
                            color: mainBlue,
                          ),
                        ),
                      ),

                      //const SizedBox(height: 22,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            'Save beneficiary',
                            color: black2121,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                          Switch(
                            value: beneficiarySwitch,
                            onChanged: (value) {
                              setState(() {
                                beneficiarySwitch = value;
                              });
                            },
                            activeColor: const Color(0xff1AAE9F),
                            inactiveTrackColor: lightGrey2,
                          ),
                        ],
                      ),

                      //const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            'Save beneficiary',
                            color: black2121,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                          Switch(
                            value: schedulePaymentSwitch,
                            onChanged: (value) {
                              setState(() {
                                schedulePaymentSwitch = value;
                              });
                            },
                            activeColor: lightGreen,
                            inactiveTrackColor: lightGrey2,
                          ),
                        ],
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
                    ]),
              ),
            ),
          ]),
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
                iconSize: 20,
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
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
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
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 70, bottom: 100),
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
                          data.billerTextController.clear();
                          data.smartCardNumberTextController.clear();
                          data.packageTextController.clear();
                          data.tvPhoneNumberTextController.clear();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PaymentSuccessful()));
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
                        'Send',
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
