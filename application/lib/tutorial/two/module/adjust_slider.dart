import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'dart:io' show Platform;

class AdjustSliderState extends State<AdjustSlider> {
  @override
  double _currentValue = 0;
  int stage = 1;
  String displayText = "";

  Widget build(BuildContext context) {
    if (stage == 1 && _currentValue == 100) {
      // Finished first part
      stage = 2;
    }
    if (stage == 2 && _currentValue == 50) {
      // Finished second part
      stage = 3;
    }
    if (stage == 3 && _currentValue == 100) {
      // Finished third part
      stage = 4;
    }
    displayText = instructions(stage);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Adjust slider page'),
        ),
        body: Center(
            child: Column(children: [
          Text(displayText),
          Text(_currentValue.toString(), style: TextStyle(fontSize: 30)),
          Slider(
              value: _currentValue,
              onChanged: (value) {
                setState(() => {_currentValue = value});
              },
              min: 0,
              divisions: 10,
              max: 100)
        ])));
  }

  String instructions(stage) {
    if (stage == 1) {
      return """Welcome, in this module you'll learn how to  increase and decrease slider value. A slider is a track that
          contains values between a minimum and a maximum. Sliders are often used to adjust times. For example: song times
          or video times. You can also adjust this phone's volume using a slider. To start you will try and increase a slider's
          value. To increase the value, swipe up. To continue, increase the slider value to 100%""";
    } else if (stage == 2) {
      return """Now we will try and move the slider back down. To do this swipe down with one finger to reduce the value.
                  Continue until the value is back to 50%""";
    } else if (stage == 3) {
      return """An alternative way of changing the volume is to double tap and hold the slider. From here you
                  can swipe left and right to adjust it in that direction. Try and go back to 100%""";
    } //  Stage == 3
    else {
      //stage == 4
      return """Nice job! Use the back button to return home""";
    }
  }
}

class AdjustSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdjustSliderState();
  }
}
