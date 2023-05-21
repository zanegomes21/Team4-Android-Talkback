import 'package:flutter/material.dart';
import 'package:application/routes.dart';
import 'package:flutter/services.dart';

import 'package:flutter_tts/flutter_tts.dart';

class OpenVoiceCommand extends StatefulWidget {
  const OpenVoiceCommand({Key? key}) : super(key: key);

  @override
  State<OpenVoiceCommand> createState() => _OpenVoiceCommand();
}

class _OpenVoiceCommand extends State<OpenVoiceCommand>
    with WidgetsBindingObserver {
  String introMessage = """
    Welcome, in this module you will learn to enabel voice commands.
    To do this, you need to perform a swipe right then up gestrue in one motion. 
    When prompted for a voice command, say "HELP". 
    This will take you to the voice command help section.
    Return to the tutorial whenever you want by going back. 
    Good luck!
    """;

  String instructionMessage = """
    Well Done!
    Next we will put some voice commands into action.
    Now that you know some voice commands, we will show you how to increase Talk
    Backs reading speed using voice command.
    Swipe right when ready.
    """;

  String fasterSpeechTitle = "Swipe right";

  String fasterSpeechOne = """
    To make me speak faster swipe right then up with one finger to open voice command
    gain. Do this gesture, then say speak faster. And move to the next element when 
    you are done. Good luck!
    """;

  String fasterSpeechTwo = """
    I am now speaking faster. When you have compleated listening to this text go 
    to the next element and select the button to finish the module.
    """;

  bool isIntro = true;
  bool isFasterSpee = false;
  bool isEnd = false;
  FlutterTts? flutterTts;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    flutterTts = initTts();
  }

  FlutterTts initTts() {
    String lang = 'en-US';
    double narrationSpeed = 0.45;

    FlutterTts flutterTts = FlutterTts();
    flutterTts.setLanguage(lang);
    flutterTts.setSpeechRate(narrationSpeed);
    return flutterTts;
  }

  void speak(int duration, String message) async {
    String line = message.replaceAll('\n', ' ');

    await Future.delayed(Duration(seconds: duration));

    flutterTts?.speak(line);
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
        isFasterSpee = true;
      });
    }
  }

  String returnPause = " " * 10;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    if (isIntro) {
      speak(0, introMessage);
    } else if (isFasterSpee) {
      speak(2, instructionMessage);
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(fasterSpeechTitle.replaceAll('\n', ' ')),
              Text(fasterSpeechOne.replaceAll('\n', ' ')),
              Text(fasterSpeechTwo.replaceAll('\n', ' ')),
              ElevatedButton(
                style: style,
                onPressed: () =>
                    {Navigator.pushNamed(context, Routes.tutorialFive)},
                child: const Text('Finish module'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(body: Container());

    /*// This attempts to read instructions to user before talkBack
      // reads screen elements to user.
      if (isSpeaking) {
        return const Center(child: CircularProgressIndicator());
      }
      */
  }
}
