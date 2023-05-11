import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class AdjustSlider extends StatelessWidget {
  const AdjustSlider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // instructions();

    return Semantics(
        onDidGainAccessibilityFocus: () => instructions(),
        excludeSemantics: true,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Adjust slider page'),
            ),
            body: Center(
                child: Column(children: [
              Semantics(
                excludeSemantics: false,
                child: ElevatedButton(
                    onPressed: () => print("hello"),
                    child: Text('Replay instructions')),
              )
            ]))));
  }
}

instructions() => {
      SemanticsService.announce(
          """Welcome, in this module you'll learn how to  increase and decrease slider value. A slider is a track that
          contains values between a minimum and a maximum. Sliders are often used to adjust times. For example: song times
          or video times. You can also adjust this phone's volume using a slider. To start you will try and increase a slider's
          value. To increase the value, swipe up. To continue, increase the slider value to 100%""",
          TextDirection.ltr)
    };
