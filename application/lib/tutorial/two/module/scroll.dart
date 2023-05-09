import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class Scroll extends StatelessWidget {
  const Scroll({Key? key}) : super(key: key);
  final int _numButtons = 20;

  @override
  Widget build(BuildContext context) {
    _speakIntro();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable back button
        title: const Text("Scrolling Module"),
      ),
      body: Center(
          child: ListView.separated(
        padding: const EdgeInsets.all(30),
        itemCount: _numButtons,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: index == _numButtons - 1
                ? ElevatedButton(
                    onPressed: () {
                      _onSuccess(context);
                    },
                    child: const Text('Finish module'))
                : ElevatedButton(
                    onPressed: null, child: Text('Button ${index + 1}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )),
    );
  }

  void _speakIntro() {
    SemanticsService.announce(
      "To scroll down, place two fingers on the screen at the same time, then swipe upwards with both of them. To scroll up, swipe with two fingers in the opposite direction. To finish, find the Continue button at the bottom of this vertical menu, then double tap it to continue.",
      TextDirection.ltr,
    );
  }

  void _speakSuccess() {
    SemanticsService.announce(
      "You finished this module! Taking you back to the Tutorial.",
      TextDirection.ltr,
    );
  }

  void _onSuccess(BuildContext context) {
    _speakSuccess();
    Navigator.pop(context);
  }
}
