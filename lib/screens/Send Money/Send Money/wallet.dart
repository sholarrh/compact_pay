import 'package:compact_pay/screens/Send%20Money/Send%20Money/send_money.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/my_text.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
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
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 17,
                        color: black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 50,),
                      MyText(
                        'Wallet',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: black,
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
                  height: 58,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/addmoney.png',
                            // const Icon(Icons.account_balance_outlined,
                            color: mainBlue,),
                          const SizedBox(width: 9,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText('Add Money',
                                fontSize: 12,
                                fontWeight: FontWeight.w500 ,
                                color: black2121,
                              ),
                              const SizedBox(height: 2,),
                              MyText('Add money to your CompactPay Account',
                                fontSize: 9,
                                fontWeight: FontWeight.w500 ,
                                color: const Color(0xff8A8D8F),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => const EditProfile()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined,
                          color: mainBlue,
                          size: 14,
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
                  height: 58,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/sendmoney.png',
                            // const Icon(Icons.account_balance_outlined,
                            color: mainBlue,),
                          const SizedBox(width: 9,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText('Send Money',
                                fontSize: 12,
                                fontWeight: FontWeight.w500 ,
                                color: black2121,
                              ),
                              const SizedBox(height: 2,),
                              MyText('Send money from your CompactPay account to others',
                                fontSize: 9,
                                fontWeight: FontWeight.w500 ,
                                color: const Color(0xff8A8D8F),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const SendMoney()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined,
                          color: mainBlue,
                          size: 14,
                        ),
                      ),

                    ],
                  ),
                ),
    ]
    ),
    ),
    )));


  }
}
