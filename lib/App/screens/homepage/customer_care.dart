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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 60),
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
                        'Customer care',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: black2121,
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/images/service.png'),
                SizedBox(height: 65),
                MyText(
                  'Need help?',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: black2121,
                ),
                SizedBox(height: 15),
                MyText(
                  'You can reach out to us by sending a mail. We would reply as soon as\n we receive your complaints',
                  textAlign: TextAlign.center,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: black2121,
                ),
                SizedBox(height: 20),
                MyText(
                  'Tap the email address below.',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
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
        ),
      ),
    );
  }
}
