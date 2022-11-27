import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/my_text.dart';

class AddByCashDeposit extends StatefulWidget {
  const AddByCashDeposit({Key? key}) : super(key: key);

  @override
  State<AddByCashDeposit> createState() => _AddByCashDepositState();
}

class _AddByCashDepositState extends State<AddByCashDeposit> {
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
                padding: const EdgeInsets.only(top: 10, bottom: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      iconSize: 12,
                      color: close,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    MyText(
                      'Add By Cash Deposit',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                  ],
                ),
              ),
              MyText(
                'Deposit money into your CompactPay account for free at any POS terminals near you.',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: black2121,
              ),
              Container(
                height: 92,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(vertical: 17),
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        'CompactPay Account Number',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: black2121,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              '210 310 9448',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              fontFamily: 'poppins',
                              color: black2121,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Icons.copy_sharp,
                              size: 18,
                              color: mainBlue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24, top: 1),
                child: Image.asset('assets/images/ussd image.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 12,
                ),
                child: Image.asset('assets/images/addByCashDeposit 1.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Image.asset('assets/images/addByCashDeposit 2.png'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
