import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/shared/constants.dart';

class DialogText extends StatelessWidget {
  const DialogText({
    super.key,
    required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    // final theme = context.watch<ThemeSwitch>().isDarkMode;

    return Column(
      children: [
        Text(
          text,
          style: kNormalTextStyle(context).copyWith(
            color: kTextColor(context), // match with dark mode
            fontSize: 17.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}