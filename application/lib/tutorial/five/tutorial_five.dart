import 'package:application/tutorial/five/module/go_home.dart';
import 'package:application/tutorial/five/module/open_notfication.dart';
import 'package:application/tutorial/five/module/open_recent.dart';
import 'package:application/tutorial/five/module/open_talkback_menu.dart';
import 'package:flutter/material.dart';

import 'package:application/tutorial/five/module/open_voice_command.dart';
//import 'package:application/tutorial/five/module/end_of_lesson_challenge.dart';

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
                  MaterialPageRoute(builder: (context) => const OpenRecent()),
                );
              },
              child: const Text("Open Recent Apps"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GoHome()),
                );
              },
              child: const Text("Go To Home Screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OpenNotification()),
                );
              },
              child: Text("Open Notification"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OpenTalkbackMenu()),
                );
              },
              child: Text("Open Talkback Menu"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OpenVoiceCommand()),
                );
              },
              child: const Text("Open Voice Command"),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text("End of Lesson Challenge"),
            ),
          ],
        ),
      ),
    );
  }
}

