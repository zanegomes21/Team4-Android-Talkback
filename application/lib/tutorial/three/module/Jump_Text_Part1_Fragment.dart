import 'package:flutter/material.dart';
import 'package:talkbacktutorial/R.dart';
import 'package:talkbacktutorial/fragment_jump_text_module_part1_binding.dart';

class JumpTextPart1Fragment extends StatefulWidget{
  @override
  _JumpTextPart1FragmentState createState() => _JumpTextPart1FragmentState();
}

class _JumpTextPart1FragmentState extends State<JumpTextPart1Fragment>{
  late FragmentJumpTextModulePart1Binding binding;

  JumpTextPart1Fragment();
  @override
  Widget build(BuildContext context) {
    binding = FragmentJumpTextModulePart1Binding.inflate(
      LayoutInflater.from(context),
      null,
      false,
    );
    return binding.root;
  }

  @override
  void onViewCreated(BuildContext context){
    super.onViewCreated(context);
    setupContinueCard();
  }

  void setupContinueCard(){
    binding.continueCard.onTap = (){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => JumpTextPart2Fragment()
        ),
      );
    };
  }

  @override
  void dispose(){
    super.dispose();
  }
}