import 'package:flutter/material.dart';
import 'package:loyalty/screen/BottomNavigationLayout.dart';
import 'package:loyalty/screen/home/exchangeGiftInfo.dart';
import 'package:loyalty/screen/home/home.dart';
import 'package:loyalty/screen/auth/login_screen.dart';
import 'package:loyalty/screen/auth/register.dart';
import 'package:loyalty/api/api_clients.dart';
import 'package:loyalty/screen/home/home_test.dart';
import 'package:loyalty/screen/person/test.dart';

import 'screen/person/myadress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loyalty App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ExchangeGiftInfo(),
      home: const LoginScreen(),
      //home: Edit(),
    );
  }
}
