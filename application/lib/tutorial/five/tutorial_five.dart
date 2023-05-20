import 'package:flutter/material.dart';
import 'package:application/tutorial/five/module/open_recent_apps.dart';

class TutorialFive extends StatelessWidget {
  const TutorialFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutorial 5"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OpenRecentAppsPage()),
                );
              },
              child: Text("Open Recent Apps"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Go To Home Screen"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Open Notification"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Open Talkback Menu"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Open Voice Command"),
            )
          ],
        ),
      ),
    );
  }
}
