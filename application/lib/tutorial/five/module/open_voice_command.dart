import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class OpenVoiceCommand extends StatefulWidget {
  const OpenVoiceCommand({Key? key}) : super(key: key);

  @override
  State<OpenVoiceCommand> createState() => _OpenVoiceCommand();
}

class _OpenVoiceCommand extends State<OpenVoiceCommand> {
  String introMessage = """
    Open Voice Commands using gestures.
    Welcome, in this module you will learn to enabel voice commands.
    To do this, you need to perform a swipe right then up gestrue in one motion. 
    When prompted for a voice command, say "HELP". 
    This will take you to the voice command help section.
    Return to the tutorial whenever you want by going back. 
    Good luck!
    """;

  @override
  void initState() {
    super.initState();

    // Initilizing tts engine
    _initTextToSpeech().then((flutterTts) {
      _speakLines(flutterTts, introMessage);
    });

  }

  Future<FlutterTts> _initTextToSpeech() async {
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setLanguage('en-US');
    flutterTts.setSpeechRate(0.45);
    return flutterTts;
  }

  void _speakLines(FlutterTts flutterTts, String message) async {

    List<String> lines = message.split('\n');
    for (String line in lines) {
      if (line.trim().isNotEmpty) {
        await flutterTts.awaitSpeakCompletion(true);  // Wait for tts occouring prior to finish
        await flutterTts.speak(line.trim());          // Read line form messager after prior tts
      }
    }
    await flutterTts.awaitSpeakCompletion(true);      // Wait for last tts to complete
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      // Title
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable back button
        title: const Text("open_voice_command"),
      ),

      // Body
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          // All the elements of the page
          children: [

            // Intor of module
            FutureBuilder<FlutterTts>(
                future: _initTextToSpeech(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      _speakLines(snapshot.data!, introMessage);
                    }
                    return const SizedBox.shrink();
                  } else {
                    return const CircularProgressIndicator();
                  }
                })

          ],
        ),
      ),
    );
  }
}
