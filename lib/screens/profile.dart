// Adigun solafunmi

import 'package:compact_pay/screens/edit_profile.dart';
import 'package:compact_pay/screens/settings.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../widgets/container_widget.dart';
import '../widgets/my_text.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
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
                          color: white,
                          iconSize: 17,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  data.profilePicture != null
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(data.profilePicture!),
                        )
                      : CircleAvatar(
                          radius: 40,
                          backgroundColor: const Color(0xffD9D9D9),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: const Color(0xff292D32).withOpacity(0.4),
                            size: 40,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 16),
                    child: MyText(
                      'Tola Kelechi',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 88,
                      height: 30,
                      margin: const EdgeInsets.only(bottom: 36),
                      decoration: BoxDecoration(
                        color: mainBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: MyText(
                          'Edit picture',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                  const ContainerWidget(
                    title: 'Profile',
                    subtitle: 'View and edit your profile',
                    screen: EditProfile(),
                    icon: Icons.person,
                  ),
                  const ContainerWidget(
                    title: 'Settings',
                    subtitle: 'Security settings and notification settings',
                    screen: Settings(),
                    icon: Icons.settings,
                  ),
                  const ContainerWidget(
                    title: 'Help',
                    subtitle: 'Customer care and FAQs',
                    screen: EditProfile(),
                    icon: Icons.help,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.logout_outlined,
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
