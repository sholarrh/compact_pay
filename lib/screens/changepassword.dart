import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text.dart';
import '../widgets/text_form_field.dart';
import '../widgets/validator.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _Oldpassword = TextEditingController();
  TextEditingController _Newpassword = TextEditingController();
  TextEditingController _Repeatpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: deepBlue1,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        color: white,
                        iconSize: 17,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      MyText(
                        'Change Password',
                        color: white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                MyText('Old Password',
                    color: white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
                SizedBox(height: 8),
                InputField(
                  hintText: '',
                  validator: validateFullName,
                  keyBoardType: TextInputType.name,
                  isPassword: false,
                  hasSuffixIcon: true,
                  inputController: _Oldpassword,
                ),
                SizedBox(height: 25),
                MyText('New Password',
                    color: white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
                SizedBox(height: 8),
                InputField(
                  hintText: '',
                  validator: validateFullName,
                  keyBoardType: TextInputType.name,
                  isPassword: false,
                  hasSuffixIcon: true,
                  inputController: _Newpassword,
                ),
                SizedBox(height: 25),
                MyText('Repeat Password',
                    color: white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
                SizedBox(height: 8),
                InputField(
                  hintText: '',
                  validator: validateFullName,
                  keyBoardType: TextInputType.name,
                  isPassword: false,
                  hasSuffixIcon: true,
                  inputController: _Repeatpassword,
                ),
                SizedBox(height: 80),
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
