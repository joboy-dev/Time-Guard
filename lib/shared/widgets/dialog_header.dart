import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/shared/constants.dart';

class DialogHeader extends StatelessWidget {
  const DialogHeader({
    super.key,
    required this.headerText,
    this.icon,
    required this.mainColor,
  });

  final String headerText;
  final IconData? icon;
  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          headerText,
          style: kNormalTextStyle(context).copyWith(
            color: mainColor, 
            fontSize: 22.sp, 
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.h),
        // Divider(color: mainColor, thickness: 0.5.r),
        // SizedBox(height: 10.h),
      ],
    );
  }
}
