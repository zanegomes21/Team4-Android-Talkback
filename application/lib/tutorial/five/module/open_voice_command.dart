import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import 'package:flutter_tts/flutter_tts.dart';

class OpenVoiceCommand extends StatefulWidget {
  const OpenVoiceCommand({Key? key}) : super(key: key);

  @override
  State<OpenVoiceCommand> createState() => _OpenVoiceCommand();
}

class _OpenVoiceCommand extends State<OpenVoiceCommand>
    with WidgetsBindingObserver {
  String introMessage = """
    Open Voice Commands using gestures.
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
    """;

  String fasterSpeechTitle = "Swipe right.";

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
  bool isSpeaking = false;
  FlutterTts? flutterTts;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    initTts();
  }

  Future<void> initTts() async {
    String lang = 'en-US';
    double narrationSpeed = 0.45;

    FlutterTts flutterTts = FlutterTts();
    await flutterTts.setLanguage(lang);
    await flutterTts.setSpeechRate(narrationSpeed);
  }

  void speak(String message) async {
    setState(() {
      isSpeaking = true;
    });

    String line = message.replaceAll('\n', ' ');

    await flutterTts?.speak(line);

    setState(() {
      isSpeaking = false;
    });
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

  @override
  Widget build(BuildContext context) {

      if (isIntro) {
        speak(introMessage);
      } else if (isFasterSpee) {
        speak(instructionMessage);
      }

      /*// This attempts to read instructions to user before talkBack
      // reads screen elements to user.
      if (isSpeaking) {
        return const Center(child: CircularProgressIndicator());
      }
      */

    return Scaffold(
      // Title
      appBar: AppBar(
        title: const Text("Open Voice Commands"),
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
              // This is the instructions for the above intro
              const Text(
                'Swipe right then up\nTo open voice commands',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            if (isFasterSpee) Text(fasterSpeechTitle),
            if (isFasterSpee) Text(fasterSpeechOne),
            if (isFasterSpee) Text(fasterSpeechTwo)
          ],
        ),
      ),
    );
  }
}
