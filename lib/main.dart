// Main file

import 'package:flutter/material.dart';
import 'package:DrinkWater/Pages/homescreen.dart';
import 'package:DrinkWater/Pages/privacypolicy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '/privacypolicy': (context) => Privacypolicy(),
      },
    );
  }
}
