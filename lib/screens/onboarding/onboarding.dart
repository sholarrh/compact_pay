
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/onboarding_model.dart';
import '../Pages/Login Page/login.dart';



class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _pageController;

  int _pageIndex=0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
// final Controller= PageController();

  @override
  Widget build(BuildContext context) {
    final List<OnboardingModel> demo_data=[
      OnboardingModel(
        'assets/images/onboard1.png',
        'Send and receive money',
        'online',
      ),
      OnboardingModel(
        'assets/images/onboard2.png',
        'Pay your bills easier and',
        'faster',
      ),
      OnboardingModel(
        'assets/images/onboard3.png',
        'Low cost',
        'transaction',
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
        PageView.builder(itemCount: demo_data.length,
                        controller: _pageController,
                        onPageChanged:(index){
                          setState((){
                            _pageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) => OnboardingScreen(
                          image: demo_data[index].assetImage,
                          title: demo_data[index].title,
                          description:demo_data[index].subtitle,
                        )),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0,),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, bottom: 20),
                              child: SmoothPageIndicator(controller: _pageController, count: 3,
                                effect: SlideEffect(
                                  spacing: 8,
                                  dotColor: Color(0xffC4C4C4),
                                  activeDotColor: Color(0xff0F68ED),
                                ),
                                onDotClicked:(index){
                                  _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                                },),
                            ),
                            GestureDetector(
                              onTap: (){
                                _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                                if (_pageIndex==2){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 24.0, bottom: 20),
                                child: Container(
                                  height: 50,
                                  width: 133,
                                  decoration: BoxDecoration(
                                    color: Color(0xff0F68ED),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                        'Next',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            height: 550,
            width: 428,
            decoration: BoxDecoration(

              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24,top: 52
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(top: 68.0,right: 19),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text('Skip',
                      style: TextStyle(
                          color:Colors.white
                      ),),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 48),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 38,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xff222222),
          ),
        )
      ],
    );
  }
}

