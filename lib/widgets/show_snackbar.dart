// Adigun solafunmi

import 'package:compact_pay/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'my_text.dart';


void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: MyText(
        message,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
        textColor: white,
      ),
    ),
  );
}
