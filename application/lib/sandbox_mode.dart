import 'dart:async';

import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GesturesState();
  }
}

class GesturesState extends State<SandBox> {
  // Timer? timer;

  void doubleTap() => {
        setState(() => {gestureText = "Double tap"})
      };
  void longPress() => {
        setState(() => {gestureText = "Long press"})
      };
  void handleSwipe(ScaleUpdateDetails details) => {
        if (details.pointerCount == 1)
          if (details.focalPointDelta.dx.abs() >
              details.focalPointDelta.dy.abs())
            {
              setState(() => {gestureText = "Horizontal swipe"})
            }
          else if (details.focalPointDelta.dx.abs() <=
              details.focalPointDelta.dy.abs())
            {
              setState(() => {gestureText = "Vertical swipe"})
            },
        if (details.pointerCount == 2)
          if (details.focalPointDelta.dx.abs() >
              details.focalPointDelta.dy.abs())
            {
              setState(() => {gestureText = "Two finger horizontal swipe"}),
              // timer = Timer(const Duration(milliseconds: 500), () {})
            }
          else if (details.focalPointDelta.dx.abs() <=
              details.focalPointDelta.dy.abs())
            {
              setState(() => {gestureText = "Two finger vertical swipe"}),
              // timer = Timer(const Duration(milliseconds: 500), () {})
            },
        if (details.pointerCount == 3)
          if (details.focalPointDelta.dx.abs() >
              details.focalPointDelta.dy.abs())
            {
              setState(() => {gestureText = "Three finger horizontal swipe"})
            }
          else if (details.focalPointDelta.dx.abs() <=
              details.focalPointDelta.dy.abs())
            {
              setState(() => {gestureText = "Three finger vertical swipe"})
            }
      };
  String gestureText = 'No gestures yet';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleUpdate: handleSwipe,
      onDoubleTap: doubleTap,
      onLongPress: longPress,
      child: Scaffold(
          appBar: AppBar(title: const Text("SandBox")),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Return home")),
                Text(gestureText)
              ]))),
    );
  }
}
