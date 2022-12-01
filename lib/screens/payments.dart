

import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:flutter/material.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: MyText('Payments'),
      ),
    );
  }
}
