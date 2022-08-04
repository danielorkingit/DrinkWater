// Simple programm to track the daily water intake

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double i = 0.0; // Helper Variable
  double waterlevel = 650.0; // Hight of the water image
  double oneml = 0.5; // Calculation of one ml in relation to the waterlevel
  String weekday = "Monday"; // static weekday
  int dailywateramount = 2000; // Changeable daily water goal
  int personalweight = 50;
  int watertoday = 0;
  int drinkamount = 0; // Ml amount of the current drink
  String sign = "Watergoal"; // Sign at the bottom
  TextEditingController personalweightcontroller = TextEditingController();
  TextEditingController personalwateramountcontroller = TextEditingController();
  TextEditingController wateramountcontroller = TextEditingController();

  void reset() {
    i = 0;
    waterlevel = 650;
    watertoday = 0;
    drinkamount = 0;
    setState(() {});
  }

  String drinkamountsign() {
    if (drinkamount == 0) {
      return "Choose a drink amount!"; // Default sign context
    } else {
      return drinkamount.toString() + " ml"; // Current drink ml amount
    }
  }

  void personalweightstate() {
    // Set the personal weight
    if (personalweightcontroller.text != 0) {
      personalweight = int.parse(personalweightcontroller.text);
      setState(() {});
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  double heightcheckercontainer() {
    // Hight of the water image
    if (waterlevel < 60) {
      return 200; // Water image to short => color container
    } else {
      return 0;
    }
  }

  void updatewaterlevel() {
    if (oneml != 0 && watertoday != dailywateramount) {
      i = drinkamount.toDouble() *
          oneml; // Calculate the hight of the water image
      watertoday = watertoday + drinkamount.toInt(); // Update the water level
      if (watertoday == dailywateramount || watertoday > dailywateramount) {
        sign = "Mission done!";
        dailywateramount = 0;
      }
      if (watertoday > dailywateramount) {
        reset();
      }
      setState(() {
        waterlevel = waterlevel - i; // Set the hight of the water image
      });
    }
  }

  void personalwateramountstate() {
    // Set the personal daily water amount
    if (personalwateramountcontroller.text != 0) {
      dailywateramount = int.parse(personalwateramountcontroller.text);
      oneml = 650.0 /
          dailywateramount
              .toDouble(); // Calculate one ml in relation to the hight of the water image
      setState(() {});
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  void drinkchoosestate() {
    oneml = 650.0 /
        dailywateramount
            .toDouble(); // Calculate one ml in relation to the hight of the water image
    drinkamount = int.parse(wateramountcontroller.text);
    setState(() {});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => reset(),
          icon: Icon(Icons.restore),
          color: Colors.black,
        ),
        title: Text(weekday,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {
              showSettings(); // Settings bottom sheet
            },
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                SizedBox(
                  height: waterlevel,
                ),
                Container(child: Image.asset('assets/images/water12.png')),
                Container(
                  color: Color.fromARGB(96, 33, 149, 243),
                  height: heightcheckercontainer(),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.yellow,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: Text(
                          // Bottom sign
                          sign,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                      SizedBox(width: 70),
                      Text(
                        dailywateramount.toString(), // Daily water amount
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 12, 124, 215),
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 400),
                Row(
                  children: [
                    SizedBox(width: 110),
                    IconButton(
                      // Add water
                      onPressed: () => updatewaterlevel(),
                      icon: Icon(Icons.add_circle_outline_rounded),
                      color: Colors.blue,
                      iconSize: 150,
                    ),
                    FloatingActionButton(
                      // Choose a drink
                      backgroundColor: Colors.yellow,
                      onPressed: () => drinkchoose(),
                      child: Icon(
                        Icons.coffee_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Center(
                      // Drink amount sign
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Text(
                          drinkamountsign(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  showSettings() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Settings",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 40),
                  ),
                  Spacer(),
                  IconButton(
                    // Close sheet
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_circle_down_outlined,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Container(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "My information",
                  style: TextStyle(color: Colors.black45, fontSize: 17),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "My daily water consume",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  Text(
                    dailywateramount.toString() + " ml",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    // Set water amount
                    onPressed: () => formswateramount(),
                    icon: Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.black),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "My weight",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  Text(
                    personalweight.toString() + " kg",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    // Set weight
                    onPressed: () => formsweight(),
                    icon: Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.black),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Help",
                  style: TextStyle(color: Colors.black45, fontSize: 17),
                ),
              ),
              SizedBox(
                width: 20,
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      Navigator.pushNamed(context,
                          '/privacypolicy'); // Redirect to the privacypolicy page
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.black),
                  )
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  formsweight() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: personalweightcontroller,
                  decoration: InputDecoration(
                    labelText: 'Weight',
                    icon: Icon(Icons.monitor_weight),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.transit_enterexit_outlined),
              onPressed: () => personalweightstate(), // Update weight
            ),
          ],
        );
      },
    );
  }

  formswateramount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: personalwateramountcontroller,
                  decoration: InputDecoration(
                    labelText: 'Water goal',
                    icon: Icon(Icons.water_drop),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.transit_enterexit_outlined),
              onPressed: () => personalwateramountstate(), // Set water goal
            ),
          ],
        );
      },
    );
  }

  drinkchoose() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: wateramountcontroller,
                  decoration: InputDecoration(
                    labelText: 'Water amount',
                    icon: Icon(Icons.coffee_rounded),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.transit_enterexit_outlined),
              onPressed: () => drinkchoosestate(), // Choose drink
            ),
          ],
        );
      },
    );
  }
}
