// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/models/app_model.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/screens/dialog/set_usage_limit_dialog.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/utility_functions.dart';
import 'package:time_guard/shared/widgets/custom_appbar.dart';
import 'package:time_guard/shared/widgets/dialog.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';
import 'package:time_guard/shared/widgets/textfield.dart';
import 'package:time_guard/services/isar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.searchList, required this.isUsageDataScreen});

  final List<App> searchList;
  final bool isUsageDataScreen;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<App>? apps = [];
  String? searchTerm = '';
  final isarDb = IsarDB();

  /// Function to search for an app through the app name
  List<App>? searchAppByName(String searchTerm, List<App> appList) {
    // Convert the search term to lowercase for case-insensitive search
    final searchTermLower = searchTerm.toLowerCase();

    // Filter the app list based on the search term
    final matchingApps = appList.where((app) {
      // Convert the app name to lowercase for case-insensitive comparison
      final appNameLower = app.appName.toLowerCase();

      // Check if the app name contains the search term
      return appNameLower.contains(searchTermLower);
    }).toList();

    // Return the first matching app, or null if no match is found
    return matchingApps.isNotEmpty ? matchingApps : null;
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      screen: Column(
        children: [
          CustomAppbar(
            title: 'Search for App',
            backgroundColor: Colors.transparent,
            titleColor: kFourthColor,
            elevation: 0.0,
          ),
          SizedBox(height: 10.h),
          
          Form(
            child: NormalTextField(
              hintText: 'Enter app name',
              onChanged: (value) {
                setState(() {
                  searchTerm = value!;
                  apps = searchAppByName(searchTerm!, widget.searchList);
                });
              },
              enabledBorderColor: kTextColor(context),
              focusedBorderColor: kPrimaryColor,
              errorBorderColor: kRedColor,
              focusedErrorBorderColor: kRedColor,
              errorTextStyleColor: kRedColor,
              iconColor: kPrimaryColor,
              cursorColor: kPrimaryColor,
              prefixIcon: Icons.search,
              suffixIcon: Icons.clear,
              suffixIconOTap: () {
                setState(() {
                  searchTerm = null;
                });
              },
            )
          ),

          apps == null 
          ? Text('No app found', style: kSecondaryNormalTextStyle(context))
          : SizedBox(
            height: 400.h,
            child: ListView.builder(
              itemCount: apps?.length,
              itemBuilder: (context, index) {
                final app = apps?[index];
          
                return widget.isUsageDataScreen 
                // Usage Data Screen
                ? ListTile(
                    leading: CircleAvatar(
                      radius: 20.r,
                      backgroundImage: MemoryImage(convertToUint8Listt(app!.appIcon!), scale: 1.r),
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
                              style: kSecondaryNormalTextStyle(context).copyWith(
                                color: kFourthColor,
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
                              'Time Spent on App: ',
                              style: kSecondaryNormalTextStyle(context).copyWith(
                                color: kFourthColor,
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
                  ) 

                  // Not Usage Data Screen
                  : ListTile(
                  leading: CircleAvatar(
                    radius: 20.r,
                    backgroundImage: MemoryImage(convertToUint8Listt(app!.appIcon!), scale: 1.r),
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
                      fontSize: 12.sp,
                    ),
                  ),
                  trailing: app.isTracked ? TextButton(
                    onPressed: () async {                  
                      await isarDb.untrackApp(context, app.id);
                      showSnackbar(context, '${app.appName} removed from tracked apps list.');
                      setState(() {
                        
                      });
                    }, 
                    child: Text('Untrack', style: kSecondaryNormalTextStyle(context).copyWith(fontSize: 12.sp),),
                  ) : TextButton(
                    onPressed: () async {                  
                      await isarDb.trackApp(context, app.id);
                      showSnackbar(context, '${app.appName} added to tracked apps list.');
                      setState(() {
                        
                      });
                    }, 
                    child: Text('Track', style: kSecondaryNormalTextStyle(context).copyWith(fontSize: 12.sp),),
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