import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/screens/main/app_usage_chart_screen.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/utils/logger.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/utils/utility_functions.dart';
import 'package:time_guard/services/usage_stats.dart';
import 'package:time_guard/shared/widgets/custom_appbar.dart';
import 'package:time_guard/shared/widgets/loader.dart';
import 'package:time_guard/shared/widgets/textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedFilterOption = filterDays.keys.first;
  Map<String, dynamic> usageData = {};
  List allAppsData = [];
  List usedAppsData = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      usageData = await loadUsageData();
      setState(() {
        allAppsData = usageData['allAppsData'];
        usedAppsData = usageData['usedAppsData'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();

    return BaseScreen(
      screen: Center(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Today\'s date: ${currentDate.day}.${currentDate.month}.${currentDate.year}',
                          style: kNormalTextStyle(context),
                        ),
                      ),
                      Expanded(
                        child: DropDownFormField(
                          value: selectedFilterOption, 
                          items: filterDays.keys.map(
                            (day) => DropdownMenuItem(
                              value: day,
                              child: Text(
                                day,
                                style: kNormalTextStyle(context).copyWith(fontSize: 12.sp),
                              ),
                            )
                          ).toList(), 
                          onChanged: (value) async {
                            setState(() {
                              selectedFilterOption = value;
                            });
                            usageData = await loadUsageData(hours: filterDays[selectedFilterOption]!);

                            setState(() {
                              allAppsData = usageData['allAppsData'];
                              usedAppsData = usageData['usedAppsData'];
                            });
                            
                            logger(selectedFilterOption!);
                          }, 
                          prefixIcon: Icons.timer, 
                          iconColor: kPrimaryColor, 
                          enabledBorderColor: Colors.transparent,
                          focusedBorderColor: Colors.transparent,
                          errorBorderColor: kRedColor,
                          focusedErrorBorderColor: kRedColor,
                          errorTextStyleColor: kRedColor,
                        ),
                      ),
                    ],
                  ),

                  Text(
                    'Total On Screen Time in the last $selectedFilterOption',
                    style: kSecondaryNormalTextStyle(context).copyWith(fontSize: 17.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [kFourthColor, kPrimaryColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              ),
              child: Center(
                child: usageData['totalHours'] == null ? Loader(size: 20.r,) : Text(
                  '${usageData['totalHours']}h ${usageData['totalMinutes']}m', 
                  style: kNormalTextStyle(context).copyWith(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10.h),

            CustomAppbar(
              title: 'App Usage in the Last $selectedFilterOption',
              titleColor: kTextColor(context).withOpacity(0.5),
              backgroundColor: Colors.transparent,
              trailing: IconButton(
                onPressed: () {
                  navigatorPush(context, AppUsageChartScreen(data: usedAppsData, filterDay: selectedFilterOption!,));
                }, 
                icon: Icon(Icons.timeline_rounded, color: kPrimaryColor, size: 20.sp,),
              ),
            ),

            SizedBox(
              height: 225.h,
              child: RefreshIndicator.adaptive(
                onRefresh: () async {
                  usageData = await loadUsageData(hours: filterDays[selectedFilterOption]!);
                  setState(() {
                    allAppsData = usageData['allAppsData'];
                    usedAppsData = usageData['usedAppsData'];
                  });
                },
                color: kPrimaryColor,
                backgroundColor: kFourthColor,
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                child: ListView.builder(
                  itemCount: usedAppsData.length,
                  itemBuilder: (context, index) {
                    final app = usedAppsData[index];
                    return app == null ? const SizedBox() : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 20.r,
                              backgroundImage: MemoryImage(convertToUint8Listt(app['appIcon']), scale: 1.r),
                            ),
                            minLeadingWidth: 40.w,
                            title: Text(
                              app['appName'],
                              style: kSecondaryNormalTextStyle(context).copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Time Spent: ',
                                  style: kNormalTextStyle(context).copyWith(
                                    fontSize: 12.sp,
                                  ),
                                ),
                        
                                Text(
                                  app['timeUsedOnAppRefined'],
                                  style: kSecondaryNormalTextStyle(context).copyWith(
                                    color: kPrimaryColor,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
              
                        Expanded(
                          flex: 1,
                          child: CircularPercentIndicator(
                              radius: 20.r,
                              backgroundColor: Colors.transparent,
                              animation: true,
                              percent: (app['percentageTimeSpent']/100) > 1 ? 1 : app['percentageTimeSpent']/100,
                              linearGradient: LinearGradient(colors: [kFourthColor, kPrimaryColor]),
                              lineWidth: 2.w,
                              center: Text(
                                app['percentageTimeSpent'].isFinite 
                                  ? app['percentageTimeSpent'] >= 100 ? '100%' : '${app['percentageTimeSpent'].round()}%'
                                  : '0%',
                                style: kNormalTextStyle(context).copyWith(
                                  fontSize: 10.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                )
              ),
            ),
          ].animate(
            interval: kDurationMs(200),
            effects: MyEffects.fadeSlide()
          )
        ),
      ),
    );
  }
}