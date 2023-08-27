import 'package:application/common/instruction_card.dart';
import 'package:flutter/material.dart';

//page1
class JumpText1 extends StatelessWidget {
  const JumpText1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: <Widget>[
      GestureDetector(
        onDoubleTap: () {
          //navigate to JumpText2
        },
      ),
      const InstructionsCard(
        instruction: 'instruction',
      )
    ])));
  }
}

// //page2
// class JumpText2 extends StatelessWidget {}

// //page3
// class JumpText3 extends StatelessWidget {}

// //page4
// class JumpText4 extends StatelessWidget {}

// //page5
// class JumpText5 extends StatelessWidget {}
