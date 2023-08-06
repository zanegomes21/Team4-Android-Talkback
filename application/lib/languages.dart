import 'package:flutter/material.dart';
class Language extends StatelessWidget {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // page with title and back button, buttons for each tutorial
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutorials"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () { },
              child: const Text("English"),
            ),
            ElevatedButton(
              onPressed: () { },
              child: const Text("Not English"),
            ),
          ],
        ),
      ),
    );
  }
}
