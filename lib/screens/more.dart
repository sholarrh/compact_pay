//ADIGUN SOLAFUNMI
import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../widgets/container_widget.dart';
import 'cards.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: darkBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      iconSize: 20,
                      color: white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    MyText(
                      'More',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: white,
                      fontFamily: 'Poppins',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color(0xffD9D9D9),
                    child: data.image == null
                        ? Icon(
                            Icons.camera_alt_outlined,
                            color: const Color(0xff292D32).withOpacity(0.4),
                            size: 20,
                          )
                        : ClipOval(
                            child: Image.file(
                              data.image!,
                              fit: BoxFit.fill,
                              height: 50,
                              width: 50,
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Consumer<ProviderClass>(
                      builder: (context, providerStatus, _) {
                        return MyText(
                          '${providerStatus.firstName} ${providerStatus.lastName}',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: white,
                        );
                      },
                    ),
                  ),
                  ],
                ),
              ),
              const ContainerWidget(
                title: 'Account Limits',
                subtitle: 'View how much money can send and receive',
                screen: Cards(),
                icon: Icons.notifications,
              ),
              const ContainerWidget(
                title: 'Invites',
                subtitle: 'Earn rewards whenever you invite a friend',
                screen: Cards(),
                icon: Icons.lock_outline_sharp,
              ),
              const ContainerWidget(
                title: 'Friends',
                subtitle: 'Chat with friends & family',
                screen: Cards(),
                icon: Icons.info_outlined,
              ),
              const ContainerWidget(
                title: 'Rate Us',
              subtitle: 'Rate our app',
              screen: Cards(),
              icon: Icons.info_outlined,
            ),
            const ContainerWidget(
              title: 'Report Scam',
              subtitle: 'Report a fraud',
              screen: Cards(),
              icon: Icons.info_outlined,
            ),
            const ContainerWidget2(
              title: 'Help',
              subtitle: 'Customer care and FAQs',
              screen: Cards(),
              icon: Icons.info_outlined,
            ),
          ]),
        ))));
  }
}
