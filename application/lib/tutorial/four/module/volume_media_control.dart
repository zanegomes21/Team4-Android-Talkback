import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MediaVolumeControlPage extends StatefulWidget {
  const MediaVolumeControlPage({super.key});

  @override
  State<MediaVolumeControlPage> createState() => _MediaVolumeControlPageState();
}

class _MediaVolumeControlPageState extends State<MediaVolumeControlPage> {
  bool _hasSpokenIntro = false; // Whether the intro has been spoken yet
  bool _hasSpokenIncreaseVolume = false;
  bool _hasSpokenDecreaseVolume = false;
  double _volume = 50; // Current volume
  final FlutterTts tts = FlutterTts();

  mediaVolumeControlPageState() {
    tts.setLanguage("en-US");
    tts.setSpeechRate(0.5);
    tts.setVolume(1.0);
  }

  Future<void> _speakIntro() async {
    // SemanticsService.announce(
    //   "In this tutorial, you will be learning how to control media volume sliders to adjust volume. To start, find the play button then double tap to play the music.",
    //   TextDirection.ltr,
    // );
    await tts.speak("In this tutorial, you will be learning how to control media volume sliders to adjust volume. To start, find the play button then double tap to play the music.");
  }

  void _speakIncreaseVolume() {
    // SemanticsService.announce(
    //   "Great job! Now, go back to the slider and increase the media's volume above 75 by swiping up.",
    //   TextDirection.ltr,
    // );
    tts.speak("Great job! Now, go back to the slider and increase the media's volume above 75 by swiping up.");
  }

  void _speakDecreaseVolume() {
    // SemanticsService.announce(
    //   "Current volume is set above 75. Now that you've learned how to increase the volume, we will try decreasing the volume below 25. To decrease the volume, swipe down.",
    //   TextDirection.ltr,
    // );
    tts.speak("Current volume is set above 75. Now that you've learned how to increase the volume, we will try decreasing the volume below 25. To decrease the volume, swipe down.");
  }

  Future<void> _speakOutro() async{
    // SemanticsService.announce(
    //   "Current volume is set below 25. Congratulations on completing this lesson. Sending you back to the lesson page.",
    //   TextDirection.ltr,
    // );
    tts.speak("Current volume is set below 25. Congratulations on completing this lesson. Sending you back to the lesson page.");
  }

  @override
  Widget build(BuildContext context) {
    // Speak intro if first time opening this page.
    if (!_hasSpokenIntro) {
      _speakIntro();
      _hasSpokenIntro = true;
    }

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Disable back button
          title: const Text("Media Volume Control Module"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (_hasSpokenIntro) {
                    _speakIncreaseVolume();
                    _hasSpokenIncreaseVolume = true;
                  }
                },
                child: const Text('Play'),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                },
                child: const Text('Pause'),
              ),
            ]),
            const SizedBox(height: 50),
            Slider(
              value: _volume,
              min: 0,
              max: 100,
              divisions: 20,
              label: _volume.round().toString(),
              onChanged: (double value) async {
                if(value >= 75 && _hasSpokenIncreaseVolume){
                  _speakDecreaseVolume();
                  _hasSpokenDecreaseVolume = true;
                }
                if(value <= 25 && _hasSpokenDecreaseVolume){
                  await _speakOutro();
                  Navigator.pop(context);
                }

                setState(() {
                  _volume = value;
                });
              },
            ),
          ]),
        ));
  }
}
