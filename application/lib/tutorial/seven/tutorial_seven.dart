import 'package:flutter/material.dart';
import 'package:application/tutorial/seven/module/module.dart';
import 'package:application/tutorial/seven/challenge.dart';

class TutorialSeven extends StatelessWidget {
  const TutorialSeven({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tutorial 7")),
      body: const Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Content go in here
              children: [
            const ElevatedButton(
            onPressed: null,
            child: Text("Calculator Module"),
          ),
          const ElevatedButton(
              onPressed: null,
              child: Text("Voice Recorder Module")
          )])),
    );
  }
}
