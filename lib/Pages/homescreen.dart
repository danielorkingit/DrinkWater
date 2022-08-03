import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon drinkicon = Icon(
    Icons.water_damage_rounded,
    color: Colors.black,
  );
  double i = 0.0;
  double zerowater = 650.0;
  double oneml = 0.0;
  double maxwater = 50;
  String weekday = "Monday";
  int dailywateramount = 2000;
  int personalweight = 50;
  int watertoday = 0;
  int drinkamount = 250;
  TextEditingController personalweightcontroller = TextEditingController();
  TextEditingController personalwateramountcontroller = TextEditingController();
  TextEditingController wateramountcontroller = TextEditingController();

  void calculateimage() {}

  void personalweightstate() {
    if (personalweightcontroller.text != 0) {
      personalweight = int.parse(personalweightcontroller.text);
      setState(() {});
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  void personalwateramountstate() {
    if (personalwateramountcontroller.text != 0) {
      dailywateramount = int.parse(personalwateramountcontroller.text);
      setState(() {});
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  void drinkchoosestate() {
    drinkamount = int.parse(wateramountcontroller.text);
    oneml = 650.0 / drinkamount;
    setState(() {});
    Navigator.pop(context);
  }

  void updatewaterlevel() {
    i = drinkamount.toDouble() * oneml;
    watertoday = i.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.coronavirus_sharp,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pushNamed(context, '/stats'),
        ),
        title: Text(weekday,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {
              showSettings();
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
                  height: zerowater,
                ),
                Container(child: Image.asset('assets/images/water12.png')),
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
                          "Watergoal ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                      SizedBox(width: 70),
                      Text(
                        dailywateramount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 12, 124, 215),
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 450),
                Row(
                  children: [
                    SizedBox(width: 110),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle_rounded,
                        color: Color.fromARGB(255, 1, 26, 46),
                        size: 150,
                      ),
                      onPressed: () => Null,
                    ),
                    SizedBox(width: 70),
                    FloatingActionButton(
                      backgroundColor: Colors.yellow,
                      onPressed: () => drinkchoose(),
                      child: drinkicon,
                    ),
                  ],
                ),
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
                      Navigator.pushNamed(context, '/privacypolicy');
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
              onPressed: () => personalweightstate(),
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
              onPressed: () => personalwateramountstate(),
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
              onPressed: () => drinkchoosestate(),
            ),
          ],
        );
      },
    );
  }
}
