// Adigun solafunmi
import 'package:compact_pay/screens/Grids/airtime.dart';
import 'package:compact_pay/screens/profile.dart';
import 'package:compact_pay/widgets/currency_box.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    ProviderClass().get();
  }

  bool hideMoney = false;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context, listen: true);
    // data.get();
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
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color(0xffD9D9D9),
                        child: data.image == null
                            ? Icon(
                          Icons.camera_alt_outlined,
                                color: const Color(0xff292D32).withOpacity(0.4),
                                size: 20,
                              )
                            : Image.file(
                          data.image!,
                          fit: BoxFit.fill,
                          height: 40,
                          width: 40,
                        ),
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
                  child: Consumer<ProviderClass>(
                    builder: (context, providerStatus, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            'Hi, ${providerStatus.firstName} ${providerStatus.lastName}',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: black2121,
                          ),
                          MyText(
                            'Last Login: ${providerStatus.lastLogin}',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: black2121,
                          ),
                        ],
                      );
                    },
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
                            MyText(
                              'Account Number',
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
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
                                MyText(
                                  hideMoney
                                      ? '*******'
                                      : '${getCurrency()}3,320,000.00',
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                  color: white,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  hideMoney = !hideMoney;
                                });
                              },
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                size: 20,
                                color: white.withOpacity(0.7),
                              ),
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
