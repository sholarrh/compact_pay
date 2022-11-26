import 'package:compact_pay/screens/auth/login.dart';
import 'package:compact_pay/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_text.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
              controller: _pageController,
              itemCount: tabs.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(tabs[index].assetImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    _currentIndex <= 2 ? Positioned(
                      right: 23,
                      top: 590,
                      left: 23,
                      child: MyText(
                        tabs[index].title,
                        textAlign: TextAlign.center,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: white,),
                    ) : Positioned(
                      right: 23,
                      top: 670,
                      left: 23,
                      child: MyText(
                      tabs[index].title,
                      textAlign: TextAlign.center,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffD4D3D3),),

                    ),

                    _currentIndex == 3 ? Positioned(
                        right: 20,
                        top: 595,
                        left: 20,
                        child: Container(
                          width: double.infinity,
                          height: 54,
                          decoration: BoxDecoration(
                            color: mainBlue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()),
                                  );
                                },
                                child:  MyText('Get Started',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: white,
                                ),
                        ),
                          ),
                    ),
                    )
                        : const SizedBox(),
                  ],
                );
              },
              onPageChanged: (value) {
                _currentIndex = value;
                if(_currentIndex==0){
                  //print('do nothing');
                }
                else{
                  currentIndex = _currentIndex + 1;
                }
                setState(() {});}
          ),
          Positioned(
            right: 34,
            top: 54,
            child:Row(
              children: [
                MyText('Skip',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: white,
                ),
                const SizedBox(width: 11,),

                InkWell(
                  onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const Login()),
                        );
                      },
                  child: const Icon(Icons.arrow_forward_ios_outlined,
                        size: 13,
                        color: white,
                      ),
                ),

              ],
            ),),

          Positioned(
              bottom: 100,
              left: 138,
              child: _currentIndex <= 2 ?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ...List.generate(
                    tabs.length,
                        (index) => Container(
                      margin: const EdgeInsets.all(10),
                      height: index == _currentIndex ? 16 : 12,
                      width: index == _currentIndex ? 16 : 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == _currentIndex
                            ? const Color(0xffCECCCC)
                            : const Color(0xff787676),
                      ),
                    ),
                  ),
                ],
              ): const SizedBox()
          ),
        ],),
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