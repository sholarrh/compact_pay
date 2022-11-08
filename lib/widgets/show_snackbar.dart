

import 'package:flutter/material.dart';

class ShowSnackBar extends StatefulWidget {
  final String text;
  final int duration;
   const ShowSnackBar({Key? key,
     required this.text,
     required this.duration}) : super(key: key);

  @override
  State<ShowSnackBar> createState() => _ShowSnackBarState();
}

class _ShowSnackBarState extends State<ShowSnackBar> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(widget.text),
        duration: Duration(seconds: widget.duration));
  }
}