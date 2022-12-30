// Adigun solafunmi

import 'package:compact_pay/screens/edit_profile.dart';
import 'package:compact_pay/screens/settings.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../widgets/container_widget.dart';
import '../widgets/my_text.dart';
import 'Help/help.dart';
import 'auth/login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: darkBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.0533,
              right: width * 0.0533,
              top: height * 0.02799,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        color: white,
                        size: 17,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: const Color(0xffD9D9D9),
                  child: data.image == null
                      ? Icon(
                          Icons.camera_alt_outlined,
                          color: const Color(0xff292D32).withOpacity(0.4),
                          size: 40,
                        )
                      : ClipOval(
                          child: Image.file(
                            data.image!,
                            fit: BoxFit.fill,
                            height: 70,
                            width: 70,
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 16),
                  child: Consumer<ProviderClass>(
                    builder: (context, providerStatus, _) {
                      return MyText(
                        '${providerStatus.firstName} ${providerStatus.lastName}',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: white,
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    data.showImageBottomSheet(context, data);
                  },
                  child: Container(
                    width: width * 0.234666,
                    height: height * 0.03695,
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
                  screen: Help(),
                  icon: Icons.help,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                          (route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.logout_outlined,
                          color: white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MyText(
                          'Log out',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
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
    );
  }
}
