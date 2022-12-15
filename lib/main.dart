import 'package:compact_pay/provider/provider.dart';
import 'package:compact_pay/screens/airtime/airtime_top_up.dart';
import 'package:compact_pay/screens/auth/login.dart';
import 'package:compact_pay/screens/customer_care.dart';
import 'package:compact_pay/screens/help.dart';
import 'package:compact_pay/screens/live_chat.dart';
import 'package:compact_pay/screens/settings.dart';
import 'package:flutter/material.dart';
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
          fontFamily: 'Poppins',
        ),
        home: const AirtimeTopUp(),
      ),
    );
  }
}
