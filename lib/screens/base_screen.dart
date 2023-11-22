import 'package:flutter/material.dart';
import 'package:time_guard/shared/constants.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key, required this.screen});

  final Widget screen;

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: kAppPadding(),
            child: widget.screen
          ),
        )
      ),
    );
  }
}