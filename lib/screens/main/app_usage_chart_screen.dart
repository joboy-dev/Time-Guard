// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/utils/utility_functions.dart';
import 'package:time_guard/shared/widgets/custom_appbar.dart';

class AppUsageChartScreen extends StatefulWidget {
  const AppUsageChartScreen({super.key, required this.data, required this.filterDay});

  final List data;
  final String filterDay;

  @override
  State<AppUsageChartScreen> createState() => _AppUsageChartScreenState();
}

class _AppUsageChartScreenState extends State<AppUsageChartScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenUnscrollable(
      screen: Column(
        children: [
          CustomAppbar(
            title: 'App Usage in the Last ${widget.filterDay}',
            titleColor: kTextColor(context).withOpacity(0.5),
            backgroundColor: Colors.transparent,
          ),
      
          SizedBox(
            height: 450.h,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: widget.data.map(
                  (app) => Column(
                    children: [
                      Row(
                        children: [
                          // BarChartHorizontal(
                          //   fill: app['timeUsedOnAppInSeconds'] / 1
                          // ),
                          Expanded(
                            child: LinearPercentIndicator(
                              backgroundColor: Colors.transparent,
                              lineHeight: 5.h,
                              animation: true,
                              percent: (app['percentageTimeSpent']/100) > 1 ? 1 : app['percentageTimeSpent']/100,
                              linearGradient: LinearGradient(
                                colors: [kFourthColor, kPrimaryColor],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter
                              ),
                              barRadius: Radius.circular(10.r),
                              leading: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 2.sp),
                                child: CircleAvatar(
                                  radius: 10.r,
                                  backgroundImage: MemoryImage(convertToUint8Listt(app['appIcon']), scale: 1.r),
                                ),
                              ),
                              trailing: Padding(
                                 padding: EdgeInsets.only(right: 10.sp),
                                 child: Text(
                                  app['percentageTimeSpent'].isFinite ? '${app['percentageTimeSpent'].round()}%': '0',
                                  style: kNormalTextStyle(context).copyWith(
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h)
                    ],
                  )
                ).toList().animate(
                  interval: kDurationMs(100),
                  effects: MyEffects.fadeSlide(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


