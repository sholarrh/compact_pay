import 'package:compact_pay/provider/provider.dart';
import 'package:compact_pay/screens/Data/check_out.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/currency_box.dart';
import 'package:compact_pay/widgets/my_button.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Airtime extends StatefulWidget {
  const Airtime({Key? key}) : super(key: key);

  @override
  State<Airtime> createState() => _AirtimeState();
}

class _AirtimeState extends State<Airtime> {
  bool isSwitched1 = false;
  String selected = "first";
  String pick = 'first';

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
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
                          width: 5,
                        ),
                        MyText(
                          'Airtime Top up',
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: black2121,
                        ),
                        const SizedBox(width: 110),
                        IconButton(
                          icon: const Icon(Icons.watch_later_outlined),
                          iconSize: 17,
                          color: mainBlue,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        MyText(
                          'History',
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: mainBlue,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  MyText(
                    'Select Network Provider',
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: black2121,
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'first';
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selected == 'first' ? black : white,
                            ),
                          ),
                          child:
                              Image.asset('assets/images/Rectangle 3359.png'),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'second';
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selected == 'second' ? black : white,
                            ),
                          ),
                          child:
                              Image.asset('assets/images/Rectangle 3360.png'),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'third';
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selected == 'third' ? black : white,
                            ),
                          ),
                          child: Image.asset(
                              'assets/images/Rectangle 3361 (3).png'),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 'fourth';
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selected == 'fourth' ? black : white,
                            ),
                          ),
                          child:
                              Image.asset('assets/images/Rectangle 3362.png'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  MyText(
                    'Select Amount',
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: black2121,
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: const [
                      CurrencyBox(amount: '50'),
                      SizedBox(width: 18),
                      CurrencyBox(amount: '100'),
                      SizedBox(width: 18),
                      CurrencyBox(amount: '200'),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: const [
                      CurrencyBox(amount: '500'),
                      SizedBox(width: 18),
                      CurrencyBox(amount: '1000'),
                      SizedBox(width: 18),
                      CurrencyBox(amount: '2000'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  MyText(
                    'Phone Number',
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: black2121,
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: InputField3(
                      inputController: data.phoneNumberTextController,
                      hintText: 'Enter phone number',
                      keyBoardType: TextInputType.number,
                      suffixIcon: const Icon(
                        Icons.person_pin_outlined,
                        color: mainBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyText(
                    'Amount',
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: black2121,
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: InputField3(
                      inputController: data.amountToSendTextController,
                      hintText: '${getCurrency()}0.00',
                      keyBoardType: TextInputType.number,
                      suffixIcon: null,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        'Schedule Top up',
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
                          });
                          isSwitched1
                              ? showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.75,
                                        color: ash3,
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 20, right: 20),
                                          decoration: const BoxDecoration(
                                            color: white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                            ),
                                          ),
                                          child: Column(
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
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: black2121,
                                                  ),
                                                  IconButton(
                                                    icon:
                                                        const Icon(Icons.close),
                                                    iconSize: 17,
                                                    color: black_13,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                              const Divider(
                                                height: 2,
                                                thickness: 2,
                                                color: ashColor,
                                              ),
                                              const SizedBox(height: 15),
                                              MyText(
                                                'Select Period',
                                                fontFamily: 'Poppins',
                                                color: black2121,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        pick = 'first';
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      width: 75,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                          width: 2,
                                                          color: pick == 'first'
                                                              ? mainBlue
                                                              : ash2,
                                                        ),
                                                      ),
                                                      child: MyText(
                                                        'Weekly',
                                                        color: mainBlue,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        pick = 'second';
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      width: 75,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                          width: 2,
                                                          color:
                                                              pick == 'second'
                                                                  ? mainBlue
                                                                  : ash2,
                                                        ),
                                                      ),
                                                      child: MyText(
                                                        'Monthly',
                                                        color: mainBlue,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        pick = 'third';
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      width: 75,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                          width: 2,
                                                          color: pick == 'third'
                                                              ? mainBlue
                                                              : ash2,
                                                        ),
                                                      ),
                                                      child: MyText(
                                                        'Quartely',
                                                        color: mainBlue,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        pick = 'fourth';
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      width: 75,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                          width: 2,
                                                          color:
                                                              pick == 'fourth'
                                                                  ? mainBlue
                                                                  : ash2,
                                                        ),
                                                      ),
                                                      child: MyText(
                                                        'Annually',
                                                        color: mainBlue,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              MyText(
                                                'Start Date',
                                                color: black2121,
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              const SizedBox(height: 8),
                                              TextFormField(
                                                controller: data.startDate,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                  ),
                                                  suffixIcon: const Icon(
                                                    Icons
                                                        .calendar_month_outlined,
                                                    color: mainBlue,
                                                  ),
                                                  hintText: '"Choose Date"',
                                                ),
                                                readOnly: true,
                                                onTap: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(2000),
                                                          //DateTime.now() - not to allow to choose before today.
                                                          lastDate:
                                                              DateTime(2101));

                                                  if (pickedDate != null) {
                                                    print(
                                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                    String formattedDate =
                                                        DateFormat('yyyy-MM-dd')
                                                            .format(pickedDate);
                                                    print(
                                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                                    //you can implement different kind of Date Format here according to your requirement

                                                    setState(() {
                                                      data.startDate.text =
                                                          formattedDate; //set output date to TextField value.
                                                    });
                                                  } else {
                                                    print(
                                                        "Date is not selected");
                                                  }
                                                },
                                              ),
                                              const SizedBox(height: 10),
                                              MyText(
                                                'End Date',
                                                color: black2121,
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              TextFormField(
                                                controller: data.endDate,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                  ),
                                                  suffixIcon: Icon(
                                                    Icons
                                                        .calendar_month_outlined,
                                                    color: mainBlue,
                                                  ),
                                                  hintText: '"Choose Date"',
                                                ),
                                                readOnly: true,
                                                onTap: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(2000),
                                                          //DateTime.now() - not to allow to choose before today.
                                                          lastDate:
                                                              DateTime(2101));

                                                  if (pickedDate != null) {
                                                    print(
                                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                    String formattedDate =
                                                        DateFormat('yyyy-MM-dd')
                                                            .format(pickedDate);
                                                    print(
                                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                                    //you can implement different kind of Date Format here according to your requirement

                                                    setState(() {
                                                      data.endDate.text =
                                                          formattedDate; //set output date to TextField value.
                                                    });
                                                  } else {
                                                    print(
                                                        "Date is not selected");
                                                  }
                                                },
                                              ),
                                              const SizedBox(height: 10),
                                              MyButton(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Checkout(),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  height: 54,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: mainBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Center(
                                                    child: MyText(
                                                      'Continue',
                                                      color: white,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                  const SizedBox(height: 45),
                  MyButton(
                    height: 54,
                    width: double.infinity,
                    color: mainBlue,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Checkout()));
                    },
                    child: MyText(
                      'Confirm',
                      color: white,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
