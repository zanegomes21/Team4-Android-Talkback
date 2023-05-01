import 'package:flutter/material.dart';

class GesturesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GesturesState();
  }
}

class GesturesState extends State<GesturesPage> {
  void doubleTap() => {
        setState(() => {gestureText = "Double tap"})
      };
  void longPress() => {
        setState(() => {gestureText = "Long press"})
      };
  void verticalSwipe(details) => {
        setState(() => {gestureText = "Vertical swipe"})
      };
  void horizontalSwipe(details) => {
        setState(() => {gestureText = "Horizontal swipe"})
      };
  String gestureText = 'No gestures yet';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: doubleTap,
      onLongPress: longPress,
      onVerticalDragEnd: verticalSwipe,
      onHorizontalDragEnd: horizontalSwipe,
      child: Scaffold(
          appBar: AppBar(title: Text("Gesture page")),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Return home")),
                Text(gestureText)
              ]))),
    );
  }
}
