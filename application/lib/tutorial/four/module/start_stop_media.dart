import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:chewie/chewie.dart';

class StartStopMedia extends StatefulWidget {
  const StartStopMedia({super.key});

  @override
  State<StartStopMedia> createState() => _StartStopMediaState();
}

class _StartStopMediaState extends State<StartStopMedia> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  //late Future<void> _initialiseVideoPlayerFuture;

  bool _spokenIntro = false;
  bool _hasPlayed = false;
  bool _hasPaused = false;
  final FlutterTts tts = FlutterTts();

  startStopMediaState() async {
    tts.setLanguage("en-US");
    tts.setSpeechRate(0.5);
    tts.setVolume(1.0);
  }

  @override
  void initState() {
    //NEED TO ADD LISTENERS FOR WHEN VIDEO PAUSED/PLAYED ETC!!!!!!
    super.initState();

    _videoPlayerController =
        VideoPlayerController.asset('assets/video_test.mp4');

    _videoPlayerController.initialize().then(
          (_) => setState(
            () => _chewieController = ChewieController(
              videoPlayerController: _videoPlayerController,
              aspectRatio: 16 / 9,
            ),
          ),
        );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> _speakIntro() async {
    await tts.speak(
        "In this tutorial, you will be learning how to start and stop a video. To start, double tap your screen to bring up the media controller and find the play button. Dobule tap to start playing the video");
  }

  void _speakPause() {
    tts.stop();
    tts.speak(
        "Great job! You have played the video. Now we will try to pause the video. To pause the video, bring up the media controller and find the pause button. Double tap on the button to pause the video.");
  }

  Future<void> _speakOutro() async {
    tts.stop();
    tts.speak(
        "Great job! You have paused the video. Congratulations on completing this lesson on how to start and stop a video. Sending you back to the lesson page.");
    await tts.awaitSpeakCompletion(true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
            aspectRatio: 16 / 9, child: Chewie(controller: _chewieController)),
      ],
    );
  }
  /*
  @override
  Widget build(BuildContext context) {
    if (!_spokenIntro) {
      _speakIntro();
      _spokenIntro = true;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Start and Stop Media Module'),
      ),
      body: FutureBuilder(
        future: _initialiseVideoPlayerFuture,
        builder: (context, snapshot) {
          if (_controller.value.isPlaying) {
            _speakPause();
            _hasPlayed = true;
          }
          if (_hasPlayed == true & !_controller.value.isPlaying) {
            _speakOutro();
            _hasPaused = true;
          }
          if ((_hasPlayed == true) & (_hasPaused == true)) {
            Navigator.pop(context);
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
  */
}
