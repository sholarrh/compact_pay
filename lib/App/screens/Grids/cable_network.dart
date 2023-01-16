import 'package:flutter/material.dart';

import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/my_text.dart';

class CableNetwork extends StatefulWidget {
  const CableNetwork({Key? key}) : super(key: key);

  @override
  State<CableNetwork> createState() => _CableNetworkState();
}

class _CableNetworkState extends State<CableNetwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
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
                      'Cable Network',
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
