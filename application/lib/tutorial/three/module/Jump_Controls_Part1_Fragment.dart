import 'package:flutter/material.dart';
import 'package:talkbacktutorial/R.dart';
import 'package:talkbacktutorial/fragment_jump_controls_module_part1_binding.dart';

class JumpControlsPart1Fragment extends StatefulWidget {
    @override
    _JumpControlsPart1FragmentState createState() => _JumpControlsPart1FragmentState();
}

class _JumpControlsPart1FragmentState extends State < JumpControlsPart1Fragment > {
    late FragmentJumpControlsModulePart1Binding binding;

    @override
    Widget build(BuildContext context) {
        // Now inflating the layout made for the first fragment
        binding = FragmentJumpControlsModulePart1Binding.inflate(
            LayoutInflater.from(context),
            null,
            false,
        );
        return binding.root;
    }
}
