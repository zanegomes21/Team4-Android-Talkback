// Ported code from talkbacktutorial/lessons/modukes/module.kt in the original
// application
import 'package:flutter/material.dart';
import 'dart:math';

abstract class Module{
  late final String title;
  final id = Random().nextInt(1000);

  void startScreen(BuildContext context);
}
