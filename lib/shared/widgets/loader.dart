import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:time_guard/shared/constants.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.size, this.color});

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingGrid(
      color: color ?? kPrimaryColor,
      size: size ?? 30.r,
    ).animate().fadeIn();
  }
}
