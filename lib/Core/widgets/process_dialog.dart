import 'package:compact_pay/Core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';
import 'my_text.dart';

class ProgressDialog extends StatelessWidget {
  String message;

  ProgressDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Dialog(
      backgroundColor: white,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(35),
            vertical: getProportionateScreenHeight(20)),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            CircularProgressIndicator(
              strokeWidth: getProportionateScreenWidth(3),
              valueColor: AlwaysStoppedAnimation<Color>(mainBlue),
            ),
            SizedBox(
              width: getProportionateScreenWidth(40),
            ),
            MyText(message,
                fontSize: 16, fontWeight: FontWeight.w400, color: black2121)
          ],
        ),
      ),
    );
  }
}
