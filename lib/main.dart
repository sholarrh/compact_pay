import 'package:compact_pay/provider/provider.dart';
import 'package:compact_pay/screens/Grids/electricity.dart';
import 'package:compact_pay/screens/airtime/Input_pin.dart';
import 'package:compact_pay/screens/add_money/card/payment_successful.dart';
import 'package:compact_pay/screens/add_money/request_money/add_by_request.dart';
import 'package:compact_pay/screens/add_money/request_money/request_complete.dart';
import 'package:compact_pay/screens/airtime/airtime_top_up.dart';
import 'package:compact_pay/screens/compact_account/compactpay_account.dart';
import 'package:compact_pay/screens/compact_account/confirm.dart';
import 'package:compact_pay/screens/electricity/electricity_page.dart';
import 'package:compact_pay/screens/homepage.dart';
import 'package:compact_pay/screens/payments.dart';
import 'package:compact_pay/screens/electricity/payments_successful.dart';
import 'package:compact_pay/screens/compact_account/transfer_successful.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderClass()),
      ],
      child: MaterialApp(
          title: 'Compact Pay',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: const AirtimeTopUp()),
    );
  }
}
