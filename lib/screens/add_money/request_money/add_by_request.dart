//ADIGUN SOLAFUNMI

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/my_text.dart';

class AddByRequest extends StatefulWidget {
  const AddByRequest({Key? key}) : super(key: key);

  @override
  State<AddByRequest> createState() => _AddByRequestState();
}

class _AddByRequestState extends State<AddByRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 6),
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
                      'Add By Request',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 10),
                child: Image.asset('assets/images/ussd image.png'),
              ),

              // add a search container
              MyText(
                'Saved Recipients',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: black2121,
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 13, top: 5),
                child: Image.asset('assets/images/choose recipient.png'),
              ),

              MyText(
                'Choose recipient',
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: black2121,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
