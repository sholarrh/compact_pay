// Adigun solafunmi
import 'package:compact_pay/screens/Grids/airtime.dart';
import 'package:compact_pay/screens/profile.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/homepage_grid.dart';
import 'Grids/cable_network.dart';
import 'Grids/data.dart';
import 'Grids/deals.dart';
import 'Grids/electricity.dart';
import 'Grids/refer_us.dart';
import 'Grids/tv.dart';
import 'Grids/wallet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    iconSize: 17,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()));
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/images/profileImage.png'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset('assets/images/scanner.png'),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Image.asset('assets/images/notification.png')),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText('Hi, Tola Kelechi',
                      fontSize: 14,
                        fontWeight: FontWeight.w500 ,
                        color: black2121,
                      ),
                      MyText('Last Login: 1/11/2022',
                        fontSize: 14,
                        fontWeight: FontWeight.w500 ,
                        color: black2121,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
                    width: double.infinity,
                    height: 100,
                    decoration:  BoxDecoration(
                      color: mainBlue,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText('Account Balance',
                              fontSize: 10,
                              fontWeight: FontWeight.w500 ,
                              color: white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyText('Transaction History',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500 ,
                                  color: white,
                                ),
                                const SizedBox(width: 4.4,),
                                GestureDetector(
                                  onTap: (){},
                                  child: const Icon(Icons.arrow_forward_ios,
                                  size: 8,
                                  color: white,),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyText('N',
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700 ,
                                  color: white,
                                ),
                                MyText('45,560.00',
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700 ,
                                  color: white,
                                ),
                              ],
                            ),
                             Icon(Icons.remove_red_eye_outlined,
                            size: 20,
                            color: white.withOpacity(0.7),
                             ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: GridView.count(
                    padding: const EdgeInsets.all(20),
                    crossAxisCount: 4,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    children: const [
                      Grids(
                        screenName: Wallet(),
                        image: 'assets/images/empty-wallet.png',
                        title: 'Wallet',
                      ),
                      Grids(
                        screenName: Airtime(),
                        image: 'assets/images/mobile.png',
                        title: 'Airtime',
                      ),
                      Grids(
                        screenName: Data(),
                        image: 'assets/images/mobile-programming.png',
                        title: 'Data',
                      ),
                      Grids(
                        screenName: Tv(),
                        image: 'assets/images/youtube.png',
                        title: 'Tv',
                      ),
                      Grids(
                        screenName: CableNetwork(),
                        image: 'assets/images/kyber-network-(knc).png',
                        title: 'Cable Network',
                      ),
                      Grids(
                        screenName: Electricity(),
                        image: 'assets/images/electricity.png',
                        title: 'Electricity',
                      ),
                      Grids(
                        screenName: Deals(),
                        image: 'assets/images/gift.png',
                        title: 'Deals',
                      ),
                      Grids(
                        screenName: ReferUs(),
                        image: 'assets/images/people.png',
                        title: 'Refer us',
                      ),
                    ],
                  ),
                ),
                
                Image.asset('assets/images/referral.png'),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MyText('Recent Transactions',
                    fontSize: 16,
                    fontWeight: FontWeight.w500 ,
                    color: black2121,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: mainBlue,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        '01 Nov 2022',
                        fontSize: 8,
                        fontWeight: FontWeight.w400 ,
                        color: white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.circle),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                'Charles Kelvin',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: white,
                              ),
                              MyText(
                                '12:05 AM',
                                fontSize:8,
                                fontWeight: FontWeight.w400 ,
                                color: white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
