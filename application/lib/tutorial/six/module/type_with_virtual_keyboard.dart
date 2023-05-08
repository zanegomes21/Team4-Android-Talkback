import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:application/resources/strings.xml';
class typeWithKeyboard extends StatelessWidget {
  const typeWithKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SemanticsService.announce(
        "To go back, swipe down then left with one finger in a continuous action. If multi-gestures are enabled, swipe with two fingers from the left or right side of the screen.",
        TextDirection.ltr);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable back button
        title: const Text("Go Back Module"),
      ),
    );
  }
}