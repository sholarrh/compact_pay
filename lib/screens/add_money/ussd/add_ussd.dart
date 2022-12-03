//ADIGUN SOLAFUNMI

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/my_text.dart';

class AddUssd extends StatefulWidget {
  const AddUssd({Key? key}) : super(key: key);

  @override
  State<AddUssd> createState() => _AddUssdState();
}

class _AddUssdState extends State<AddUssd> {
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
                      'Add Ussd',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
