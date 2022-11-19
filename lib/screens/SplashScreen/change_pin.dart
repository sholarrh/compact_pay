import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
import '../../widgets/text_form_field.dart';
import '../settings.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({Key? key}) : super(key: key);

  @override
  State<ChangePin> createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {



  bool isLoading = false;
  TextEditingController _Oldpin = TextEditingController();
  TextEditingController _Newpin = TextEditingController();
  TextEditingController _Repeatpin = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: deepBlue1,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
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
                  SizedBox(height: 8),
                  InputField(
                    hintText: '',
                    // validator: validatePin,
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: true,
                    inputController: _Oldpin,
                  ),
                  SizedBox(height: 25),
                  MyText('New Pin',
                      color: white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                  SizedBox(height: 8),
                  InputField(
                    hintText: '',
                    // validator: validatePin,
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: true,
                    inputController: _Newpin,
                  ),
                  SizedBox(height: 25),
                  MyText('Repeat Pin',
                      color: white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 13),
                  SizedBox(height: 8),
                  InputField(
                    hintText: '',
                    // validator: validatePin,
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: true,
                    inputController: _Repeatpin,
                  ),
                  SizedBox(height: 80),
                  MyButton(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        Future.delayed(Duration(seconds: 10))
                            .then((value) async {
                          isLoading = false;
                          setState(() {});
                        });
                      }
                    },
                    child: Container(
                      height: 54,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: mainBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: GestureDetector(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
                        },
                          child: MyText(
                            'Done',
                            color: white,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


