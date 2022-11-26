import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/my_text.dart';
import 'enter_amount.dart';

class QrCode extends StatefulWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      iconSize: 14,
                      color: white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    MyText(
                      'My QR Code',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: white,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 362,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      'Pay me via scan',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: black2121,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32, top: 23),
                      child: Image.asset('assets/images/qr code.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EnterAmount()));
                          },
                          child: MyText(
                            'Enter Amount',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: mainBlue,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const VerticalDivider(
                          width: 2,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        MyText(
                          'Save QR Code',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: mainBlue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
