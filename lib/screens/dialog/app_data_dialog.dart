import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/models/app_model.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/utils/utility_functions.dart';

class AppDataDialog extends StatelessWidget {
  const AppDataDialog({super.key, required this.app});

  final App app;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: MemoryImage(convertToUint8Listt(app.appIcon!), scale: 1.r),
            ),
            SizedBox(width: 20.w),
            Text(
              app.appName.length > 14 ? '${app.appName.substring(0, 13)}...' : app.appName, 
              style: kSecondaryNormalTextStyle(context).copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
          ],
        ),
        SizedBox(height: 20.h),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('App Name: ', style: kNormalTextStyle(context).copyWith(color: kFourthColor, fontWeight: FontWeight.bold),),
            Text(app.appName, style: kSecondaryNormalTextStyle(context),),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Package Name: ', style: kNormalTextStyle(context).copyWith(color: kFourthColor, fontWeight: FontWeight.bold),),
            Text(app.packageName, style: kSecondaryNormalTextStyle(context),),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Version: ', style: kNormalTextStyle(context).copyWith(color: kFourthColor, fontWeight: FontWeight.bold),),
            Text(app.versionName, style: kSecondaryNormalTextStyle(context),),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Time used on app: ', style: kNormalTextStyle(context).copyWith(color: kFourthColor, fontWeight: FontWeight.bold),),
            Text(app.timeUsedOnApp, style: kSecondaryNormalTextStyle(context),),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Usage Limit: ', style: kNormalTextStyle(context).copyWith(color: kFourthColor, fontWeight: FontWeight.bold),),
            Text(app.usageLimit, style: kSecondaryNormalTextStyle(context),),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tracked Status: ', style: kNormalTextStyle(context).copyWith(color: kFourthColor, fontWeight: FontWeight.bold),),
            Text(
              app.isTracked ? 'Currently tracked' : 'Not currently tracked', 
              style: kSecondaryNormalTextStyle(context),
            ),
          ],
        ),
      ].animate(
        interval: kDurationMs(200),
        effects: MyEffects.fadeSlide(),
      ),
    );
  }
}
