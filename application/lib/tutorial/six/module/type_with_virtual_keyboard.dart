import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:xml/xml.dart' as xml;

class TypeWithKeyboard extends StatelessWidget {
  const TypeWithKeyboard({Key? key}) : super(key: key);
  Future<String> getLessonFromXML(BuildContext context) async {
    //final file = File('text.xml');
    //final xmlString = file.readAsStringSync();
    String xmlString = await DefaultAssetBundle.of(context).loadString("lib/resources/test.xml");
    final document = xml.XmlDocument.parse(xmlString);
    final lessonNode = document.findElements("lesson6");
    //print(lessonNode.first.findElements('title').first.text);
    return lessonNode.first.findElements("virtual_keyboard").first.text;

  }
  @override
  Widget build(BuildContext context) {
    SemanticsService.announce(
        "To go back, swipe down then left with one finger in a continuous action. If multi-gestures are enabled, swipe with two fingers from the left or right side of the screen.",
        TextDirection.ltr);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable back button
        title: const Text("Go Back Module"),
      ),
      body: Center(
        child: Column(
          children: [FutureBuilder(
            future: getLessonFromXML(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
            TextField(
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
            ),
          ],
      ),
      ),
    );
  }
}
