import 'package:flutter/material.dart';
import 'package:application/common/instruction_card.dart';

class AdjustReadingControls extends InstructionsCard {
  const AdjustReadingControls({super.key})
      : super(
            instruction:
                'For modules in this lesson, you will need to use horizontal swipes to navigate. This module covers how to AdjustReading the different reading modes. Swipe with 3 fingers horizontally on the screen to change reading modes.');
//add a method to check for a 3 finger horizontal swipe
}

class AdjustReadingControlsTypes extends InstructionsCard {
  const AdjustReadingControlsTypes({super.key})
      : super(
            instruction:
                'There are reading and navigation modes. Reading modes help you read consecutive characters, words, and paragraphs. Navigation modes help you move around the screen better, by jumping from button to button. Swipe horizontally with 1 finger to go to the next paragraph');
}

class AdjustReadingControlsFinal extends InstructionsCard {
  const AdjustReadingControlsFinal({super.key})
      : super(
            instruction:
                'That\'s all there is to the different reading controls. Go through all of them to understand them. Navigate to the bottom of the page and press the button to complete the module');
}

class AdjustReadingReadingControls extends StatelessWidget {
  const AdjustReadingReadingControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adjust reading controls'),
      ),
      body: Center(
          child: Column(children: [
        const AdjustReadingControls(),
        const AdjustReadingControlsTypes(),
        const AdjustReadingControlsFinal(),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Finish Module'))
      ])),
    );
  }
}
