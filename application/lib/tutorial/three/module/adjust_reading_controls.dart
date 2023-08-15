import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText:
              'For modules in this lesson, you\'ll need to use horizontal swipes to navigate',
        ),
      ),
    );
  }
}

class AdjustReadingControls extends StatelessWidget {
  const AdjustReadingControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adjusting reading controls'),
      ),
      body: const Center(
        child: TextBox(),
      ),
    );
  }
}
