// Adigun solafunmi
import 'dart:io';

import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class CurrencyBox extends StatefulWidget {
  final String amount;

  const CurrencyBox({Key? key, required this.amount}) : super(key: key);

  @override
  State<CurrencyBox> createState() => _CurrencyBoxState();
}

class _CurrencyBoxState extends State<CurrencyBox> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return InkWell(
      onTap: () {
        print('The money sent is ${widget.amount}');
        setState(() {
          data.amountToSendTextController.text == widget.amount;
        });
      },
      child: Container(
        width: 102,
        height: 50,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              '${getCurrency()} ${widget.amount}',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              fontFamily: 'poppins',
              color: black,
            ),
          ],
        ),
      ),
    );
  }
}

String getCurrency() {
  var format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
  return format.currencySymbol;
}
