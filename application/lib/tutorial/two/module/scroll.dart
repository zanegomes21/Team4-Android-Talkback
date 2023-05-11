import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  bool _hasSpokenIntro = false; // Whether the intro has been spoken yet
  final int _numButtons =
      15; // Number of buttons to list, should be large enough to necessitate scrolling
  Axis _axis = Axis.vertical; // Axis to align buttons
  String _successButtonText = "Continue"; // Text to show on last button in list
  final ButtonStyle _buttonStyle =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  void _speakIntro() {
    SemanticsService.announce(
      "To scroll down, place two fingers on the screen at the same time, then swipe upwards with both of them. To scroll up, swipe with two fingers in the opposite direction. To finish, find the Continue button at the bottom of this vertical menu, then double tap it to continue.",
      TextDirection.ltr,
    );
  }

  void _speakHorizontal() {
    SemanticsService.announce(
      "To scroll right, swipe left with two fingers. To scroll left, swipe with two fingers in the opposite direction. To finish, tap the Finish button at the far right of this page.",
      TextDirection.ltr,
    );
  }

  void _speakSuccess() {
    SemanticsService.announce(
      "You finished this module! Taking you back to the Tutorial.",
      TextDirection.ltr,
    );
  }

  void _onTapSuccessButton(BuildContext context) {
    if (_axis == Axis.vertical) {
      setState(() {
        _axis = Axis.horizontal;
        _successButtonText = "Finish";
      });
      _speakHorizontal();
      return;
    }

    _speakSuccess();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Speak intro if first time opening this page.
    if (!_hasSpokenIntro) {
      _speakIntro();
      _hasSpokenIntro = true;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable back button
        title: const Text("Scrolling Module"),
      ),
      body: Center(
          child: ListView.separated(
        scrollDirection: _axis,
        padding: const EdgeInsets.all(30),
        itemCount: _numButtons,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            padding: _axis == Axis.vertical
                ? const EdgeInsets.symmetric(vertical: 20)
                : const EdgeInsets.symmetric(horizontal: 20),
            child: index == _numButtons - 1
                ? ElevatedButton(
                    onPressed: () {
                      _onTapSuccessButton(context);
                    },
                    child: Text(_successButtonText))
                : ElevatedButton(
                    onPressed: null, child: Text('Item ${index + 1}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )),
    );
  }
}
