import 'package:compact_pay/utils/app_colors.dart';
import 'package:compact_pay/widgets/my_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../widgets/my_button.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 53),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          iconSize: 12,
                          color: close,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        MyText(
                          'Get A Card',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: black2121,
                          fontFamily: 'Poppins',
                        ),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/compactPay Card.png'),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24.0,
                    ),
                    child: MyText(
                      'Naira Virtual Card',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 20),
                    child: MyText(
                      'Send and receive money anywhere with your CompactPay card',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: black2121,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17.0, vertical: 12.0),
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
                            const Icon(
                              Icons.credit_card,
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
                                  'Request A Card',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: black2121,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                MyText(
                                  'Make a request to get your card delivered',
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff8A8D8F),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const EditProfile()));
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
                  Padding(
                    padding: const EdgeInsets.only(top: 220),
                    child: MyButton(
                      height: 50,
                      width: double.infinity,
                      color: mainBlue,
                      onTap: () {
                        // if (formKey.currentState!.validate()) {
                        data.isLoading = true;
                        setState(() {});
                        data.delay(4);
                        try {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const BottomNav()));
                        } catch (e, s) {
                          if (kDebugMode) {
                            print(e);
                          }
                          if (kDebugMode) {
                            print(s);
                          }
                        }
                        // } else {
                        //   const ShowSnackBar(
                        //     text: "There is an error",
                        //     duration: 5,
                        //   );
                        // }
                      },
                      child: data.isLoading == false
                          ? MyText(
                              'Get A Virtual Card',
                              color: white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                color: white,
                              ),
                            ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
