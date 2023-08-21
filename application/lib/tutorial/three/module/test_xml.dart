import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart';
import 'package:xml/xpath.dart';

class XMLModule extends StatefulWidget {
  const XMLModule({super.key});

  @override
  State<StatefulWidget> createState() => XMLModuleState();
}

class XMLModuleState extends State<XMLModule> {
  String xmlString = "Not loaded";
  String instructions = '';

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  Future<void> loadAsset() async {
    final data = await rootBundle.loadString('assets/strings.xml');
    final document = XmlDocument.parse(data);
    instructions = document
        .xpath(
            "//language[@name='english']/tutorials/tutorial[@name='3']/modules/module[@name='challenge']/string[@name='instruction']")
        .single
        .innerText;
    setState(() {
      xmlString = data.substring(1, 20);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true, // Disable back button
          title: const Text('Tutorial 3 challenge'),
        ),
        body: Column(
          children: [Text(instructions)],
        ));
  }
}
