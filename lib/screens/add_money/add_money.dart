import 'package:compact_pay/screens/add_money/ussd/add_by_ussd.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/container_widget.dart';
import '../../widgets/my_text.dart';
import '../send_money/send_money.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({Key? key}) : super(key: key);

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backWhite,
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
                      'Add Money',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                  ],
                ),
              ),
              const ContainerWidget(
                title: 'USSD',
                subtitle: 'Add money with other bank’s USSD code',
                screen: AddByUssd(),
                icon: Icons.h_mobiledata_outlined,
              ),
              const ContainerWidget(
                title: 'Bank Transfer',
                subtitle: 'Add money from bank app or internet banking',
                screen: SendMoney(),
                icon: Icons.house,
              ),
              const ContainerWidget(
                title: 'Card',
                subtitle: 'Add money with a debit card',
                screen: SendMoney(),
                icon: Icons.wallet,
              ),
              const ContainerWidget(
                title: 'Cash deposit',
                subtitle: 'Fund your account with nearby merchants',
                screen: SendMoney(),
                icon: Icons.account_balance_wallet,
              ),
              const ContainerWidget(
                title: 'Request Money',
                subtitle: 'Send a request to any CompactPay user',
                screen: SendMoney(),
                icon: Icons.account_balance_wallet_outlined,
              ),
              const ContainerWidget(
                title: 'Scan my QR Code',
                subtitle: 'Show QR code to any CompactPay user',
                screen: SendMoney(),
                icon: Icons.qr_code,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
