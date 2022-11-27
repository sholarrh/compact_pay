import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../utils/app_colors.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text.dart';
import '../widgets/text_form_field.dart';
import '../widgets/validator.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({Key? key}) : super(key: key);

  @override
  State<ChangePin> createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: deepBlue1,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        color: white,
                        iconSize: 17,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      MyText(
                        'Change Pin',
                        color: white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                MyText('Old Pin',
                    color: white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
                const SizedBox(height: 8),
                InputField(
                  hintText: '',
                  validator: validateTransactionPin,
                  keyBoardType: TextInputType.number,
                  isPassword: false,
                  hasSuffixIcon: true,
                  inputController: data.oldTransactionPin,
                ),
                const SizedBox(height: 25),
                MyText('New Pin',
                    color: white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
                const SizedBox(height: 8),
                InputField(
                  hintText: '',
                  validator: validateTransactionPin,
                  keyBoardType: TextInputType.number,
                  isPassword: false,
                  hasSuffixIcon: true,
                  inputController: data.newTransactionPin,
                ),
                const SizedBox(height: 25),
                MyText('Repeat Pin',
                    color: white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
                const SizedBox(height: 8),
                InputField(
                  hintText: '',
                  validator: validateTransactionPin,
                  keyBoardType: TextInputType.number,
                  isPassword: false,
                  hasSuffixIcon: true,
                  inputController: data.confirmTransactionPin,
                ),
                const SizedBox(height: 80),
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
                        'Done',
                        color: white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


