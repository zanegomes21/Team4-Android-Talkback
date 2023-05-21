import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class OpenRecent extends StatefulWidget {
  const OpenRecent({Key? key}) : super(key: key);

  @override
  State<OpenRecent> createState() => _OpenRecent();
}

class _OpenRecent extends State<OpenRecent> with WidgetsBindingObserver {
  String introSpeech = """Welcome""";
  String middleSpeech = """middleSpeech""";
  String endSpeech = """endSpeech""";
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
      _speakLines(flutterTts!, introMessage);
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
    if (isIntro) {
      setState(() {
        isIntro = false;
        isMiddle = true;
      });
    }
    if (isMiddle) {
      setState(() {
        isMiddle = false;
        isEnd = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SemanticsService.announce(
        "To open recent apps, swipe left then up gesture in one motion",
        TextDirection.ltr);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Disable back button
          title: const Text("Open Recent Module"),
        ),
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
