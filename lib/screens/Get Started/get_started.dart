
// This is the get started page


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
import '../Pages/Login Page/login.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/getstarted.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  child:  MyButton(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginPage())),
                      height: 56,
                      color: mainBlue,
                      borderRadius: 10,
                      boxShadow: [
                        BoxShadow(
                            color: orange.withOpacity(.25),
                            offset: Offset(
                              0,
                              17,
                            ),
                            spreadRadius: 1,
                            blurRadius: 21)
                      ],
                      child: MyText(
                        'Log In',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: white,
                      )),
                        ),
              ],
            )));
  }}