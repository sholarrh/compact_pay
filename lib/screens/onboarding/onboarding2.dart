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
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: tabs.length,
        onPageChanged: (value) {
          _currentIndex = value;
          if (_currentIndex == 0) {
          } else {
            currentIndex = _currentIndex + 1;
          }
          setState(() {});
        },
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
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenWidth(20),
                  bottom: getProportionateScreenWidth(30),
                  left: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                    SizedBox(
                      height: getProportionateScreenHeight(400),
                    ),
                    _currentIndex <= 2
                        ? Column(
                            children: [
                              MyText(
                                tabs[index].title,
                                textAlign: TextAlign.center,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: white,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              MyButton(
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
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(16),
                              ),
                              MyText(
                                tabs[index].title,
                                textAlign: TextAlign.center,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffD4D3D3),
                              ),
                            ],
                          ),
                    // SizedBox(
                    //   height: getProportionateScreenHeight(30),
                    // ),
                  ],
                ),
              ),
              Positioned(
                top: getProportionateScreenHeight(550),
                left: getProportionateScreenWidth(137),
                child: _currentIndex <= 2
                    ? SmoothPageIndicator(
                        controller: _pageController,
                        count: tabs.length,
                        effect: ScaleEffect(
                          scale: 1.35,
                          dotHeight: getProportionateScreenHeight(12),
                          dotWidth: getProportionateScreenWidth(12),
                          dotColor: Color(0XFF787676),
                          spacing: getProportionateScreenWidth(16),
                          activeDotColor: Color(0XFFCECCCC),
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          );
        },
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
