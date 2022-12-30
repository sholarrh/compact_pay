import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/container_widget.dart';
import '../../widgets/my_text.dart';
import '../Send Money/Send Money/send_money.dart';
import '../add_money/add_money.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 31, bottom: 30),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 17,
                        color: close,
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    MyText(
                      'Wallet',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                  ],
                ),
              ),
              const ContainerWidget(
                title: 'Add Money',
                subtitle: 'Add money to your CompactPay Account',
                screen: AddMoney(),
                icon: Icons.wallet_sharp,
              ),
              const ContainerWidget(
                title: 'Send Money',
                subtitle: 'Send money from your CompactPay account to others',
                screen: SendMoney(),
                icon: Icons.wallet_sharp,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
