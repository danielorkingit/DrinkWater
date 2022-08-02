// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:acquaintances/Pages/homescreen.dart';
import 'package:acquaintances/Pages/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomeScreen(),
        '/settings': (context) => Settings(),
      },
    );
  }
}
