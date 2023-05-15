import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StartStopMedia extends StatefulWidget {
  const StartStopMedia({super.key});

  @override
  State<StartStopMedia> createState() => _StartStopMediaState();
}

class _StartStopMediaState extends State<StartStopMedia> {
  late VideoPlayerController _controller;
  late Future<void> _initialiseVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=jNQXAC9IVRw');
    _initialiseVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Me at the zoo'),
      ),
      body: FutureBuilder(
        future: _initialiseVideoPlayerFuture,
        builder: (context, snapshot) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
