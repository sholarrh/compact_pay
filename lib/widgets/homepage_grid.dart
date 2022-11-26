// Adigun solafunmi

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'my_text.dart';

class Grids extends StatelessWidget {
  final Widget screenName;
  final String image;
  final String title;

  const Grids({
    Key? key,
    required this.screenName,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screenName));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(
              height: 10,
            ),
            MyText(
              title,
              fontSize: 8,
              fontWeight: FontWeight.w400,
              color: black2121,
            ),
          ],
        ),
      ),
    );
  }
}
