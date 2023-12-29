// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/screens/applications/search_screen.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/services/isar.dart';
import 'package:time_guard/services/provider/app_provider.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/utils/utility_functions.dart';
import 'package:time_guard/shared/widgets/custom_appbar.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';

class TrackedAppsScreen extends StatefulWidget {
  const TrackedAppsScreen({super.key});

  @override
  State<TrackedAppsScreen> createState() => _TrackedAppsScreenState();
}

class _TrackedAppsScreenState extends State<TrackedAppsScreen> {

  @override
  Widget build(BuildContext context) {
    final trackedApps = context.read<AppProvider>().trackedApps;
    final isarDb = IsarDB();

    return BaseScreenUnscrollable(
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
            title: 'Tracked Apps',
            backgroundColor: Colors.transparent,
            titleColor: kFourthColor,
            elevation: 0.0,
            trailing: IconButton(
              onPressed: () {
                navigatorPush(context, SearchScreen(searchList: context.read<AppProvider>().trackedApps,));
              },
              icon: Icon(Icons.search, color: kPrimaryColor, size: 20.sp,),
            ),
          ),

          SizedBox(
            height: 475.h,
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
                  subtitle: Text(
                    app.versionName,
                    style: kSecondaryNormalTextStyle(context).copyWith(
                      color: kFourthColor,
                      fontSize: 12.sp
                    ),
                  ),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () async {                  
                          await isarDb.untrackApp(context, app.id);
                          showSnackbar(context, '${app.appName} removed from tracked apps list.');
                          setState(() {
                            
                          });
                        }, 
                        child: Text('Untrack', style: kSecondaryNormalTextStyle(context),),
                      ),

                      IconButton(
                        onPressed: () async {

                        },
                        icon: Icon(Icons.alarm, size: 20.sp, color: kFourthColor,),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}