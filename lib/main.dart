import 'package:compact_pay/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/SplashScreen/splashscreen.dart';
import 'screens/homepage.dart';
import 'widgets/bottom_nav.dart';

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
        home: const BottomNav(),
      ),);
  }
}


