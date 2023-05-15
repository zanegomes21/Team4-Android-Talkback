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
}
