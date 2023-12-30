import 'package:flutter/material.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/widgets/custom_appbar.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      screen: Column(
        children: [
          CustomAppbar(
            title: 'Daily Records',
            backgroundColor: Colors.transparent,
            titleColor: kFourthColor,
            elevation: 0.0,
          )
        ],
      ),
    );
  }
}