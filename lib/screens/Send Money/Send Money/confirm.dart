import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/my_text.dart';

class Confirm extends StatefulWidget {
  const Confirm({Key? key}) : super(key: key);

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 51,
                        ),
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
                              'Confirm',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: black2121,
                            ),
                          ],
                        ),
                      ),
                      MyText(
                        'To',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: black2121,
                      ),
                      SizedBox(height: 10),
                      MyText(
                        'TUNDE FEMI MARK',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: black2121,
                      ),
                      SizedBox(height: 10),
                      MyText(
                        'N 1,000',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: black2121,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 12, left: 16, right: 16),
                          width: double.infinity,
                          height: 121,
                          decoration: BoxDecoration(
                            color: lightGrey2,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    'From:',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MyText(
                                        '0122342133',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: black2121,
                                      ),
                                      const SizedBox(
                                        width: 4.4,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      MyText(
                                        'Beneficiary Bank:',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black87,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100.0),
                                    child: Image.asset(
                                      'assets/images/gtblogo.jpg',
                                      height: 14.6,
                                      width: 14.6,
                                    ),
                                  ),
                                  MyText(
                                    'Guaranty Trust Bank',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // MyText('N',
                                      //   fontSize: 36,
                                      //   fontWeight: FontWeight.w700 ,
                                      //   color: white,
                                      // ),
                                      MyText(
                                        'Description:',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87,
                                      ),
                                    ],
                                  ),
                                  MyText(
                                    'Shoe',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 324),
                      Container(
                        width: double.infinity,
                        height: 54,
                        decoration: BoxDecoration(
                          color: mainBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: InkWell(
                            // // onTap: () {
                            // //   // Navigator.push(
                            // //   //   context,
                            // //   //   MaterialPageRoute(
                            // //   //       builder: (context) => const Login()),
                            // //   );
                            // },
                            child: MyText(
                              'Confirm',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ])))));
  }
}
