import 'package:application/common/tutorial.dart';
import 'package:application/tutorial/three/module/challenge.dart';
import 'package:application/tutorial/three/module/test_xml.dart';

const TutorialMenu tutorialThree =
    TutorialMenu(title: "Tutorial 3", moduleButtons: [
  TutorialMenuButton(title: 'Challenge', module: Tutorial3Challenge()),
  TutorialMenuButton(title: 'XML test', module: XMLModule())
]);
