import 'package:compact_pay/screens/add_money/scan_qr/qr_code.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/my_text.dart';
import '../../compact_account/compactpay_account.dart';
import 'bank_account.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
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
                        'Send Money',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: black2121,
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
                  height: 58,
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.account_balance_outlined,
                            color: mainBlue,),
                          const SizedBox(width: 9,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText('To Bank Account',
                                fontSize: 12,
                                fontWeight: FontWeight.w500 ,
                                color: black2121,
                              ),
                              const SizedBox(height: 2,),
                              MyText('Transfer money to any bank for free',
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
                              MaterialPageRoute(builder: (context) => const BankAccount()));
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
                  // width: double.infinity,
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
                            'assets/images/Logo.png',
                            // const Icon(Icons.account_balance_outlined,
                            color: mainBlue,),
                          const SizedBox(width: 9,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText('To CompactPay Account',
                                fontSize: 12,
                                fontWeight: FontWeight.w500 ,
                                color: black2121,
                              ),
                              const SizedBox(height: 2,),
                              MyText('Transfer money to CompactPay accounts for free',
                                fontSize: 9,
                                fontWeight: FontWeight.w500 ,
                                color: const Color(0xff8A8D8F),
                              )
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CompactPayAccount()));
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
                  // width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.qr_code_scanner_outlined,
                            color: mainBlue,),
                          const SizedBox(width: 9,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText('Scan QR Code',
                                fontSize: 12,
                                fontWeight: FontWeight.w500 ,
                                color: black2121,
                              ),
                              const SizedBox(height: 2,),
                              MyText('Transfer to any CompactPay user via scan',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QrCode()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined,
                          color: mainBlue,
                          size: 14,
                        ),
                      ),

                    ],
                  ),
                ),
              ],),),),),);
  }
}
