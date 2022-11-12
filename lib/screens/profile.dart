

import 'package:compact_pay/screens/edit_profile.dart';
import 'package:compact_pay/screens/settings.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/my_text.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
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
                      ],
                    ),
                  ),

                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profileImage.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 16),
                    child: MyText('Tola Kelechi',
                      fontSize: 20,
                      fontWeight: FontWeight.w500 ,
                      color: white,
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 12.0),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Row(
                          children: [
                            const Icon(Icons.person,
                            color: mainBlue,),
                            const SizedBox(width: 9,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText('Profile',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500 ,
                                  color: black2121,
                                ),
                                const SizedBox(height: 2,),
                                MyText('View and edit your profile',
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500 ,
                                  color: const Color(0xff8A8D8F),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const Settings()));
                          },
                          icon: const Icon(Icons.arrow_forward_ios_outlined,
                            color: mainBlue,
                          size: 14,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 12.0),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Row(
                          children: [
                            const Icon(Icons.settings,
                              color: mainBlue,),
                            const SizedBox(width: 9,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText('Setings',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500 ,
                                  color: black2121,
                                ),
                                const SizedBox(height: 2,),
                                MyText('security settings and notification settings',
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500 ,
                                  color: Color(0xff8A8D8F),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const EditProfile()));
                          },
                          icon: const Icon(Icons.arrow_forward_ios_outlined,
                            color: mainBlue,
                            size: 14,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 12.0),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Row(
                          children: [
                            const Icon(Icons.help,
                              color: mainBlue,),
                            const SizedBox(width: 9,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText('Help',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500 ,
                                  color: black2121,
                                ),
                                const SizedBox(height: 2,),
                                MyText('Customare care and FAQs',
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500 ,
                                  color: Color(0xff8A8D8F),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const EditProfile()));
                          },
                          icon: const Icon(Icons.arrow_forward_ios_outlined,
                            color: mainBlue,
                            size: 14,
                          ),
                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: GestureDetector(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           const Icon(Icons.logout_outlined,
                            color: white,),
                          const SizedBox(width: 10,),
                          MyText('Log out',
                            fontSize: 16,
                            fontWeight: FontWeight.w400 ,
                            color: white,
                          ),
                        ],
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
