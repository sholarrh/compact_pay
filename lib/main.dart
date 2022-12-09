import 'package:compact_pay/provider/provider.dart';
import 'package:compact_pay/screens/Data/airtime_topup1.dart';
import 'package:compact_pay/screens/Send%20Money/Send%20Money/bank_account.dart';
import 'package:compact_pay/screens/Send%20Money/Send%20Money/confirm.dart';
import 'package:compact_pay/screens/Send%20Money/Send%20Money/wallet2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/Send Money/Send Money/transfer_successful.dart';

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
          fontFamily: 'Poppins',
        ),
        home: const Wallet2(),
      ),);
  }
}


