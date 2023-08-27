import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';

FlutterTts flutterTts = FlutterTts();

enum GestureType {
  DoubleTap,
  LongPress,
  VerticalSwipe,
  HorizontalSwipe,
  SingleTap
}

class GestureMiniGame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GestureMiniGameState();
}

class GestureMiniGameState extends State<GestureMiniGame> {
  GestureType currentGesture = GestureType.DoubleTap;
  String instructionText = 'Game Starting...';
  bool isGameInProgress = false;
  int numRounds = 0;
  int highScore = 0;

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
        onTap: () => checkGesture(GestureType.SingleTap),
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
                      child:
                          Text(instructionText, style: TextStyle(fontSize: 40)),
                    ))
                  ],
                )
              : Column(
                  // if false show start game button
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Highscore: $highScore'),
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
      getNextGesture();
    });
  }

  Future<void> stopGame() async {
    setState(() {
      isGameInProgress = false;
      numRounds = 0;
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
    var random = Random();
    GestureType temp =
        GestureType.values[random.nextInt(GestureType.values.length)];
    while (temp == currentGesture) {
      random = Random();
      temp = GestureType.values[random.nextInt(GestureType.values.length)];
    }
    return temp;
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
      case GestureType.SingleTap:
        return "Single Tap";
      default:
        return "Get Ready!";
    }
  }

  Future<void> checkGesture(GestureType detectedGesture) async {
    if (numRounds == 10) {
      await flutterTts.speak("Congratulations");
      stopGame();
    } else if (isGameInProgress && currentGesture == detectedGesture) {
      numRounds += 1;
      if (numRounds >= highScore) {
        highScore = numRounds;
      }
      getNextGesture();
    } else {
      await flutterTts.speak(instructionText);
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: GestureMiniGame(),
  ));
}
