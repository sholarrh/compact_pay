import 'package:compact_pay/screens/auth/login.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_button.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import '../../widgets/validator.dart';

// This The Code for the Signup Page
// Juwon's Code
// Compact Pay

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  bool isLoading = false;
  String dropdownValue = '+234';
  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _referralcode = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    color: black,
                    iconSize: 17,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 10),
                  MyText(
                    'Create Account',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: black,
                  ),
                  SizedBox(height: 38),
                  MyText(
                    ' Full Name',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(height: 8),
                  InputField(
                    hintText: 'Enter Full Name',
                    validator: validateFullName,
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: false,
                    inputController: _fullname,
                  ),
                  SizedBox(height: 25),
                  MyText(
                    'Email Address',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(height: 8),
                  InputField(
                    validator: validateEmail,
                    hintText: 'Email Address',
                    keyBoardType: TextInputType.emailAddress,
                    isPassword: false,
                    hasSuffixIcon: false,
                    inputController: _email,
                  ),
                  SizedBox(height: 25),
                  MyText(
                    'Phone Number',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(height: 8),
                  InputField(
                    hintText: '',
                    validator: validatePhoneNumber,
                    keyBoardType: TextInputType.phone,
                    isPassword: false,
                    hasSuffixIcon: false,
                    prefixIcon: DropdownButton<String>(
                      value: dropdownValue,
                      elevation: 16,
                      style: const TextStyle(color: black),
                      items: <String>[
                        '+234',
                        '+218',
                        '+235',
                        '+385',
                        '+30',
                        '+221',
                        '+227',
                        '+44',
                        '+93',
                        '+27',
                        '+33',
                        '+233',
                        '+1229',
                        '+594',
                        '+256',
                        '+263',
                        '+260'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: MyText(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                    inputController: _phonenumber,
                  ),
                  SizedBox(height: 25),
                  MyText(
                    'Password',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(height: 9),
                  InputField(
                    hintText: 'Enter Password',
                    validator: validatePassword,
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: true,
                    inputController: _password,
                  ),
                  SizedBox(height: 25),
                  MyText(
                    'Referral Code (Optional)',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: black,
                    fontFamily: 'Poppins',
                  ),
                  SizedBox(height: 9),
                  InputField(
                    hintText: 'Enter referral code',
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: false,
                    inputController: _referralcode,
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      MyText(
                        'I agree to the ',
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: lightGrey,
                      ),
                      MyText(
                        'Terms of Service',
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: lightMainBlue,
                      ),
                      MyText(
                        '  and',
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: lightGrey,
                      ),
                      MyText(
                        '  Privacy Policy',
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: lightMainBlue,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      }
                    },
                    child: Container(
                      height: 54,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ashColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: isLoading == false
                          ? Center(
                              child: MyText(
                                'Sign Up',
                                color: white,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
