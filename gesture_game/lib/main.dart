import 'package:flutter/material.dart';
import 'dart:math';

enum GestureType {
  DoubleTap,
  LongPress,
  VerticalSwipe,
  HorizontalSwipe,
}

class GestureChallenge extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureChallengeState();
  }
}
