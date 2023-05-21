import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class GoHome extends StatefulWidget {
  const GoHome({Key? key}) : super(key: key);

  @override
  State<GoHome> createState() => _GoHome();
}

class _GoHome extends State<GoHome> with WidgetsBindingObserver {
  String introSpeech = """Welcome, in this module you will learn how to 
      return to the home screen from inside an application, 
      to perform this task, swipe up then left, try it now, 
      then return to the tutorial after you have reached the 
      home screen by swiping left then up to open the recent apps, 
      then double tap to ruturn to this app
      """;
  String middleSpeech = """Good, you are back, this gesture is useful 
      as it allows you to return to the home screen at any time no matter 
      where you are, now do it again, remember the gesture is swipe up then 
      left, return to this app by opening recent apps page just like before.
      """;
  String endSpeech =
      """Nice, you have navigated back to this screen, you have now learnt 
      how to use the go to home screen gesture, sending you to the main menu
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

    if (state != AppLifecycleState.resumed) {
      return;
    }

    changeStage();
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
                      return const SizedBox();
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
                      return const SizedBox();
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
                      return const SizedBox();
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
          ],
        )));
  }
}
