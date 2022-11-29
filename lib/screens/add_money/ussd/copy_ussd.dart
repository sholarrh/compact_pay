//ADIGUN SOLAFUNMI

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class CopyUssd extends StatefulWidget {
  const CopyUssd({Key? key}) : super(key: key);

  @override
  State<CopyUssd> createState() => _CopyUssdState();
}

class _CopyUssdState extends State<CopyUssd> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(),
        ),
      ),
    );
  }
}
