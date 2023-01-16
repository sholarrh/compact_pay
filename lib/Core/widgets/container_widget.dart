// Adigun solafunmi

import 'package:flutter/material.dart';

import '../../App/screens/Help/help.dart';
import '../utils/app_colors.dart';
import 'my_text.dart';

class ContainerWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget screen;

  const ContainerWidget({
    required this.title,
    required this.icon,
    required this.subtitle,
    required this.screen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              width: 1,
              color: black2121.withOpacity(0.1),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 5,
                spreadRadius: 0,
                color: const Color(0xff212121).withOpacity(0.1),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: mainBlue,
                ),
                const SizedBox(
                  width: 9,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    MyText(
                      subtitle,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff8A8D8F),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => screen));
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: mainBlue,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerWidget2 extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget screen;

  const ContainerWidget2({
    required this.title,
    required this.icon,
    required this.subtitle,
    required this.screen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: mainBlue,
              ),
              const SizedBox(
                width: 9,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: black2121,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  MyText(
                    subtitle,
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff8A8D8F),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Help()));
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: mainBlue,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}
