// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:time_guard/screens/base_screen.dart';
// import 'package:time_guard/shared/constants.dart';
// import 'package:time_guard/shared/utils/animations.dart';
// import 'package:time_guard/shared/utils/logger.dart';
// import 'package:time_guard/shared/widgets/custom_appbar.dart';

// class ChartScreen extends StatefulWidget {
//   const ChartScreen({super.key, required this.data});

//   final List data;

//   @override
//   State<ChartScreen> createState() => _ChartScreenState();
// }

// class _ChartScreenState extends State<ChartScreen> {
//   getBarGroupData() {

//   }

//   @override
//   Widget build(BuildContext context) {
//     return BaseScreenUnscrollable(
//       screen: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CustomAppbar(
//             title: 'App Usage in the Last 24 Hours',
//             titleColor: kFourthColor,
//             backgroundColor: Colors.transparent,
//           ),
      
//           BarChart(
//             BarChartData(
//               backgroundColor: kFourthColor,
//               borderData: FlBorderData(
//                 show: true,
//               ),
//               barGroups: List.generate(widget.data.length, (index) {
//                 double toYValue = widget.data[index]['timeUsedOnAppInSeconds'].toDouble();
//                 // logger(toYValue.runtimeType);
//                 // logger(toYValue);

//                 if (toYValue.isFinite) {
//                   return BarChartGroupData(
//                     x: index,
//                     groupVertically: false,
//                     barRods: [
//                       BarChartRodData(
//                         toY: toYValue,
//                         width: 5.w,
//                         color: kPrimaryColor,
//                       ),
//                     ],
//                     barsSpace: 2.w,
//                   );
//                 } else {
//                   logger(toYValue);
//                   return BarChartGroupData(x: index, barRods: []);
//                 }
//                 // : BarChartGroupData(x: index, barRods: []);
//               }
//               ),
//             ),
            
//             swapAnimationCurve: Curves.ease,
//             swapAnimationDuration: kDurationMs(200),
//           )
        
//         ].animate(
//           interval: kDurationMs(200),
//           effects: MyEffects.fadeSlide(),
//         ),
//       ),
//     );
//   }
// }



// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/utils/utility_functions.dart';
import 'package:time_guard/shared/widgets/bar_chart.dart';
import 'package:time_guard/shared/widgets/custom_appbar.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key, required this.data, required this.filterDay});

  final List data;
  final String filterDay;

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenUnscrollable(
      screen: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          CustomAppbar(
            title: 'App Usage in the Last ${widget.filterDay}',
            titleColor: kFourthColor,
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
                            flex: 3,
                            child: LinearPercentIndicator(
                              backgroundColor: Colors.transparent,
                              lineHeight: 5.h,
                              animation: true,
                              percent: (app['percentageTimeSpent']/100) > 1 ? 1 : app['percentageTimeSpent']/100,
                              linearGradient: LinearGradient(colors: [kFourthColor, kPrimaryColor]),
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
                                  '${app['percentageTimeSpent'].round()}%',
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
                ).toList(),
              ),
            ),
          )
        
        ].animate(
          interval: kDurationMs(200),
          effects: MyEffects.fadeSlide(),
        ),
      ),
    );
  }
}


