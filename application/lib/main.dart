import 'package:application/routes.dart';
import 'package:application/tutorial/six/tutorial_six.dart';
import 'package:flutter/material.dart';
import 'package:application/tutorial/tutorial_main.dart';
import 'package:application/tutorial/two/tutorial_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Spike',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.home,
        routes: {
          Routes.home: (context) =>
              const MyHomePage(title: 'Flutter Demo Home Page'),
          Routes.tutorials: (context) => const TutorialMain(),
          Routes.tutorialTwo: (context) => const TutorialTwo(),
          Routes.tutorialSix: (context) => const TutorialSix(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //API button
            ElevatedButton(
              onPressed: () {
                print('button pressed!');
                //do something
              },
              child: Text('API'),
            ),
            Text('API results'),

            //Text to Voice text
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('The quick brown fox jumped over the fence'),
            ),

            //Voice to Text Button
            ElevatedButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: const Icon(Icons.record_voice_over),
            ),
            Text('Voice Input'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Gesture'),
        backgroundColor: Colors.blue,
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gesture),
            label: 'Gesture',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Tutorials',
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: ((index) {
          String path = Routes.home;
          switch (index) {
            case 0:
              //home
              break;
            case 1:
              // business
              break;
            case 2:
              // tutorials
              path = Routes.tutorialSix;
              break;
          }
          Navigator.pushNamed(context, path);
        }),
      ),
    );
  }
}
