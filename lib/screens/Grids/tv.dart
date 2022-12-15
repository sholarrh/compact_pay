import 'package:compact_pay/screens/tv/payment_successful.dart';
import 'package:compact_pay/widgets/currency_box.dart';
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
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  bool beneficiarySwitch = false;
  bool schedulePaymentSwitch = false;

  List selectedIndex = [];

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

  static final List<String> topUpContainers = [
    'Weekly',
    'Monthly',
    'Quarterly',
    'Annually',
  ];

  var color = white;


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
                        validator: validateAmount,
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
                                                      '${getCurrency()} ${package[index]['Amount']!}',
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
                            'Schedule Bill Payment',
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
                              schedulePaymentSwitch
                                  ? showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      enableDrag: false,
                                      isDismissible: true,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(builder:
                                            (BuildContext context,
                                                StateSetter setState) {
                                          return SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.75,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      MyText(
                                                        'Schedule Top up',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: black2121,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Icon(
                                                          Icons.close,
                                                          color: close,
                                                          size: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 12.0, bottom: 16),
                                                    child: Divider(
                                                      height: 1,
                                                      thickness: 1,
                                                      color: black2121,
                                                    ),
                                                  ),
                                                  MyText(
                                                    'Select Period',
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color: black2121,
                                                  ),

                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0,
                                                            bottom: 16),
                                                    child: GridView.builder(
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 4,
                                                        ),
                                                        itemCount:
                                                            topUpContainers
                                                                .length,
                                                        shrinkWrap: true,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                highlightColor:
                                                                    const Color(
                                                                            0xff126687)
                                                                        .withOpacity(
                                                                            0.12),
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (selectedIndex
                                                                        .contains(
                                                                            index)) {
                                                                      selectedIndex
                                                                          .remove(
                                                                              index);
                                                                    } else {
                                                                      selectedIndex
                                                                          .add(
                                                                              index);
                                                                    }
                                                                  });
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 77,
                                                                  height: 70,
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    color: selectedIndex.contains(
                                                                            index)
                                                                        ? const Color(
                                                                            0xffa1d0e6)
                                                                        : Colors
                                                                            .white,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color:
                                                                          mainBlue,
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      MyText(
                                                                        topUpContainers[
                                                                            index],
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color:
                                                                            mainBlue,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        }),
                                                  ),

                                                  MyText(
                                                    'Start Date',
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color: black2121,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0,
                                                            bottom: 12),
                                                    child: TvInputField(
                                                      inputController: data
                                                          .tvStartDateTextController,
                                                      hintText: 'Choose date',
                                                      keyBoardType:
                                                          TextInputType.number,
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                          Icons.calendar_month,
                                                          size: 20,
                                                          color: black2121,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                  MyText(
                                                    'End Date',
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color: black2121,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0,
                                                            bottom: 12),
                                                    child: TvInputField(
                                                      inputController: data
                                                          .tvStartDateTextController,
                                                      hintText: 'Choose date',
                                                      keyBoardType:
                                                          TextInputType.number,
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                          Icons.calendar_month,
                                                          size: 20,
                                                          color: black2121,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 18,
                                                            bottom: 45),
                                                    child: MyButton(
                                                      height: 50,
                                                      width: double.infinity,
                                                      color: mainBlue,
                                                      onTap: () async {
                                                        // if (formKey.currentState!.validate()) {
                                                        _isLoading = true;
                                                        setState(() {});

                                                        Duration waitTime =
                                                            const Duration(
                                                                seconds: 4);
                                                        Future.delayed(waitTime,
                                                            () {
                                                          _isLoading = false;
                                                          if (mounted) {
                                                            setState(() {});
                                                          }
                                                        });
                                                        try {} catch (e, s) {
                                                          if (kDebugMode) {
                                                            print(e);
                                                          }
                                                          if (kDebugMode) {
                                                            print(s);
                                                          }
                                                        }
                                                        // } else {
                                                        //   const ShowSnackBar(
                                                        //     text: "There is an error",
                                                        //     duration: 5,
                                                        //   );
                                                        // }
                                                      },
                                                      child: data.isLoading ==
                                                              false
                                                          ? MyText(
                                                              'Continue',
                                                              color: white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 20,
                                                            )
                                                          : const Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: white,
                                                              ),
                                                            ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                      })
                                  : null;
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
                          child: _isLoading == false
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
