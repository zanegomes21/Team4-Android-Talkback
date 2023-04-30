import 'package:flutter/material.dart';

class TutorialTwo extends StatelessWidget {
  const TutorialTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // scaffold page
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutorial 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ElevatedButton(
              onPressed: null,
              child: Text("Go Back"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Scrolling"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Explore Menu"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Adjust Slide"),
            ),
          ],
        ),
      ),
    );
  }
}
