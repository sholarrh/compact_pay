// ADIGUN SOLAFUNMI

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/provider/provider.dart';
import '../../../Core/utils/app_colors.dart';
import '../../../Core/widgets/bottom_nav.dart';
import '../../../Core/widgets/my_button.dart';
import '../../../Core/widgets/my_text.dart';

class PaymentSuccessful extends StatefulWidget {
  const PaymentSuccessful({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessful> createState() => _PaymentSuccessfulState();
}

class _PaymentSuccessfulState extends State<PaymentSuccessful> {
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
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 128, right: 340),
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      iconSize: 12,
                      color: close,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                    backgroundImage: AssetImage('assets/images/confirm.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 46),
                    child: MyText(
                      'Payment Successful',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 24),
                    child: MyButton(
                      height: 50,
                      width: double.infinity,
                      color: mainBlue,
                      onTap: () async {
                        // if (formKey.currentState!.validate()) {
                        data.isLoading = true;
                        setState(() {});
                        data.delay(4);
                        try {} catch (e, s) {
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
                              'View Receipt',
                              color: white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                color: white,
                              ),
                            ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const BottomNav()),
                          (route) => false);
                    },
                    child: MyText(
                      'Go to Homepage',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: mainBlue,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
