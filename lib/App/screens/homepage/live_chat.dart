import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/provider/provider.dart';
import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/my_text.dart';
import '../../../Core/widgets/text_form_field.dart';

class LiveChat extends StatefulWidget {
  const LiveChat({Key? key}) : super(key: key);

  @override
  State<LiveChat> createState() => _LiveChatState();
}

class _LiveChatState extends State<LiveChat> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 17,
                        color: black2121,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                'Live chat with bot',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: black2121,
                              ),
                              MyText(
                                'Active now',
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                                color: ash4,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Image.asset('assets/images/Ellipse 195 (2).png'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                MyText(
                  '12 DEC 2022 AT 11:59',
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: ash4,
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Image.asset('assets/images/Group 6260.png'),
                    const SizedBox(width: 4),
                    Container(
                      width: 137,
                      height: 30,
                      decoration: BoxDecoration(
                        color: editProfile,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: MyText(
                          'Hi!  How may i help you?',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: black2121,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 500),
                InputField3(
                  border: InputBorder.none,
                  hintText: 'Type Your Message',
                  inputController: data.message,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send_sharp),
                    iconSize: 17,
                    color: mainBlue,
                    onPressed: () {},
                  ),
                  prefixIcon: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: black2121),
                      ),
                    ),
                    child: Icon(
                      Icons.emoji_emotions,
                      color: Colors.yellow,
                    ),
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
