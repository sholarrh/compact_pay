import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/my_text.dart';
import '../../widgets/text_form_field.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  TextEditingController _phonenumber = TextEditingController();

  bool isSwitched1 = false;
  String selected = "first";
  String select = "first";
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Form(
                    key: formkey,
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
                                    color: close,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  MyText(
                                    'Airtime Top up',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: black2121,
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.access_time,
                                    color: mainBlue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  MyText(
                                    'History',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: black2121,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 18),
                            Padding(
                              padding: const EdgeInsets.only(right: 270.0),
                              child: MyText(
                                'Phone Number',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: black2121,
                              ),
                            ),
                            SizedBox(height: 6),
                            Padding(
                              padding: const EdgeInsets.only(right: 22),
                              child: InputField3(
                                inputController: _phonenumber,
                                hintText: 'Enter phone number',
                                keyBoardType: TextInputType.number,
                                suffixIcon: Icon(
                                  Icons.person_pin_outlined,
                                  color: mainBlue,
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            MyText(
                              'Select Network Provider',
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: black2121,
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected = 'first';
                                    });
                                  },
                                  child: Container(
                                    height: 75,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color:
                                            selected == 'first' ? black : white,
                                      ),
                                    ),
                                    child: Image.asset(
                                        'assets/images/mtnLogo.png'),
                                  ),
                                ),
                                SizedBox(width: 15),
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
                                          color: selected == 'second'
                                              ? black
                                              : white,
                                        ),
                                      ),
                                      child: Image.asset(
                                          'assets/images/gloLogo.png')),
                                ),
                                SizedBox(width: 15),
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
                                          color: selected == 'third'
                                              ? black
                                              : white,
                                        ),
                                      ),
                                      child: Image.asset(
                                          'assets/images/airtelLogo.png')),
                                ),
                                SizedBox(width: 15),
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
                                          color: selected == 'fourth'
                                              ? black
                                              : white,
                                        ),
                                      ),
                                      child: Image.asset(
                                          'assets/images/9mobileLogo.png')),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      select = 'first';
                                    });
                                  },
                                  child: MyText(
                                    'Hot Deals',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: select == 'first' ? deepBlue : ash2,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      select = 'second';
                                    });
                                  },
                                  child: MyText(
                                    'Daily',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: select == 'second' ? deepBlue : ash2,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      select = 'third';
                                    });
                                  },
                                  child: MyText(
                                    'Weekly',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: select == 'third' ? deepBlue : ash2,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      select = 'fouth';
                                    });
                                  },
                                  child: MyText(
                                    'Monthly',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: select == 'fouth' ? deepBlue : ash2,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      select = 'fifth';
                                    });
                                  },
                                  child: MyText(
                                    '2-Months',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: select == 'fifth' ? deepBlue : ash2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 103,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      width: 2,
                                      color: ash2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Column(
                                        children: [
                                          MyText(
                                            '100MB',
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            '1 Day',
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            'N100',
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: close,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 103,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      width: 2,
                                      color: ash2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Column(
                                        children: [
                                          MyText(
                                            '200MB',
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            '3 Days',
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            'N200',
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: close,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 103,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      width: 2,
                                      color: ash2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Column(
                                        children: [
                                          MyText(
                                            '1GB',
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            '1 Day',
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            'N300',
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: close,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(height: 10),
                            Row(children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 103,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      width: 2,
                                      color: ash2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Column(
                                        children: [
                                          MyText(
                                            '2.5GB',
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            '1 Day',
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            'N500',
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: close,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 103,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      width: 2,
                                      color: ash2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Column(
                                        children: [
                                          MyText(
                                            '1GB',
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            '7 Days',
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            'N500',
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: close,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 103,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      width: 2,
                                      color: ash2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Column(
                                        children: [
                                          MyText(
                                            '1.5GB',
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            '30 Days',
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            'N1000',
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: close,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(height: 3),
                            Row(children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 103,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      width: 2,
                                      color: ash2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Column(
                                        children: [
                                          MyText(
                                            '100MB',
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            '7 Days',
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            'N500',
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: close,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 103,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      width: 2,
                                      color: ash2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Column(
                                        children: [
                                          MyText(
                                            '1.47GB',
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            '7 Days',
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            'N500',
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: close,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 103,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      width: 2,
                                      color: ash2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Column(
                                        children: [
                                          MyText(
                                            '30GB',
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            '7 Days',
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: close,
                                          ),
                                          SizedBox(height: 3),
                                          MyText(
                                            'N5000',
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: close,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(right: 230.0),
                              child: MyText(
                                'Mobile Data Service',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: black2121,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.only(
                                  top: 12, bottom: 12, left: 12),
                              height: 58,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/ussdlogo.png',
                                        // const Icon(Icons.account_balance_outlined,
                                        color: mainBlue,
                                      ),
                                      const SizedBox(
                                        width: 9,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            'USSD Enquiry',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: black2121,
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          MyText(
                                            'Check balance and more',
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff8A8D8F),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) => const USSDEnquiry()));
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: mainBlue,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    )))));
  }
}


