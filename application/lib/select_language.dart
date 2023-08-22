// Page to select a language
import 'package:flutter/material.dart';
import 'package:application/resources/string/base.dart';
import 'package:application/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:application/resources/string/global.dart' as global;

Future<void> set_language_pref(Language l) async {
      WidgetsFlutterBinding.ensureInitialized();
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt('language', l.index);
}

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
                set_language_pref(Language.english);
                
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
                set_language_pref(Language.french);
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
                set_language_pref(Language.spanish);
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
