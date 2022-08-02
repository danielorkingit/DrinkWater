import 'package:flutter/material.dart';
import 'package:DrinkWater/text/loremipsum.dart';

class Privacypolicy extends StatelessWidget {
  const Privacypolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Privacy policy",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.blue),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(7),
          child: Text(ipsum),
        ));
  }
}
