import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressionTracker extends StatefulWidget {
  const ProgressionTracker({Key? key}) : super(key: key);

  @override
  ProgressionTrackerState createState() => ProgressionTrackerState();
}

class ProgressionTrackerState extends State<ProgressionTracker> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  bool exploreMenuByTouchModule = false;
  bool scrollingModule = false;
  bool goBackModule = false;
  bool adjustSliderModule = false;
  bool tutorialTwoChallenge = false;
  bool adjustReadingControlsModule = false;
  bool jumpTextModule = false;
  bool jumpControlsModule = false;
  bool jumpHeadersModule = false;
  bool jumpLinksModule = false;
  bool tutorialThreeChallenge = false;
  bool startStopMediaModule = false;
  bool mediaVolumeControlModule = false;
  bool tutorialFourChallenge = false;
  bool openRecentAppsModule = false;
  bool goToHomeScreenModule = false;
  bool openNotificationsModule = false;
  bool openTalkbackMenuModule = false;
  bool openVoiceCommandModule = false;
  bool tutorialFiveChallenge = false;
  bool virtualKeyboardModule = false;
  bool tutorialSixChallenge = false;
  bool calculatorAppModule = false;
  bool voiceRecorderAppModule = false;

  @override
  void initState() {
    super.initState();
    loadActivityStatus();
  }

  Future<void> loadActivityStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      exploreMenuByTouchModule =
          prefs.getBool('exploreMenuByTouchModule') ?? false;
      scrollingModule = prefs.getBool('scrollingModule') ?? false;
      goBackModule = prefs.getBool('goBackModule') ?? false;
      adjustSliderModule = prefs.getBool('adjustSliderModule') ?? false;
      tutorialTwoChallenge = prefs.getBool('tutorialTwoChallenge') ?? false;
      adjustReadingControlsModule =
          prefs.getBool('adjustReadingControlsModule') ?? false;
      jumpTextModule = prefs.getBool('jumpTextModule') ?? false;
      jumpControlsModule = prefs.getBool('jumpControlsModule') ?? false;
      jumpHeadersModule = prefs.getBool('ExploreMenuByTouchModule') ?? false;
      jumpLinksModule = prefs.getBool('jumpLinksModule') ?? false;
      tutorialThreeChallenge = prefs.getBool('tutorialThreeChallenge') ?? false;
      startStopMediaModule = prefs.getBool('startStopMediaModule') ?? false;
      mediaVolumeControlModule =
          prefs.getBool('mediaVolumeControlModule') ?? false;
      tutorialFourChallenge = prefs.getBool('tutorialFourChallenge') ?? false;
      openRecentAppsModule = prefs.getBool('openRecentAppsModule') ?? false;
      goToHomeScreenModule = prefs.getBool('goToHomeScreenModule') ?? false;
      openNotificationsModule =
          prefs.getBool('openNotificationsModule') ?? false;
      openTalkbackMenuModule = prefs.getBool('openTalkbackMenuModule') ?? false;
      openVoiceCommandModule = prefs.getBool('openVoiceCommandModule') ?? false;
      tutorialFiveChallenge = prefs.getBool('tutorialFiveChallenge') ?? false;
      virtualKeyboardModule = prefs.getBool('virtualKeyboardModule') ?? false;
      tutorialSixChallenge = prefs.getBool('tutorialSixChallenge') ?? false;
      calculatorAppModule = prefs.getBool('calculatorAppModule') ?? false;
      voiceRecorderAppModule = prefs.getBool('voiceRecorderAppModule') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Tutorial Two Module 1: ${exploreMenuByTouchModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Two Module 2: ${scrollingModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Two Module 3: ${goBackModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Two Module 4: ${adjustSliderModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Two Challenge: ${tutorialTwoChallenge ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Three Module 1: ${adjustReadingControlsModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Three Module 2: ${jumpTextModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Three Module 3: ${jumpControlsModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Three Module 4: ${jumpHeadersModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Three Module 5: ${jumpLinksModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Three Challenge: ${tutorialThreeChallenge ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Four Module 1: ${startStopMediaModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Four Module 2: ${mediaVolumeControlModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Four Challenge: ${tutorialFourChallenge ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Five Module 1: ${openRecentAppsModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Five Module 2: ${goToHomeScreenModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Five Module 3: ${openNotificationsModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Five Module 4: ${openTalkbackMenuModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Five Module 5: ${openVoiceCommandModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Five Challenge: ${tutorialFiveChallenge ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Six Module 1: ${virtualKeyboardModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Six Challenge: ${tutorialSixChallenge ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Seven Module 1: ${calculatorAppModule ? 'Completed' : 'Not Completed'}'),
            Text(
                'Tutorial Seven Module 2: ${voiceRecorderAppModule ? 'Completed' : 'Not Completed'}'),
          ],
        ),
      ),
    );
  }
}
