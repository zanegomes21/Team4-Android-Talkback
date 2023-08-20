import 'package:flutter/material.dart';

class _ScaledText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry margin;
  final double textScaleFactor;
  final TextAlign textAlign;

  const _ScaledText(
      {required this.text,
      required this.margin,
      required this.textScaleFactor,
      required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: const Color(0xFF0000FF))),
      margin: margin,
      child: Text(
        text,
        textScaleFactor: textScaleFactor,
        textAlign: textAlign,
      ),
    );
  }
}

StatelessWidget _mainTitle = const _ScaledText(
    text: 'Baking recipes',
    margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
    textScaleFactor: 3,
    textAlign: TextAlign.center);

class _RecipeTitle extends _ScaledText {
  const _RecipeTitle({required super.text})
      : super(
            margin: const EdgeInsets.all(5),
            textScaleFactor: 2,
            textAlign: TextAlign.center);
}

class _RecipeDescription extends _ScaledText {
  const _RecipeDescription({required super.text})
      : super(
            margin: const EdgeInsets.all(5),
            textScaleFactor: 1,
            textAlign: TextAlign.center);
}

class LabelledImage extends StatelessWidget {
  final String label;
  final String imageName;

  const LabelledImage(
      {required this.label, required this.imageName, super.key});

  @override
  Widget build(BuildContext context) {
    return
        // margin: const EdgeInsets.symmetric(horizontal: 60),
        Semantics(
            label: label,
            child: Image(
              image: AssetImage(imageName),
              height: 150,
            ));
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
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Tutorial3BrowniePage()),
                      )
                    },
                child: const Text('Go to brownie recipe')),
            const _RecipeTitle(text: 'Cookies'),
            const LabelledImage(
                label: 'Picture of some cookies',
                imageName: 'assets/images/cookie.jpeg'),
            const _RecipeDescription(
                text:
                    'This scrumptious and chewy chocolate-chip cookie recipe is guaranteed to satisfy your sweet tooth!')
          ],
        )));
  }
}

class Ingredient extends StatefulWidget {
  final String name;

  const Ingredient({required this.name, super.key});

  @override
  State<StatefulWidget> createState() {
    return _IngredientState();
  }
}

class _IngredientState extends State<Ingredient> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(widget.name),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
    );
  }
}

class Tutorial3BrowniePage extends StatelessWidget {
  static const List<String> ingredients = [
    '125 grams of unsalted butter',
    '125 grams of dark baking chocolate',
    '3 eggs, lightly whisked',
    '1 and 1/2 cups of white sugar',
    '3/4 cups of plain flour',
    '1/4 cup of Dutch cocoa powder',
    '1 teaspoon of vanilla extract',
    'Pinch of salt'
  ];
  static const List<String> methodSteps = [
    'Step 1: Preheat oven to 180C or 160C fan forced. Grease a 20cm square cake pan and line with baking paper.',
    'Step 2: Place butter and chocolate in a heatproof bowl over a saucepan of simmering water (don\'t let the bowl touch the water). Stire with a metal spoon until melted. Remove from heat. Quickly stir in egg, sugar, flour, cocoa powder, vanilla and salt until just combined. Pour into prepared pan.',
    'Step 3: Bake for 30 minutes or until a skewer inserted in the centre comes out with moist crumbs clinging. Set aside to cool completely.'
  ];

  const Tutorial3BrowniePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true, // Disable back button
          title: const Text('Tutorial 3 challenge'),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const _RecipeTitle(text: 'Brownie recipe'),
            const LabelledImage(
                label: 'Picture of some brownies',
                imageName: 'assets/images/brownie.jpeg'),
            const _ScaledText(
              text: 'Ingredients',
              margin: EdgeInsets.symmetric(vertical: 10),
              textScaleFactor: 1.5,
              textAlign: TextAlign.left,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: ingredients.length,
                itemBuilder: (context, index) =>
                    Ingredient(name: ingredients[index])),
            const _ScaledText(
              text: 'Method',
              margin: EdgeInsets.symmetric(vertical: 10),
              textScaleFactor: 1.5,
              textAlign: TextAlign.left,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: methodSteps.length,
              itemBuilder: (context, index) => _ScaledText(
                text: methodSteps[index],
                margin: const EdgeInsets.all(10),
                textScaleFactor: 1,
                textAlign: TextAlign.left,
              ),
            )
          ],
        ))));
  }
}
