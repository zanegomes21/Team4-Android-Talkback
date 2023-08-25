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
      // body as gesture detector so that it detects gestures on the screen not the child components
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onDoubleTap: () => checkGesture(GestureType.DoubleTap),
        onLongPress: () => checkGesture(GestureType.LongPress),
        onVerticalDragEnd: (_) => checkGesture(GestureType.VerticalSwipe),
        onHorizontalDragEnd: (_) => checkGesture(GestureType.HorizontalSwipe),
        child: Center(
          // check if game in progress
          child: isGameInProgress
          // if true show instruction text and gesture detection widget
              ? Column(
            children: [
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: stopGame,
                child: Text("Stop Game", style: TextStyle(fontSize: 40)),
              ),
              Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(instructionText, style: TextStyle(fontSize: 40)),
                )
              )
            ],
          )
              : Column(
            // if false show start game button
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: startGame,
                  child:
                  Text("Start Game", style: TextStyle(fontSize: 40))),
              SizedBox(height: 30),
            ],
          ),
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

  void stopGame() {
    setState(() {
      isGameInProgress = false;
      instructionText = 'Game Starting!';
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