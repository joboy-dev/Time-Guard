import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/models/app_model.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/services/provider/app_provider.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/logger.dart';
import 'package:time_guard/shared/utils/utility_functions.dart';
import 'package:time_guard/shared/utils/usage_stats.dart';
import 'package:time_guard/shared/widgets/loader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> usageData = {};
  List allAppsData = [];
  List usedAppsData = [];
  Map finalUsedAppsData = {};
  List packageNames = [];
  // Set usedAppsSet = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadData();
    });
    super.initState();
  }

  loadData() async {
    allAppsData.clear();
    usedAppsData.clear();

    Map<String, dynamic> data = await getUsageData(context);
    setState(() {
      usageData = data;

      // Add all apps data into a list
      for (var appData in usageData['appData']) {
        allAppsData.add(appData);

        if (appData['timeUsedOnAppInSeconds'] > 0) {
          usedAppsData.add(appData);
        }
      }
      // logger('All Apps: $allAppsData');
      // logger('Used Apps: $usedAppsData');
    });

    // logger(usedAppsData.length);
    // logger('HomeScreen: $usageData');
    // logger('HomeScreen used apps: $usedAppsData');
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        await loadData();
        // getAppUsageData();
      },
      color: kPrimaryColor,
      backgroundColor: kFourthColor,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: BaseScreen(
        screen: Center(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Todsy\'s date: ${currentDate.day}.${currentDate.month}.${currentDate.year}',
                      style: kNormalTextStyle(context).copyWith(
                        color: kFourthColor
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Total On Screen Time 24 Hours Ago',
                      style: kSecondaryNormalTextStyle(context).copyWith(fontSize: 20.sp),
                    ),
                  ],
                ),
              ),
              
              Container(
                height: 200.h,
                width: 200.w,
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 2.w, strokeAlign: BorderSide.strokeAlignCenter),
                  shape: BoxShape.circle,
                  color: kFourthColor
                ),
                child: Center(
                  child: usageData['totalHours'] == null ? Loader(size: 20.r,) : Text(
                    '${usageData['totalHours']}h ${usageData['totalMinutes']}m', 
                    style: kNormalTextStyle(context).copyWith(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
          
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'App Usage in the Last 24 Hours',
                      style: kSecondaryNormalTextStyle(context).copyWith(fontSize: 17.sp, color: kFourthColor),
                    ),
                  ),
    
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                      }, 
                      icon: Icon(Icons.bar_chart, color: kPrimaryColor, size: 20.sp,),
                    ),
                  )
                ],
              ),

              Column(
                children: usedAppsData.map(
                  (app) {
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
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Time Spent: ',
                                  style: kSecondaryNormalTextStyle(context).copyWith(
                                    color: kFourthColor
                                  ),
                                ),
                        
                                Text(
                                  app['timeUsedOnAppRefined'],
                                  style: kSecondaryNormalTextStyle(context).copyWith(
                                    color: kPrimaryColor
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
                             percent: app['percentageTimeSpent']/100,
                             progressColor: kPrimaryColor,
                             lineWidth: 2.w,
                             center: Text(
                              '${app['percentageTimeSpent'].round()}%',
                              style: kNormalTextStyle(context).copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                ).toList(),
              ),
            ]
          ),
        ),
      ),
    );
  }
}






    // final allApps = context.watch<AppProvider>().allApps;
    // List<App> availableApps = [];

    // getAppUsageData() {
    //   availableApps.clear();

    //   for (App app in allApps) {
    //     Map? appDetails = usedAppsData.firstWhere(
    //       (data) => data.containsKey(app.packagdName),
    //       orElse: () => null,
    //     );

    //     if (appDetails != null) {
    //       if (packageNames.contains(appDetails[app.packageName]['packageName'])) {
    //         availableApps.add(app);
    //       }
    //     }
    //   }

    //   // logger(availableApps.length);
    //   // for (var newapp in availableApps) {
    //   //   logger(newapp.appName);
    //   // }
    //   return availableApps;
    // }

    // Get app usage data as soon as widgets are built
    // getAppUsageData();
