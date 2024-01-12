// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/models/app_model.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/widgets/search_screen.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/screens/dialog/set_usage_limit_dialog.dart';
import 'package:time_guard/services/isar.dart';
import 'package:time_guard/services/provider/app_provider.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/services/usage_stats.dart';
import 'package:time_guard/shared/utils/utility_functions.dart';
import 'package:time_guard/shared/widgets/custom_appbar.dart';
import 'package:time_guard/shared/widgets/dialog.dart';

class UsageLimitScreen extends StatefulWidget {
  const UsageLimitScreen({super.key});

  @override
  State<UsageLimitScreen> createState() => _UsageLimitScreenState();
}

class _UsageLimitScreenState extends State<UsageLimitScreen> {
  Map<String, dynamic> usageData = {};
  List allAppsData = [];
  final isarDb = IsarDB();  

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    usageData = await loadUsageData();
    setState(() {
      allAppsData = usageData['allAppsData'];
    });

    for (var appData in allAppsData) {
      App? app = await isarDb.getAppByPackageName(appData['packageName']);

      if (app != null) {
        await isarDb.updateTimeUsedOnApp(
          app, 
          appData['timeUsedOnAppRefined'], 
          appData['timeUsedOnAppInSeconds']
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final trackedApps = context.read<AppProvider>().trackedApps;

    return BaseScreen(
      screen: trackedApps.isEmpty 
      ? Center(
        child: Text(
          'You are not tracking any applications currently.', 
          style: kSecondaryNormalTextStyle(context),
          textAlign: TextAlign.center,
        ),
      ) 
      : Column(
        children: [
          CustomAppbar(
            title: 'Set Usage Limit',
            backgroundColor: Colors.transparent,
            titleColor: kTextColor(context).withOpacity(0.5),
            elevation: 0.0,
            trailing: IconButton(
              onPressed: () {
                navigatorPush(context, SearchScreen(searchList: context.read<AppProvider>().trackedApps, isUsageDataScreen: true,));
              },
              icon: Icon(Icons.search, color: kPrimaryColor, size: 20.sp,),
            ),
          ),
    
          SizedBox(
            height: 460.h,
            child: RefreshIndicator.adaptive(
              onRefresh: () async {
                await loadData();
              },
              color: kPrimaryColor,
              backgroundColor: kFourthColor,
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              child: ListView.builder(
                itemCount: trackedApps.length,
                itemBuilder: (context, index) {
                  final app = trackedApps[index];
                      
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 20.r,
                      backgroundImage: MemoryImage(convertToUint8Listt(app.appIcon!), scale: 1.r),
                    ),
                    minLeadingWidth: 40.w,
                    title: Text(
                      app.appName,
                      style: kSecondaryNormalTextStyle(context).copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              'App Usage Limit: ',
                              style: kNormalTextStyle(context).copyWith(
                                fontSize: 12.sp
                              ),
                            ),
                
                            Text(
                              app.usageLimit,
                              style: kSecondaryNormalTextStyle(context).copyWith(
                                color: kPrimaryColor,
                                fontSize: 12.sp
                              ),
                            ),
                          ],
                        ),
                        
                        Row(
                          children: [
                            Text(
                              'Time Spent: ',
                              style: kNormalTextStyle(context).copyWith(
                                fontSize: 12.sp
                              ),
                            ),
                
                            Text(
                              app.timeUsedOnApp,
                              style: kSecondaryNormalTextStyle(context).copyWith(
                                color: kPrimaryColor,
                                fontSize: 12.sp
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: TextButton(
                      onPressed: () async {
                        showDialogBox(context: context, screen: SetUsageLimitDialog(app: app));
                      }, 
                      child: Text(
                        'Set Limit', 
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ).animate(
                    effects: MyEffects.fadeSlide()
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}