// Adigun solafunmi

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
  String dropdownValue = 'Male';

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

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
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 17,
                        color: white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      MyText(
                        'Edit Profile',
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
                    color: white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField2(
                  inputController: data.fullNameTextController,
                  hintText: 'Babatunde Samson',
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateEmail,
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'Email Address',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField2(
                  inputController: data.emailTextController,
                  hintText: 'babatundesamson@gmail.com',
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateEmail,
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'Date of Birth',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField2(
                  inputController: data.ageTextController,
                  hintText: 'dd/mm/yy',
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateEmail,
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'Gender',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField2(
                  inputController: data.genderTextController,
                  hintText: 'Male',
                  keyBoardType: TextInputType.name,
                  validator: validateEmail,
                  suffixIcon: DropdownButton<String>(
                    value: dropdownValue,
                    elevation: 16,
                    style: const TextStyle(color: white),
                    items: <String>[
                      'Male',
                      'Female',
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
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'BVN',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField2(
                  inputController: data.bvnTextController,
                  hintText: '22123333333',
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateEmail,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: MyButton(
                    height: 50,
                    width: double.infinity,
                    color: mainBlue,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        data.isLoading = true;
                        setState(() {});
                        data.delay(4);
                        try {
                          //if (await data.myAuth.sendOTP() == true) {
                          const ShowSnackBar(
                            text: "OTP has been sent",
                            duration: 5,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()));
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

