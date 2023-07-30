import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_tts/flutter_tts.dart';

class OpenTalkbackMenu extends StatefulWidget {
  const OpenTalkbackMenu({Key? key}) : super(key: key);

  @override
  State<OpenTalkbackMenu> createState() => _OpenTalkbackMenu();
}

class _OpenTalkbackMenu extends State<OpenTalkbackMenu> with WidgetsBindingObserver {
  String introSpeech =
  """
  Welcome. In this module, you will learn how to open the Talkback Menu. The Talkback menu allows you use commands to read, edit text, control speech output, change Talkback settings, and more. To open the menu, perform a swipe up, then right gesture in one motion. Or a swipe down, then right gesture. You may now start.
      """;
  String feedbackSpeech =
  """
  Great job. You have opened the Talkback menu. Feel free to navigate around to see what you can do. Once you are done, go to the bottom of the menu and exit. You may now start.
      """;
  String endSpeech =
  """
  Well done! You now know how to open and close the Talkback Menu. Once again, to do this you have to swipe up, or a swipe down gesture then swipe right immediately. You have completed the lesson. Double tap to return to the main menu.
       """;
  bool isIntro = true;
  bool isFeedback = false;
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
    if (isIntro) {
      setState(() {
        isIntro = false;
        isFeedback = true;
      });
    }
    else if (isFeedback) {
      setState(() {
        isFeedback = false;
        isEnd = true;
      });
    }
    else if (isEnd) {
      setState(() {
        isFeedback = false;
        isEnd = true;
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
                        // This reads instructions and checks for successful
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
                if (isFeedback)
                  FutureBuilder<FlutterTts>(
                      future: _initTextToSpeech(),
                      builder: (context, snapshot) {
                        // This reads instructions and checks for successful
                        // execution of said instructions.
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            _speakLines(snapshot.data!, feedbackSpeech);
                          }
                          return const SizedBox();
                        } else {
                          return const CircularProgressIndicator();
                        }
                      })
                  else if (isEnd)
                      FutureBuilder<FlutterTts>(
                          future: _initTextToSpeech(),
                          builder: (context, snapshot) {
                            // This reads instructions and checks for successful
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
