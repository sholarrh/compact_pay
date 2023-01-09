import 'package:compact_pay/screens/auth/login.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/my_button.dart';
import '../../widgets/my_text.dart';
import '../../widgets/size_config.dart';

// Adigun solafunmi

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentIndex = 0;
  var currentIndex = 1;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                itemCount: tabs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(tabs[index].assetImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _currentIndex <= 2
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      top: getProportionateScreenHeight(590)),
                                  child: MyText(
                                    tabs[index].title,
                                    textAlign: TextAlign.center,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: white,
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(
                                      top: getProportionateScreenHeight(655)),
                                  child: MyText(
                                    tabs[index].title,
                                    textAlign: TextAlign.center,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffD4D3D3),
                                  ),
                                ),
                          _currentIndex == 3
                              ? MyButton(
                                  height: 54,
                                  width: double.infinity,
                                  color: mainBlue,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()),
                                    );
                                  },
                                  child: MyText(
                                    'Get Started',
                                    fontSize: getProportionateScreenWidth(16),
                                    fontWeight: FontWeight.w600,
                                    color: white,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      )
                    ],
                  );
                },
                onPageChanged: (value) {
                  _currentIndex = value;
                  if (_currentIndex == 0) {
                    //print('do nothing');
                  } else {
                    currentIndex = _currentIndex + 1;
                  }
                  setState(() {});
                }),
            Positioned(
              right: getProportionateScreenWidth(38),
              top: getProportionateScreenHeight(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Row(
                  children: [
                    MyText(
                      'Skip',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: white,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(8),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 14,
                      color: white,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: getProportionateScreenHeight(689),
                left: getProportionateScreenWidth(137),
                child: _currentIndex <= 2
                    ? SmoothPageIndicator(
                        controller: _pageController,
                        count: tabs.length,
                        effect: WormEffect(
                          dotHeight: getProportionateScreenHeight(8),
                          dotWidth: getProportionateScreenWidth(8),
                          dotColor: Color(0XFF787676),
                          spacing: getProportionateScreenWidth(4),
                          activeDotColor: Color(0XFFCECCCC),
                        ),
                      )
                    : const SizedBox()),
          ],
        ),
      ),
    );
  }
}

List<OnboardingModel> tabs = [
  OnboardingModel(
    'assets/images/1st splash.png',
    'Send and receive money \nonline',
  ),
  OnboardingModel(
    'assets/images/onboard2.png',
    'Pay bills easier and \nfaster',
  ),
  OnboardingModel(
    'assets/images/onboard3.png',
    'Low cost transaction',
  ),
  OnboardingModel(
    'assets/images/getstarted.png',
    'Payment made easy 24/7',
  ),
];

class OnboardingModel {
  final String assetImage;
  final String title;

  OnboardingModel(
    this.assetImage,
    this.title,
  );
}
