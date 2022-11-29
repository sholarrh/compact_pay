import 'package:compact_pay/provider/provider.dart';
import 'package:compact_pay/screens/SplashScreen/splashscreen.dart';
import 'package:compact_pay/screens/add_money/ussd/add_by_ussd.dart';
import 'package:compact_pay/screens/add_money/ussd/select_bank.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/Send Money/Send Money/add_amount.dart';
import 'screens/Send Money/Send Money/bank_account.dart';
import 'screens/Send Money/Send Money/select_bank.dart';

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
        home: const BankAccount(),
      ),);
  }
}


