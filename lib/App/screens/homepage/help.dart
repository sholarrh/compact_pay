import 'package:flutter/material.dart';

import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/container_widget.dart';
import '../../../Core/widgets/my_text.dart';
import 'customer_care.dart';
import 'live_chat.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 17,
                        color: white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      MyText(
                        'Help',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ],
                  ),
                ),
                const ContainerWidget(
                  title: 'Customer  care',
                  subtitle: 'Contact us via our email address',
                  screen: CustomerCare(),
                  icon: Icons.person_pin_outlined,
                ),
                const ContainerWidget(
                  title: 'Live chat',
                  subtitle: 'Chat with us live',
                  screen: LiveChat(),
                  icon: Icons.chat_bubble_outline_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
