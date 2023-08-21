
void main() => runSandbox(SandBoxMode());

class SandBoxMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture Sandbox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SandBoxHomePage(),
    );
  }
}

