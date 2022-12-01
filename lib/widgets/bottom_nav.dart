// Adigun solafunmi

import 'package:compact_pay/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../screens/cards.dart';
import '../screens/homepage.dart';
import '../screens/more.dart';
import '../screens/payments.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

  final _navScreens = const [
    HomePage(),
    Payments(),
    Cards(),
    More(),
  ];
  List get navScreens => _navScreens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navScreens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          backgroundColor: mainBlue,
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
            ),
          ),
          // labelBehavior: ,
        ),
        child: NavigationBar(
          height: 60,
            backgroundColor: white,
            selectedIndex: index,
            onDestinationSelected: (index) =>
          setState(() {
            this.index = index;
          }),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.arrow_forward),
                label: 'Send',
              ),
              NavigationDestination(
                icon: Icon(Icons.credit_card_rounded),
                label: 'Card',
              ),
              NavigationDestination(
                icon: Icon(Icons.more_outlined),
                label: 'More',
              ),
            ],
        ),
      ),
    );
  }
}
