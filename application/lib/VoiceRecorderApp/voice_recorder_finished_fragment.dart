import 'package:flutter/material.dart';

class VoiceRecorderFinishedFragment extends StatefulWidget{
  @override
  _VoiceRecorderFinishedFragment createState() => _VoiceRecorderFinishedFragment();
}

class _VoiceRecorderFinishedFragment extends State<VoiceRecorderFinishedFragment>{
  late Widget _layout;

  @override
  void initState() {
    super.initState();
    _layout = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () => finish(),
            child: const Text("Finish Lesson")
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _layout,)
    );
  }

  void finish(){
    Navigator.of(context).pop();
  }
  
}
