import 'package:flutter/material.dart';

import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/my_button.dart';
import '../../../Core/widgets/my_text.dart';

class PaymentsSuccessful extends StatefulWidget {
  const PaymentsSuccessful({Key? key}) : super(key: key);

  @override
  State<PaymentsSuccessful> createState() => _PaymentsSuccessfulState();
}

class _PaymentsSuccessfulState extends State<PaymentsSuccessful> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
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
              const SizedBox(height: 57),
              Image.asset('assets/images/Ellipse 191.png'),
              const SizedBox(height: 30),
              MyText(
                'Payment Successful',
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: black2121,
              ),
              const SizedBox(height: 60),
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
              const SizedBox(height: 24),
              MyText(
                'Go to Homepage',
                color: mainBlue,
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
