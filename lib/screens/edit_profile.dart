

import 'package:compact_pay/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../utils/app_colors.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text.dart';
import '../widgets/show_snackbar.dart';
import '../widgets/text_form_field.dart';
import '../widgets/validator.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: darkBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 17,
                        onPressed: () {
                          Navigator.pop(context);
                        },),
                      SizedBox(width: 30,),
                      MyText('Edit Profile',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'Full Name',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: black,
                  ),
                ),

                const SizedBox(height: 20,),

                InputField(
                  inputController: data.emailTextController,
                  isPassword: false,
                  hintText: 'Babatunde Samson',
                  hasSuffixIcon: false,
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateEmail,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'Email Address',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: black,
                  ),
                ),

                const SizedBox(height: 20,),

                InputField(
                  inputController: data.emailTextController,
                  isPassword: false,
                  hintText: 'babatundesamson@gmail.com',
                  hasSuffixIcon: false,
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateEmail,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'Date of Birth',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: black,
                  ),
                ),

                const SizedBox(height: 20,),

                InputField(
                  inputController: data.emailTextController,
                  isPassword: false,
                  hintText: 'dd/mm/yy',
                  hasSuffixIcon: false,
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateEmail,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'Gender',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: black,
                  ),
                ),

                const SizedBox(height: 20,),

                InputField(
                  inputController: data.emailTextController,
                  isPassword: false,
                  hintText: 'Male',
                  hasSuffixIcon: false,
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateEmail,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'BVN',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: black,
                  ),
                ),

                const SizedBox(height: 20,),

                InputField(
                  inputController: data.emailTextController,
                  isPassword: false,
                  hintText: '22123333333',
                  hasSuffixIcon: false,
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateEmail,),

                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: MyButton(
                    height: 50,
                    width: double.infinity,
                    color: mainBlue,
                    onTap: () async {
                      if (data.formkey.currentState!.validate()) {
                        data.isLoading = true;
                        setState(() {});
                        data.delay(4);
                        try {

                          //if (await data.myAuth.sendOTP() == true) {
                            const ShowSnackBar(
                              text: "OTP has been sent",
                              duration: 5,
                            );
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>  const Profile()));
                          }
                        //}
                        catch(e,s){
                          print(e);
                          print(s);
                        }
                      }
                      // else{
                      //   const ShowSnackBar(
                      //     text: "There is an error",
                      //     duration: 5,
                      //   );
                      // }
                    },
                    child: data.isLoading == false ? MyText(
                      'Done',
                      color: white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,)
                        : const Center(
                          child: CircularProgressIndicator(
                            color: mainBlue,
                          ),
                    ),
                  ),
                ),

              ],

            ),
          ),

        ),
      ),
    );
  }
}
