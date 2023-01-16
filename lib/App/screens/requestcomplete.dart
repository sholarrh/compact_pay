import 'package:flutter/material.dart';

import '../../Core/utils/app_colors.dart';
import '../../Core/widgets/my_button.dart';
import '../../Core/widgets/my_text.dart';

class RequestComplete extends StatefulWidget {
  const RequestComplete({Key? key}) : super(key: key);

  @override
  State<RequestComplete> createState() => _RequestCompleteState();
}

class _RequestCompleteState extends State<RequestComplete> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    iconSize: 17,
                    color: black_13,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 57),
              Image.asset('assets/images/Ellipse 191.png'),
              SizedBox(height: 100),
              MyText(
                'Transfer Successful',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: black2121,
              ),
              SizedBox(height: 19),
              MyText(
                'N 1,000.00',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: black_14,
              ),
              SizedBox(height: 61),
              MyButton(
                child: Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mainBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: MyText(
                      'View Receipt',
                      color: white,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              MyText(
                'Go to Homepage',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: mainBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
