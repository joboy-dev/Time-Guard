import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/models/records_model.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/animations.dart';

class RecordDataDialog extends StatelessWidget {
  const RecordDataDialog({super.key, required this.record});

  final Record record;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Record for: ', 
              style: kSecondaryNormalTextStyle(context).copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            Text(
              record.date, 
              style: kNormalTextStyle(context).copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
          ],
        ),
        SizedBox(height: 20.h),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Most used app: ', style: kNormalTextStyle(context).copyWith(fontWeight: FontWeight.bold),),
            Text(record.mostUsedApp, style: kSecondaryNormalTextStyle(context), textAlign: TextAlign.left,),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Time used on app: ', style: kNormalTextStyle(context).copyWith(fontWeight: FontWeight.bold),),
            Text(record.timeForMostUsedApp, style: kSecondaryNormalTextStyle(context), textAlign: TextAlign.left,),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Total apps used: ', style: kNormalTextStyle(context).copyWith(fontWeight: FontWeight.bold),),
            Text(record.noOfAppsUsed.toString(), style: kSecondaryNormalTextStyle(context), textAlign: TextAlign.left,),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Total screen time: ', style: kNormalTextStyle(context).copyWith(fontWeight: FontWeight.bold),),
            Text(record.overallScreenTimeRefined, style: kSecondaryNormalTextStyle(context), textAlign: TextAlign.left,),
          ],
        ),
      ].animate(
        interval: kDurationMs(200),
        effects: MyEffects.fadeSlide(),
      ),
    );
  }
}
