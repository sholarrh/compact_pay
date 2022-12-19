// Adigun solafunmi

import 'package:compact_pay/screens/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../utils/app_colors.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text.dart';
import '../widgets/text_form_field.dart';
import '../widgets/validator.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  static const List<String> genderList = <String>[
    'Male',
    'Female',
  ];

  // static const List<String> genderList = <String>['Male', 'Female',];

  String dropdownValue = genderList.first;

  // String dropdownValue1 = 'National Identification Number';
  //
  // String dropdownValue2 = 'National Identification Number';

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
                    'First Name',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: editProfile.withOpacity(0.9),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InputField2(
                  inputController: data.firstNameTextController,
                  hintText: 'Tola',
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateFullName,
                  hasSuffixIcon: false,
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'Middle Name (Optional)',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: editProfile.withOpacity(0.9),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InputField2(
                  inputController: data.middleNameTextController,
                  hintText: 'Babatunde',
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateFullName,
                  hasSuffixIcon: false,
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'Last Name',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: editProfile.withOpacity(0.9),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InputField2(
                  inputController: data.lastNameTextController,
                  hintText: 'Kelechi',
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateFullName,
                  hasSuffixIcon: false,
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
                    color: editProfile.withOpacity(0.9),
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
                  hasSuffixIcon: false,
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'Phone Number',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: editProfile.withOpacity(0.9),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField2(
                  inputController: data.phoneNumberTextController,
                  hintText: '+2348123456789',
                  keyBoardType: TextInputType.emailAddress,
                  validator: validatePhoneNumber,
                  hasSuffixIcon: false,
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    'Address',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: editProfile.withOpacity(0.9),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField2(
                  inputController: data.addressTextController,
                  hintText: '2, Obantoko Rd.  Abeokuta',
                  keyBoardType: TextInputType.name,
                  validator: validateFullName,
                  hasSuffixIcon: false,
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
                    color: editProfile.withOpacity(0.9),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField2(
                  inputController: data.ageTextController,
                  hintText: 'dd/mm/yy',
                  keyBoardType: TextInputType.name,
                  validator: validateFullName,
                  hasSuffixIcon: false,
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
                    color: editProfile.withOpacity(0.9),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField2(
                  inputController: data.genderTextController,
                  hintText: 'Male',
                  keyBoardType: TextInputType.name,
                  validator: validateFullName,
                  hasSuffixIcon: false,
                  // suffixIcon: DropdownButton<String>(
                  //   value: dropdownValue,
                  //   enableFeedback: true,
                  //   dropdownColor: white,
                  //   isExpanded: true,
                  //   iconSize: 30,
                  //   borderRadius: BorderRadius.circular(7),
                  //   iconEnabledColor: black2121.withOpacity(0.9),
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w400,
                  //     color: black2121.withOpacity(0.9),
                  //   ),
                  //   items: genderList.map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: MyText(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       dropdownValue = newValue!;
                  //     });
                  //   },
                  // ),
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
                  hasSuffixIcon: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 100),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()));
                        }
                        //}
                        catch (e, s) {
                          if (kDebugMode) {
                            print(e);
                          }
                          if (kDebugMode) {
                            print(s);
                          }
                        }
                      }
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

