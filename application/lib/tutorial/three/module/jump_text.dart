import 'package:flutter/material.dart';
import 'package:lib/tutorial/three/module/Jump_Text_Part1_Fragment.dart';
import 'package:talkbacktutorial/databinding/activity_basic_frame_binding.dart';

class JumpTextActivity extends StatefulWidget{
  @override
_JumpTextActivityState createState() => _JumpTextActivityState();
}

class _JumpTextActivity extends State<JumpTextAcivityState> {
  late ActivityBasicFrameBinding binding;

  @override
  void initState() {
    super.initState();
    binding = ActivityBasicFrameBinding();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      navigateToJumpTextPart1Fragment();
    });
  }

  void navigateToJumpTextPart1Fragment() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JumpNavigationPart1Fragment(),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jump Text Activity'),
      ),
      body: Center(
        child: Text('Jump Text Activity Content'),
      ),
    );
  }
}
