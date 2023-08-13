import 'package:flutter/material.dart';
import 'dart:math';

enum GestureType {
  DoubleTap,
  LongPress,
  VerticalSwipe,
  HorizontalSwipe,
}

class GestureMiniGame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureMiniGameState();
  }
}

class GestureMiniGameState extends State<GestureMiniGame> {
  late GestureType currentGesture;
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
              onHorizontalDragEnd: (_) => checkGesture(GestureType.HorizontalSwipe),

              child: Text(instructionText, style: TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }

  void startGame() {
    setState(() {
      isGameInProgress = true;
    });

    // Show "Get Ready!" for 2 seconds before starting the game
    Future.delayed(Duration(seconds: 2), () {
      getNextGesture();
    });
  }

  void getNextGesture() {
    setState(() {
      currentGesture = getRandomGesture();
      instructionText = getGestureInstructionText(currentGesture);
    });
  }

  GestureType getRandomGesture() {
    Random random = Random();
    int randomIndex = random.nextInt(GestureType.values.length);
    return GestureType.values[randomIndex];
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

  void checkGesture(GestureType detectedGesture) {
    if (isGameInProgress) {
      if (currentGesture == detectedGesture) {
        getNextGesture();
      }
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: GestureMiniGame(),
  ));
}
