// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:acquaintances/Pages/homescreen.dart';
import 'package:acquaintances/Pages/settings.dart';
import 'package:acquaintances/Pages/profile.dart';

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
        '/settings': (context) => Settings(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
