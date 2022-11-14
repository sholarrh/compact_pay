import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int pagenum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: onboardingDetails.length,
              controller: pageController,
              onPageChanged: (value) => setState(() {
                pagenum = value;
              }),
              itemBuilder: (context, index) => Image.asset(
                "${onboardingDetails[index]["image"]}",
                fit: BoxFit.fill,
              ),
            ),
            Align(
              // heightFactor: ,
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 13,
                            ),
                            label: const Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    Expanded(
                      child: Text(
                        "${onboardingDetails[pagenum]["text"]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          onboardingDetails.length,
                              (index) => Container(
                            margin: const EdgeInsets.all(10),
                            height: index == pagenum ? 16 : 12,
                            width: index == pagenum ? 16 : 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == pagenum
                                  ? const Color(0xffCECCCC)
                                  : const Color(0xff787676),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> onboardingDetails = <Map<String, String>>[
  {
    "image": "assets/images/onboard1.png",
    "text": "Send and receive money \nonline",
  },
  {
    "image": "assets/images/onboard2.png",
    "text": "Pay bills easier and \nfaster",
  },
  {
    "image": "assets/images/onboard3.png",
    "text": "Low cost transaction",
  },
  // {
  //   "image": "assets/images/getstarted.png",
  //   "text": "Get Started",
  // },
];
