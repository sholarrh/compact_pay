// Adigun solafunmi
import 'package:compact_pay/App/screens/auth/set_transaction_pin.dart';
import 'package:compact_pay/App/screens/auth/sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/size_config.dart';
import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/my_button.dart';
import '../../../Core/widgets/my_text.dart';
import '../../../Core/widgets/process_dialog.dart';
import '../../../Core/widgets/show_snackbar.dart';
import '../../../Core/widgets/text_form_field.dart';
import '../../../Core/widgets/validator.dart';
import '../../models/signup_model/signup_model.dart';
import '../../services/login_service.dart';
import 'forgot_password.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // bool _loginIsLoading = false;
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  List<bool> _validate = [false, false];

  void _updateFormFieldsFilled(String val, int index) {
    if (val.isEmpty) {
      _validate.isNotEmpty ? _validate.removeAt(index) : null;
      _validate.insert(index, false);
      setState(() {});
    } else {
      //if (validate[index])
      _validate.isNotEmpty ? _validate.removeAt(index) : null;
      _validate.insert(index, true);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // var data = Provider.of<ProviderClass>(context);
    SizeConfig.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
              top: getProportionateScreenHeight(22.73),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: black2121,
                      size: 17,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15.79),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(28)),
                    child: MyText(
                      'Login',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: black2121,
                      // fontFamily: 'Poppins',
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            'Email Address',
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: black,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        InputField(
                          inputController: _emailTextController,
                          isPassword: false,
                          hintText: 'Enter Email Address',
                          hasSuffixIcon: false,
                          keyBoardType: TextInputType.emailAddress,
                          validator: validateEmail,
                          onChanged: (value) {
                            _updateFormFieldsFilled(value, 0);
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(25),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            'Password',
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: black,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        InputField(
                          inputController: _passwordTextController,
                          isPassword: true,
                          hintText: 'Enter Password',
                          hasSuffixIcon: true,
                          keyBoardType: TextInputType.text,
                          validator: validatePassword,
                          onChanged: (value) {
                            _updateFormFieldsFilled(value, 1);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: getProportionateScreenHeight(20)),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPassword()));
                        },
                        child: MyText(
                          'Forgot Password?',
                          color: mainBlue,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: getProportionateScreenHeight(20)),
                    child: MyButton(
                      height: 54,
                      width: double.infinity,
                      color: _validate.contains(false) ? unValidated : mainBlue,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await _signInUser();
                        } else {
                          showSnackBar(context, black2121,
                              'Please fill the forms correctly');
                        }
                      },
                      child: //_loginIsLoading == false
                          MyText(
                        'Log In',
                        color: white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getProportionateScreenHeight(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText('Don\'t have an Account ? ',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color(0xff212121)),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: MyText(
                            'Sign Up',
                            color: mainBlue,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Future<void> _signInUser() async {
    SignUpModel newLogin = SignUpModel(
      email: _emailTextController.text,
      password: _passwordTextController.text,
    );
    showDialog(
        context: context,
        builder: (BuildContext context) => ProgressDialog(
              message: 'please wait.....',
            ));

    var response = await LoginService.loginUser(newLogin);
    Navigator.pop(context);

    if (response!.message.toString() == 'user logged in successfully') {
      final storage = await SharedPreferences.getInstance();
      storage.setInt('initScreen', 1);
      storage.setString('email', _emailTextController.text);
      storage.setString('token', response.token!);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SetTransactionPin()),
      );
    } else {
      showSnackBar(
          context, black2121, 'There is an error, Please try again later');
    }
    //}
  }
}
