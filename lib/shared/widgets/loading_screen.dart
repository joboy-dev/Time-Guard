// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/loader.dart';

class LoadingScreeen extends StatefulWidget {
  const LoadingScreeen({super.key, required this.loadData, required this.navigateToScreen});

  final Function() loadData;
  final Widget navigateToScreen;

  @override
  State<LoadingScreeen> createState() => _LoadingScreeenState();
}

class _LoadingScreeenState extends State<LoadingScreeen> {
  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.loadData();
      navigatorPushReplacement(context, widget.navigateToScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      screen: Center(
        child: Column(
          children: [
            const Loader(),
            SizedBox(height: 20.h),
            Text(
              'Loading...',
              style: kNormalTextStyle(context),
            )
          ]
        ),
      ),
    );
  }
}