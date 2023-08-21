import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressionTracker extends StatefulWidget {
  const ProgressionTracker({Key? key}) : super(key: key);

  @override
  ProgressionTrackerState createState() => ProgressionTrackerState();
}

class ProgressionTrackerState extends State<ProgressionTracker> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  //bool? tutorialOne = prefs.getBool('repeat');
  // Make more of the above line for every tutorial and module

  String returnBool(bool value) {
    if (value) {
      return "Completed";
    }
    return "Not Completed";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          TableRow(children: [
            Text('Tutorial 1'),
            //Text(returnBool(tutorialOne))
          ]),
          TableRow(children: [
            Text('Tutorial 2'),
            //Text(returnBool(tutorialTwo))
          ]),
        ],
      ),
    );
  }
}
