import 'package:flutter/material.dart';
import 'package:talkbacktutorial/R.dart';
import 'package:talkbacktutorial/activities/modules/jumpnavigation/jump_navigation_part1_fragment.dart';
import 'package:talkbacktutorial/activities/modules/jumpnavigation/jump_navigation_part1_fragment.dart' as jump_navigation_part1_fragment;
import 'package:talkbacktutorial/databinding/activity_basic_frame_binding.dart';

class JumpHeadersActivity extends StatefulWidget {
    @override
    _JumpHeadersActivityState createState() => _JumpHeadersActivityState();
}

class _JumpHeadersActivityState extends State < JumpHeadersActivity > {
        late ActivityBasicFrameBinding binding;

        @override
        void initState() {
            super.initState();
            WidgetsBinding.instance!.addPostFrameCallback((_) {
                // Hiding Action Bar
                final actionBar = binding.getRoot().findAncestorOfType < AppBar > ();
                actionBar?.setVisible(false);
            });
        }

        @override
        Widget build(BuildContext context) {
            binding = ActivityBasicFrameBinding.inflate(
                LayoutInflater.from(context),
                null,
                false,
            );
