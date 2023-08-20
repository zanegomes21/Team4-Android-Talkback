import 'package:flutter/material.dart';

class _ScaledText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry margin;
  final double textScaleFactor;

  const _ScaledText(
      {required this.text,
      required this.margin,
      required this.textScaleFactor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: const Color(0xFF0000FF))),
      margin: margin,
      child: Text(
        text,
        textScaleFactor: textScaleFactor,
        textAlign: TextAlign.center,
      ),
    );
  }
}

StatelessWidget _mainTitle = const _ScaledText(
    text: 'Baking recipes',
    margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
    textScaleFactor: 3);

class _RecipeTitle extends _ScaledText {
  const _RecipeTitle({required super.text})
      : super(margin: const EdgeInsets.all(5), textScaleFactor: 2);
}

class _RecipeDescription extends _ScaledText {
  const _RecipeDescription({required super.text})
      : super(margin: const EdgeInsets.all(5), textScaleFactor: 1);
}

class LabelledImage extends StatelessWidget {
  final String label;
  final String imageName;

  const LabelledImage(
      {required this.label, required this.imageName, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 60),
        child: Semantics(
            label: label, child: Image(image: AssetImage(imageName))));
  }
}

class Tutorial3Challenge extends StatelessWidget {
  const Tutorial3Challenge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true, // Disable back button
          title: const Text('Tutorial 3 challenge'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _mainTitle,
            const _RecipeTitle(text: 'Brownies'),
            const LabelledImage(
                label: 'Picture of some brownies',
                imageName: 'assets/images/brownie.jpeg'),
            const _RecipeDescription(
                text:
                    'This gooey brownie recipe is a crowd pleaser and is so quick and easy to make!'),
            const _RecipeTitle(text: 'Cookies'),
            const LabelledImage(
                label: 'Picture of some cookies',
                imageName: 'assets/images/cookie.jpeg'),
            const _RecipeDescription(
                text:
                    'This scrumptious and chewy chocolate-chip cookie recipe is guaranteed to satisfy your sweet tooth!')
          ],
        ));
  }
}
