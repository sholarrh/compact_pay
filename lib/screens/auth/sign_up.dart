import 'package:compact_pay/screens/auth/login.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_button.dart';
import 'package:compact_pay/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

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

  final formkey = GlobalKey<FormState>();

  String? validateFullName(String? formFullName) {
    if (formFullName == null || formFullName.isEmpty)
      return 'Full Name is required.';

    return null;
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'E-mail address is required.';
    }

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

    return null;
  }

  String? validatePhoneNumber(String? formPhoneNumber) {
    if (formPhoneNumber == null || formPhoneNumber.isEmpty)
      return 'PhoneNumber is required.';

    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'Password is required.';
    }

    return null;
  }

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
                  Icon(Icons.cancel_outlined),
                  SizedBox(height: 10),
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: black,
                    ),
                  ),
                  SizedBox(height: 38),
                  Text(
                    ' Full Name',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: black,
                      fontFamily: 'Poppins',
                    ),
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
                  Text(
                    'Email Address',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 8),
                  InputField(
                    validator: validateEmail,
                    hintText: 'Email Address',
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: false,
                    inputController: _email,
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: black,
                      fontFamily: 'Poppins',
                    ),
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
                        '+25',
                        '+225',
                        '+230',
                        '+1',
                        '+226',
                        '+227',
                        '+220',
                        '+12',
                        '+1229',
                        '+237',
                        '+238',
                        '+19',
                        '+266'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
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
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: black,
                      fontFamily: 'Poppins',
                    ),
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
                  Text(
                    'Referral Code (Optional)',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 9),
                  InputField(
                    hintText: 'Enter referral code',
                    keyBoardType: TextInputType.name,
                    isPassword: false,
                    hasSuffixIcon: false,
                    inputController: _password,
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
                      Text(
                        'I agree to the ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color: lightGrey,
                        ),
                      ),
                      Text(
                        'Terms of Service',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: lightMainBlue,
                        ),
                      ),
                      Text(
                        '  and',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          color: lightGrey,
                        ),
                      ),
                      Text(
                        '  Privacy Policy',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: lightMainBlue,
                        ),
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
                        width: 335,
                        decoration: BoxDecoration(
                          color: ashColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: isLoading == false
                            ? Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
