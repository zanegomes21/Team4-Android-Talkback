// Page to select a language
import 'package:flutter/material.dart';
import 'package:application/resources/string/base.dart';
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
                Navigator.pop();
              },
              child: Text("English"),
            ),
            ElevatedButton(
              onPressed: () {
                LanguageSupport.setLanguage(Language.french);
                Navigator.pop();
              },
              child: Text("French"),
            ),
            ElevatedButton(
              onPressed: () {
                LanguageSupport.setLanguage(Language.spanish);
                Navigator.pop();

              },
              child: Text("Spanish"),
            ),
          ],
        ),
      ),
    );
  }
}
