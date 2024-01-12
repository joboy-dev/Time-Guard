// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/widgets/search_screen.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/services/isar.dart';
import 'package:time_guard/services/provider/app_provider.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/utils/utility_functions.dart';
import 'package:time_guard/shared/widgets/custom_appbar.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';

class UntrackedAppsScreen extends StatefulWidget {
  const UntrackedAppsScreen({super.key});

  @override
  State<UntrackedAppsScreen> createState() => _UntrackedAppsScreenState();
}

class _UntrackedAppsScreenState extends State<UntrackedAppsScreen> {

  @override
  Widget build(BuildContext context) {
    final untrackedApps = context.read<AppProvider>().untrackedApps;
    final isarDb = IsarDB();

    return BaseScreenUnscrollable(
      screen: untrackedApps.isEmpty 
      ? Center(
        child: Text(
          'You are no untracked applications currently.', 
          style: kSecondaryNormalTextStyle(context),
          textAlign: TextAlign.center,
        ),
      ) 
      : Column(
        children: [
          CustomAppbar(
            title: 'Untracked Apps',
            backgroundColor: Colors.transparent,
            titleColor: kTextColor(context).withOpacity(0.5),
            elevation: 0.0,
            trailing: IconButton(
              onPressed: () {
                navigatorPush(context, SearchScreen(searchList: context.read<AppProvider>().untrackedApps, isUsageDataScreen: false,));
              },
              icon: Icon(Icons.search, color: kPrimaryColor, size: 20.sp,),
            ),
          ),

          SizedBox(
            height: 440.h,
            child: ListView.builder(
              itemCount: untrackedApps.length,
              itemBuilder: (context, index) {
                final app = untrackedApps[index];
          
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
                    style: kNormalTextStyle(context).copyWith(
                      fontSize: 12.sp
                    ),
                  ),
                  trailing: TextButton(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}