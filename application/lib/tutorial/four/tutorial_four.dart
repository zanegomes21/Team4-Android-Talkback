import 'package:flutter/material.dart';

class TutorialFour extends StatelessWidget {
  const TutorialFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutorial 4"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: null,
              child: Text("Start and Stop Media"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Media Volume Control"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("End of Lesson Challenge"),
            ),
          ],
        ),
      ),
    );
  }
}
