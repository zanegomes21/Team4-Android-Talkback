import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_tts/flutter_tts.dart';

class OpenRecent extends StatefulWidget {
  const OpenRecent({Key? key}) : super(key: key);

  @override
  State<OpenRecent> createState() => _OpenRecent();
}

class _OpenRecent extends State<OpenRecent> with WidgetsBindingObserver {
  String introSpeech =
      """Welcome, In this module you will learn how to open recent apps, 
      recent apps are a handy way to quickly switch between frequently used apps. 
      This can be done in two different ways, 
      firstly perform a swipe left then up gesture in one motion, 
      once completely return to the tutorial.
      """;
  String middleSpeech =
      """Great job, you have correctly opened the recent app menu and returned 
      to the tutorial, now to try with a different method. 
      Try to open the recent apps menu using the recent button in the bottom right 
      or bottom left corner of your phone, you can double tap this button to open 
      the recent apps menu, if your device does not support the recent button or 
      you are unsure, perform a swipe left then up gesture again to open the recent 
      apps menu, then return to the tutorial.
      """;
  String endSpeech =
      """You have completed the open recent apps module, sending you to 
      the lessons screen.
      """;
  bool isIntro = true;
  bool isMiddle = false;
  bool isEnd = false;

  FlutterTts? flutterTts;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Initilizing tts engine
    _initTextToSpeech().then((value) {
      flutterTts = value;
      _speakLines(flutterTts!, introSpeech);
    });
  }

  Future<FlutterTts> _initTextToSpeech() async {
    String lang = 'en-US';
    double narrationSpeed = 0.45;

    FlutterTts flutterTts = FlutterTts();
    flutterTts.setLanguage(lang);
    flutterTts.setSpeechRate(narrationSpeed);
    return flutterTts;
  }

  void _speakLines(FlutterTts flutterTts, String message) async {
    String line =
        message.replaceAll('\n', ' '); // Multi line str into str array

    flutterTts.speak(line);
  }

  @override
  void dispose() {
    flutterTts!.stop();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      changeStage();
    }
  }

  void changeStage() {
    if (isMiddle) {
      setState(() {
        isMiddle = false;
        isEnd = true;
      });
    }
    if (isIntro) {
      setState(() {
        isIntro = false;
        isMiddle = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Body
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.

            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          // All the elements of the page
          children: [
            if (isIntro)
              // This speaks the intro
              FutureBuilder<FlutterTts>(
                  future: _initTextToSpeech(),
                  builder: (context, snapshot) {
                    // This reades instructions and checks for successfull
                    // execution of said instructions.
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        _speakLines(snapshot.data!, introSpeech);
                      }
                      return Column(
                        children: [
                          const SizedBox(),
                          Text(introSpeech), // Display the speech content
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            if (isMiddle)
              FutureBuilder<FlutterTts>(
                  future: _initTextToSpeech(),
                  builder: (context, snapshot) {
                    // This reades instructions and checks for successfull
                    // execution of said instructions.
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        _speakLines(snapshot.data!, middleSpeech);
                      }
                      return Column(
                        children: [
                          const SizedBox(),
                          Text(middleSpeech), // Display the speech content
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            if (isEnd)
              FutureBuilder<FlutterTts>(
                  future: _initTextToSpeech(),
                  builder: (context, snapshot) {
                    // This reades instructions and checks for successfull
                    // execution of said instructions.
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        _speakLines(snapshot.data!, endSpeech);
                      }
                      return Column(
                        children: [
                          const SizedBox(),
                          Text(endSpeech), // Display the speech content
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
          ],
        )));
  }
}
