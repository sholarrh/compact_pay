import 'package:flutter/material.dart';

import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/my_text.dart';

class CustomerCare extends StatefulWidget {
  const CustomerCare({Key? key}) : super(key: key);

  @override
  State<CustomerCare> createState() => _CustomerCareState();
}

class _CustomerCareState extends State<CustomerCare> {
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
                        padding: const EdgeInsets.only(top: 10, bottom: 40),
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
                              'Customer Care',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: black2121,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: ash5,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/young man in headset using computer.png'),
                            // fit: BoxFit.fill
                          ),
                        ),
                      ),
                      SizedBox(height: 65),
                      Center(
                        child: Column(
                          children: [
                            MyText(
                              'Need help?',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: black2121,
                            ),
                            SizedBox(height: 10),
                            MyText(
                              'You can reach out to us by sending a mail.We would reply as soon as\n'
                              'we receive your complaints. ',
                              textAlign: TextAlign.center,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: black2121,
                            ),
                            SizedBox(height: 16),
                            MyText(
                              'Tap the email address below.',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: black2121,
                            ),
                            SizedBox(height: 46),
                            MyText(
                              'info@compactpay.com',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: mainBlue,
                            ),
                          ],
                        ),
                      ),

                      // CircleAvatar(
                      //   radius: 100,
                      //   backgroundImage: AssetImage('assets/images/young man in headset using computer.png',
                      //   ),
                      //   backgroundColor: Colors.white,
                      //
                      // )
                    ])))));
  }
}
