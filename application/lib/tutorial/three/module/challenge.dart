import 'package:flutter/material.dart';
import 'package:application/routes.dart';
import 'package:flutter/semantics.dart';

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
    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
  final String instructions =
      'Welcome to Lesson 3\'s challenge. In this challenge you will be presented with a page containing baking recipes. Feel free to navigate through the different page elements using the appropriate reading controls. To complete the challenge, navigate to the cookie recipe and check the checkbox for the following ingredient … 1 egg';

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
            Semantics(
                label:
                    'Button, instructions. Double-tap to hear the instructions',
                child: ElevatedButton(
                    onPressed: () => SemanticsService.announce(
                        instructions, TextDirection.ltr),
                    child: const Text('INSTRUCTIONS'))),
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
                            builder: (context) => const BrownieRecipe()),
                      )
                    },
                child: const Text('Go to brownie recipe')),
            const _RecipeTitle(text: 'Cookies'),
            const LabelledImage(
                label: 'Picture of some cookies',
                imageName: 'assets/images/cookie.jpeg'),
            const _RecipeDescription(
                text:
                    'This scrumptious and chewy chocolate-chip cookie recipe is guaranteed to satisfy your sweet tooth!'),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CookieRecipe()),
                      )
                    },
                child: const Text('Go to cookie recipe')),
          ],
        )));
  }
}

class Ingredient extends StatefulWidget {
  final String name;
  final Function? onChanged;

  const Ingredient({required this.name, this.onChanged, super.key});

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
        widget.onChanged?.call();
      },
    );
  }
}

abstract class Tutorial3Recipe extends StatelessWidget {
  List<String> get ingredients;
  List<String> get methodSteps;
  LabelledImage get image;
  String get title;

  void successCallback(BuildContext context) {}
  bool checkSuccess(String checkboxText) {
    return false;
  }

  // int get successIndex => -1;

  const Tutorial3Recipe({super.key});

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
            _RecipeTitle(text: title),
            image,
            const _ScaledText(
              text: 'Ingredients',
              margin: EdgeInsets.symmetric(vertical: 10),
              textScaleFactor: 1.5,
              textAlign: TextAlign.left,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  if (checkSuccess(ingredients[index])) {
                    return Ingredient(
                        name: ingredients[index],
                        onChanged: () => successCallback(context));
                  }
                  return Ingredient(name: ingredients[index]);
                }),
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

class BrownieRecipe extends Tutorial3Recipe {
  @override
  String get title => 'Brownie recipe';

  @override
  List<String> get ingredients => [
        '125 grams of unsalted butter',
        '125 grams of dark baking chocolate',
        '3 eggs, lightly whisked',
        '1 and 1/2 cups of white sugar',
        '3/4 cups of plain flour',
        '1/4 cup of Dutch cocoa powder',
        '1 teaspoon of vanilla extract',
        'Pinch of salt'
      ];

  @override
  List<String> get methodSteps => [
        'Step 1: Preheat oven to 180C or 160C fan forced. Grease a 20cm square cake pan and line with baking paper.',
        'Step 2: Place butter and chocolate in a heatproof bowl over a saucepan of simmering water (don\'t let the bowl touch the water). Stire with a metal spoon until melted. Remove from heat. Quickly stir in egg, sugar, flour, cocoa powder, vanilla and salt until just combined. Pour into prepared pan.',
        'Step 3: Bake for 30 minutes or until a skewer inserted in the centre comes out with moist crumbs clinging. Set aside to cool completely.'
      ];

  @override
  LabelledImage get image => const LabelledImage(
      label: 'Picture of some brownies',
      imageName: 'assets/images/brownie.jpeg');

  const BrownieRecipe({super.key});
}

class CookieRecipe extends Tutorial3Recipe {
  final String successText =
      'You have successfully completed Lesson 3\'s challenge. Sending you to the main menu.';

  @override
  String get title => 'Cookie recipe';

  @override
  List<String> get ingredients => [
        '½ cup of white sugar',
        '½ cup of brown sugar',
        '150 grams of softened butter',
        '1 teaspoon of vanilla extract',
        '1 and ¾ cups of plain flour',
        '1 egg',
        '1 cup of chocolate chips'
      ];

  @override
  List<String> get methodSteps => [
        'Step 1: Preheat oven to 180C or 160C fan-forced. Line 2 baking trays with baking paper. Using an electric mixer or whisking by hand, beat butter and sugars, and 1-2 minutes or until smooth and well combined. Beat in egg and vanilla until combined.',
        'Step 2: Stir in flour. Stir in chocolate chips. Roll 2 level tablespoonfuls of mixture into balls and place on prepared trays, 3cm apart. Press down slightly. Decorate with extra chocolate chips.',
        'Step 3: Bake for 15-18 minutes or until light golden and cooked. Transfer to a wire rack to cool. Store in an airtight container for up to 1 week.',
      ];

  @override
  LabelledImage get image => const LabelledImage(
      label: 'Picture of some cookies', imageName: 'assets/images/cookie.jpeg');

  const CookieRecipe({super.key});

  @override
  void successCallback(BuildContext context) {
    // SemanticsService.announce(successText, TextDirection.ltr)
    //     .then((value) => print('Only after it\'s finished'));
    Navigator.popUntil(context, ModalRoute.withName(Routes.tutorialThree));
  }

  @override
  bool checkSuccess(String checkboxText) {
    return checkboxText.contains('egg');
  }
}
