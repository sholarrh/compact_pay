import 'package:compact_pay/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/my_text.dart';

class TransferSuccessful extends StatelessWidget {
  const TransferSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
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
                                    const SizedBox(height: 130),
                                    MyText(
                                      'Transfer Successful',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: black2121,
                                    ),
                                    const SizedBox(height: 16),
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
                                            data.amountToSendTextController
                                                .text,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: black2121,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 60),
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
                                    const SizedBox(height: 24),
                                    InkWell(
                                      onTap: () {
                                        data.amountToSendTextController.clear();
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const BottomNav()),
                                                (route) => false);
                                      },
                                      child: MyText(
                                        'Go to Homepage',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: mainBlue,
                                      ),
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
