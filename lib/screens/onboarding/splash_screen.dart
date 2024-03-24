// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/screens/wrapper.dart';
// import 'package:time_guard/services/background_service.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/navigator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Image(
          image: const AssetImage('assets/images/logo.png'),
          height: 200.h,
          width: 200.w,
        ).animate(
          onComplete: (controller) async {
            // await BackgroundService().initPlatformState(context);
            navigatorPushReplacement(context, const Wrapper());
          },
        )
        .fadeIn(curve: Curves.ease, duration: kDurationSecs(3), begin: 0)
      ),
    );
  }
}