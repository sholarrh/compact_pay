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
  bool _isLoading = false;

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
                    padding: const EdgeInsets.only(top: 31, bottom: 45),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            size: 17,
                            color: white,
                          ),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        MyText(
                          'Change Pin',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ],
                    ),
                  ),
                  MyText('Old Pin',
                      color: white, fontWeight: FontWeight.w400, fontSize: 13),
                  const SizedBox(height: 10),
                  InputField2(
                    hintText: '',
                    validator: validateTransactionPin,
                    keyBoardType: TextInputType.number,
                    hasSuffixIcon: true,
                    inputController: data.oldTransactionPin,
                  ),
                  const SizedBox(height: 25),
                  MyText(
                    'New Pin',
                    color: white,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                  const SizedBox(height: 10),
                  InputField2(
                    hintText: '',
                    validator: validateTransactionPin,
                    keyBoardType: TextInputType.number,
                    hasSuffixIcon: true,
                    inputController: data.newTransactionPin,
                  ),
                  const SizedBox(height: 25),
                  MyText(
                    'Repeat Pin',
                    color: white,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                  const SizedBox(height: 10),
                  InputField2(
                    hintText: '',
                    validator: validateTransactionPin,
                    keyBoardType: TextInputType.number,
                    hasSuffixIcon: true,
                    inputController: data.confirmTransactionPin,
                  ),
                  const SizedBox(height: 80),
                  MyButton(
                    height: 50,
                    width: double.infinity,
                    color: mainBlue,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        _isLoading = true;

                        Duration waitTime = const Duration(seconds: 4);
                        Future.delayed(waitTime, () {
                          _isLoading = false;
                          if (mounted) {
                            setState(() {});
                          }
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PasswordSettings()));
                      }
                    },
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: white,
                            ),
                          )
                        : MyText(
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
