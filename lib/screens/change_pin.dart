import 'package:compact_pay/screens/passwordsettings.dart';
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
  bool isLoading = false;
  final TextEditingController _oldPin = TextEditingController();
  final TextEditingController _newPin = TextEditingController();
  final TextEditingController _repeatPin = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: deepBlue1,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                    inputController: _oldPin,
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
                    inputController: _newPin,
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
                    inputController: _repeatPin,
                  ),
                  const SizedBox(height: 80),
                  MyButton(
                    height: 50,
                    width: double.infinity,
                    color: mainBlue,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        data.isLoading = true;

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const PasswordSettings()));
                      }
                    },
                    child: MyText(
                      'Done',
                      color: white,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      ), );
  }
}