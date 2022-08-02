import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String i = "";
  String weekday = "Monday";
  int dailywateramount = 220;
  int personalweight = 50;
  TextEditingController personalweightcontroller = TextEditingController();

  void personalweightstate() {
    if (personalweightcontroller.text != 0) {
      personalweight = int.parse(personalweightcontroller.text);
      setState(() {});
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          height: 200,
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
                  style: TextStyle(color: Colors.black45),
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
                    onPressed: () => Null,
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
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "My",
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
                    onPressed: () => Null,
                    icon: Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.black),
                  )
                ],
              ),
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
}
