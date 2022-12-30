// Adigun solafunmi

import 'package:compact_pay/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'my_text.dart';

// class ShowSnackBar extends StatefulWidget {
//   final String text;
//   final int duration;
//    const ShowSnackBar({Key? key,
//      required this.text,
//      required this.duration}) : super(key: key);
//
//   @override
//   State<ShowSnackBar> createState() => _ShowSnackBarState();
// }
//
// class _ShowSnackBarState extends State<ShowSnackBar> {
//   @override
//   Widget build(BuildContext context) {
//     return SnackBar(content: Text(widget.text),
//         duration: Duration(seconds: widget.duration));
//   }
// }

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
