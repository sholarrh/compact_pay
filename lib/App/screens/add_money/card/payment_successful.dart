// ADIGUN SOLAFUNMI

import 'package:flutter/material.dart';

import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widgets/bottom_nav.dart';
import '../../../../Core/widgets/my_text.dart';

class PaymentSuccessful extends StatefulWidget {
  const PaymentSuccessful({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessful> createState() => _PaymentSuccessfulState();
}

class _PaymentSuccessfulState extends State<PaymentSuccessful> {
  @override
  Widget build(BuildContext context) {
    // var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: backWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 128, right: 340),
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      iconSize: 12,
                      color: close,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                    backgroundImage: AssetImage('assets/images/confirm.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 46),
                    child: MyText(
                      'Payment Successful',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const BottomNav()),
                          (route) => false);
                    },
                    child: MyText(
                      'Go to Homepage',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: mainBlue,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
