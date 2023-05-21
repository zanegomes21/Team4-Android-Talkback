import 'package:flutter/material.dart';
import 'package:talkbacktutorial/R.dart';
import 'package:talkbacktutorial/fragment_jump_text_module_part1_binding.dart';

class JumpTextPart2Fragment extends StatefulWidget{
  @override
  _JumpTextPart2FragmentState createState() => _JumpTextPart2FragmentState();
}

class _JumpTextPart2FragmentState extends State<JumpTextPart2Fragment>{
  late FragmentJumpTextModulePart2Binding binding;

  @override
  Widget build(BuildContext context) {
    binding = FragmentJumpTextModulePart2Binding.inflate(
      LayoutInflater.from(context),
      null,
      false,
    );
    return binding.root;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      binding.continueText.onTap = onClickContinueLesson;
    });
  }

  void onClickContinueLesson() {
    updateModule();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => JumpTextPart3Fragment()
      ),
    );
  }

  void updateModule() {
    final moduleProgressionViewModel =
    ModuleProgressionViewModel(); 
    final selectedModuleName =
        InstanceSingleton.getInstanceSingleton().selectedModuleName;
    if (selectedModuleName != null) {
      moduleProgressionViewModel.markModuleCompleted(
          selectedModuleName, context);
    }
  }

  @override
  void dispose(){
    super.dispose();
  }
}