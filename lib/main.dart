import 'package:compact_pay/provider/provider.dart';
import 'package:compact_pay/screens/Data/airtime_topup1.dart';
import 'package:compact_pay/screens/Grids/wallet.dart';
import 'package:compact_pay/screens/change_pin.dart';
import 'package:compact_pay/screens/changepassword.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/Send Money/Send Money/bank_account.dart';
import 'screens/Send Money/Send Money/confirm.dart';
import 'screens/Send Money/Send Money/wallet2.dart';






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
        home: const Wallet2(),
      ),);
  }
}


