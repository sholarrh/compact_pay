import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/my_text.dart';
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
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.account_box,
                            color: mainBlue,
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                'Customer  care',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: black2121,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              MyText(
                                'Contact us via our email address  ',
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff8A8D8F),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CustomerCare()));
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: mainBlue,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.mark_unread_chat_alt_outlined,
                            color: mainBlue,
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                'Live chat',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: black2121,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              MyText(
                                'Chat with us live',
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff8A8D8F),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LiveChat()));
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: mainBlue,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
