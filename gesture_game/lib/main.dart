import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';

FlutterTts flutterTts = FlutterTts();

enum GestureType {
  DoubleTap,
  LongPress,
  VerticalSwipe,
  HorizontalSwipe,
}

class GestureMiniGame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GestureMiniGameState();
}

class GestureMiniGameState extends State<GestureMiniGame> {
  GestureType currentGesture = GestureType.DoubleTap;
  String instructionText = 'Game Starting...';
  bool isGameInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gesture Mini-Game")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: isGameInProgress ? null : startGame,
              child: Text("Start Game"),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onDoubleTap: () => checkGesture(GestureType.DoubleTap),
              onLongPress: () => checkGesture(GestureType.LongPress),
              onVerticalDragEnd: (_) => checkGesture(GestureType.VerticalSwipe),
              onHorizontalDragEnd: (_) =>
                  checkGesture(GestureType.HorizontalSwipe),
              child: Text(instructionText, style: TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }

  void startGame() {
    setState(() async {
      isGameInProgress = true;
      String startGameText = "Game Starting!";
      await flutterTts.speak(startGameText);
      getNextGesture();
    });
  }

  Future<void> getNextGesture() async {
    setState(() {
      currentGesture = getRandomGesture();
      instructionText = getGestureInstructionText(currentGesture);
    });
    await flutterTts.speak(instructionText);
  }

  GestureType getRandomGesture() {
    final random = Random();
    return GestureType.values[random.nextInt(GestureType.values.length)];
  }

  String getGestureInstructionText(GestureType gesture) {
    switch (gesture) {
      case GestureType.DoubleTap:
        return "Double Tap";
      case GestureType.LongPress:
        return "Long Press";
      case GestureType.VerticalSwipe:
        return "Vertical Swipe";
      case GestureType.HorizontalSwipe:
        return "Horizontal Swipe";
      default:
        return "Get Ready!";
    }
  }

  Future<void> checkGesture(GestureType detectedGesture) async {
    if (isGameInProgress && currentGesture == detectedGesture) {
      String congrats = "Good Job!";
      await flutterTts.speak(congrats);
      getNextGesture();
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: GestureMiniGame(),
  ));
}
