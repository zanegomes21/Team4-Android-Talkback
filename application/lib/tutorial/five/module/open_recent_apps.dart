import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:application/tutorial/five/module/open_recent_apps.dart';


class OpenRecentAppsPage extends StatefulWidget {
  const OpenRecentAppsPage({super.key});

  @override
  State<OpenRecentAppsPage> createState() => _OpenRecentAppsPageState();
}

class _OpenRecentAppsPageState extends State<OpenRecentAppsPage> {
  bool _hasSpokenIntro = false; // Whether the intro has been spoken yet
  final FlutterTts tts = FlutterTts();


  OpenRecentAppsPageState() async {
    tts.setLanguage("en-US");
    tts.setSpeechRate(0.5);
    tts.setVolume(1.0);
  }

  Future<void> _speakIntro() async {
    await tts.speak("Welcome. In this module, you will learn how to open the recents menu and open recent apps. The recents menu is a handy way to quickly switch between frequently used apps. This can be done in two different ways. Firstly, perform a swipe left then up gesture in one motion. Once completed, select and double tap the tutorial to return to the lesson. You may now start.");
  }

  Future<void> _speakOutro() async{
    tts.speak("Great job. You have correctly opened the recents menu and returned to the tutorial. Now to try with a different method. Double tap to continue.");
  }

  @override
  Widget build(BuildContext context) {
    // Speak intro if first time opening this page.
    // if (!_hasSpokenIntro) {
    //   _speakIntro();
    //   _hasSpokenIntro = true;
    // }

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Disable back button
          title: const Text("Open Recent Apps Module"),
        ),
        body: Center(
          child: const Text(
              "Welcome. In this module, you will learn how to open the recents menu and open recent apps. The recents menu is a handy way to quickly switch between frequently used apps. This can be done in two different ways. Firstly, perform a swipe left then up gesture in one motion. Once completed, select and double tap the tutorial to return to the lesson. You may now start.",
              textAlign: TextAlign.center
          ),
        )
    );
  }
}
