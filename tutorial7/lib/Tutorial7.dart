import 'package:flutter/material.dart';
import 'package:tutorial7/module.dart';
import 'package:tutorial7/challenge.dart';

class Tutorial7 extends StatelessWidget {
  Tutorial7({Key? key}) : super(key: key);
  final List<Module> modules = [
    //CalculatorAppModule(), VoiceRecorderAppModule
  ];
  final challenge = Null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tutorial 7")),
      body: const Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Content go in here
              children: [
            Text("Tutorial 7 description: blah"),
          ])),
    );
  }
}
