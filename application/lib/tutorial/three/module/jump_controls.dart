import 'package:flutter/material.dart';
import 'package:talkbacktutorial/activities/modules/jumpnavigation/jump_navigation_part1_fragment.dart';
import 'package:talkbacktutorial/databinding/activity_basic_frame_binding.dart';

//This class creates the jump control widget itself 
class JumpControlsActivity extends StatefulWidget{
  @override
  _JumpControlsActivityState createState() => _JumpControlsActivityState();
}

class _JumpControlsActivityState extends State<JumpControlsActivity> {
  late ActivityBasicFrameBinding binding;

  @override
  void initState() {
    super.initState();
    binding = ActivityBasicFrameBinding();
    
    // Need to wait for UI to be built before updating the widget
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      navigateToJumpNavigationPart1Fragment();
    });
  }

  // This method finds jumpnavigationpart1 fragment
  void navigateToJumpNavigationPart1Fragment() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JumpNavigationPart1Fragment(
          navigationMode: NavigationMode.controls,
        ),
      ),
    );
  }

  //Building the widget Jump control activity.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jump Controls Activity'),
      ),
      body: Center(
        child: Text('Jump Controls Activity Content'),
      ),
    );
  }
}
