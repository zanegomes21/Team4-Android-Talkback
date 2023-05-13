// Ported code from talkbacktutorial/lessons/challenges/challenge.kt in the
// original application

import 'package:flutter/material.dart';
import 'dart:math';

abstract class Challenge{
  final id = Random().nextInt(1000);

  void startScreen(BuildContext context);
}