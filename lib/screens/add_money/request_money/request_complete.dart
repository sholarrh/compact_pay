import 'package:compact_pay/widgets/bottom_nav.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/currency_box.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_text.dart';

class RequestComplete extends StatefulWidget {
  const RequestComplete({Key? key}) : super(key: key);

  @override
  State<RequestComplete> createState() => _RequestCompleteState();
}

class _RequestCompleteState extends State<RequestComplete> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProviderClass>(context);
    return Scaffold(
      backgroundColor: backWhite,
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
                    padding: const EdgeInsets.only(top: 30.0, bottom: 19),
                    child: MyText(
                      'Request Successful',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: black2121,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 21.0),
                    child: MyText(
                      '${getCurrency()} ${data.amountToSendTextController.text}.00',
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      fontFamily: 'poppins',
                      color: black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 24),
                    child: MyButton(
                      height: 50,
                      width: double.infinity,
                      color: mainBlue,
                      onTap: () async {
                        //if (formKey.currentState!.validate()) {
                        data.isLoading = true;
                        setState(() {});
                        data.delay(2);
                        try {} catch (e, s) {
                          if (kDebugMode) {
                            print(e);
                          }
                          if (kDebugMode) {
                            print(s);
                          }
                        }
                        //}
                        // else{
                        //   const ShowSnackBar(
                        //     text: "There is an error",
                        //     duration: 5,
                        //   );
                        // }
                      },
                      child: data.isLoading == false
                          ? MyText(
                              'Send Again',
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNav()));
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
