
import 'package:flutter/material.dart';
import 'package:talkbacktutorial/R.dart';
import 'package:talkbacktutorial/databinding/fragment_jump_headers_module_part1_binding.dart';

class JumpHeadersPart1Fragment extends StatefulWidget {
    @override
    _JumpHeadersPart1FragmentState createState() =>
        _JumpHeadersPart1FragmentState();
}

class _JumpHeadersPart1FragmentState extends State < JumpHeadersPart1Fragment > {
    late FragmentJumpHeadersModulePart1Binding binding;

    @override
    Widget build(BuildContext context) {
        binding = FragmentJumpHeadersModulePart1Binding.inflate(
            LayoutInflater.from(context),
            null,
            false,
        );
        return binding.root;
    }
}
