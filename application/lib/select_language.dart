// Page to select a language
import 'package:flutter/material.dart';
import 'package:application/resources/string/base.dart';
import 'package:application/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelect extends StatelessWidget {
  const LanguageSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a language"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                LanguageSupport.setLanguage(Language.english);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        const MyHomePage(title: 'Home Page'))
                  );

              },
              child: Text("English"),
            ),
            ElevatedButton(
              onPressed: () {
                LanguageSupport.setLanguage(Language.french);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        const MyHomePage(title: 'Home Page'))
                  );

              },
              child: Text("French"),
            ),
            ElevatedButton(
              onPressed: () {
                LanguageSupport.setLanguage(Language.spanish);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        const MyHomePage(title: 'Home Page'))
                  );

              },
              child: Text("Spanish"),
            ),
          ],
        ),
      ),
    );
  }
}
