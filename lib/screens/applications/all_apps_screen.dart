// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/screens/dialog/app_data_dialog.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/widgets/dialog.dart';
import 'package:time_guard/shared/widgets/search_screen.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/services/isar.dart';
import 'package:time_guard/services/provider/app_provider.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/utils/utility_functions.dart';
import 'package:time_guard/shared/widgets/custom_appbar.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';

class AllAppsScreen extends StatefulWidget {
  const AllAppsScreen({super.key});

  @override
  State<AllAppsScreen> createState() => _AllAppsScreenState();
}

class _AllAppsScreenState extends State<AllAppsScreen> {
  @override
  Widget build(BuildContext context) {
    final apps = context.read<AppProvider>().allApps;
    final isarDb = IsarDB();

    return BaseScreenUnscrollable(
      screen: Column(
        children: [
          CustomAppbar(
            title: 'Installed Apps',
            backgroundColor: Colors.transparent,
            titleColor: kTextColor(context).withOpacity(0.5),
            elevation: 0.0,
            trailing: IconButton(
              onPressed: () {
                navigatorPush(context, SearchScreen(searchList: context.read<AppProvider>().allApps, isUsageDataScreen: false,));
              },
              icon: Icon(Icons.search, color: kPrimaryColor, size: 20.sp,),
            ),
          ),

          SizedBox(
            height: 440.h,
            child: ListView.builder(
              itemCount: apps.length,
              itemBuilder: (context, index) {
                final app = apps[index];
          
                return InkWell(
                  onTap: () {
                    showDialogBox(context: context, screen: AppDataDialog(app: app));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20.r,
                      backgroundImage: MemoryImage(convertToUint8Listt(app.appIcon!)),
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
                      style: kNormalTextStyle(context).copyWith(
                        fontSize: 12.sp
                      ),
                    ),
                    trailing: app.isTracked ? TextButton(
                      onPressed: () async {                  
                        await isarDb.untrackApp(context, app.id);
                        showSnackbar(context, '${app.appName} removed from tracked apps list.');
                        setState(() {
                          
                        });
                      }, 
                      child: Text(
                        'Untrack', 
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ) : TextButton(
                      onPressed: () async {                  
                        await isarDb.trackApp(context, app.id);
                        showSnackbar(context, '${app.appName} added to tracked apps list.');
                        setState(() {
                          
                        });
                      }, 
                      child: Text(
                        'Track', 
                        style: kSecondaryNormalTextStyle(context).copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ).animate(
                    effects: MyEffects.fadeSlide()
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