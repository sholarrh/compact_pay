import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/my_text.dart';

class TransferSuccessful extends StatelessWidget {
  const TransferSuccessful({Key? key}) : super(key: key);

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
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.close),
                                iconSize: 17,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(height: 57.9),
                              Center(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/marklogo.png',
                                      height: 100,
                                      width: 100,
                                    ),
                                    SizedBox(height: 130),
                                    MyText(
                                      'Transfer Successful',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: black2121,
                                    ),
                                    SizedBox(height: 16),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 120.0),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/nigeria-naira-currency-symbol 1.png',
                                            height: 24,
                                            width: 24,
                                          ),
                                          MyText(
                                            '1000.00',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: black2121,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 60),
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
                                            'View Receipt',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    MyText(
                                      'Go to Homepage',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: black2121,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ])))));
  }
}
