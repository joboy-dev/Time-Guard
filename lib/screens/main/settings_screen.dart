import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/screens/applications/all_apps_screen.dart';
import 'package:time_guard/screens/applications/tracked_apps_screen.dart';
import 'package:time_guard/screens/applications/untracked_apps_screen.dart';
import 'package:time_guard/screens/applications/usage_limit_screen.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/screens/dialog/clear_data_dialog.dart';
import 'package:time_guard/screens/dialog/select_theme_dialog.dart';
import 'package:time_guard/screens/pin/change/verify_pin.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/button.dart';
import 'package:time_guard/shared/widgets/dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      screen: Column(
        children: [
          SettingsSection(
            sectionName: 'App Settings',
            settingOptions: [
              IconTextButton(
                text: 'Installed Applications',
                fontSize: 15.sp,
                onPressed: () {
                  navigatorPush(context, const AllAppsScreen());
                }
              ),
              SizedBox(height: 10.h),

              IconTextButton(
                text: 'Tracked Applications',
                fontSize: 15.sp,
                onPressed: () {
                  navigatorPush(context, const TrackedAppsScreen());
                }
              ),
              SizedBox(height: 10.h),

              IconTextButton(
                text: 'Untracked Applications',
                fontSize: 15.sp,
                onPressed: () {
                  navigatorPush(context, const UntrackedAppsScreen());
                }
              ),
              SizedBox(height: 10.h),

              IconTextButton(
                text: 'Set Usage Limit (Tracked apps)',
                fontSize: 15.sp,
                onPressed: () {
                  navigatorPush(context, const UsageLimitScreen());
                }
              ),

            ],
          ),

          SettingsSection(
            sectionName: 'Pin Settings',
            settingOptions: [
              IconTextButton(
                text: 'Change Pin',
                fontSize: 15.sp,
                onPressed: () {
                  navigatorPush(context, const VerifyPinScreen());
                }
              ),
            ],
          ),

          SettingsSection(
            sectionName: 'Theme Settings',
            settingOptions: [
              IconTextButton(
                text: 'Change Theme',
                fontSize: 15.sp,
                onPressed: () {
                  showDialogBox(context: context, screen: const SelectThemeDialog());
                }
              ),
            ],
          ),

          SettingsSection(
            sectionName: 'Data',
            settingOptions: [
              IconTextButton(
                text: 'Clear Data',
                fontSize: 15.sp,
                textColor: kRedColor,
                onPressed: () {
                  showDialogBox(context: context, screen: const ClearDataDialog());
                }
              ),
            ],
          ),

        ],
      ),
    );
  }
}



class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.sectionName,
    required this.settingOptions,
  });

  final String sectionName;
  final List<Widget> settingOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionName.toUpperCase(), 
          style: kSecondaryNormalTextStyle(context).copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10.h),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: settingOptions,
        ),

        SizedBox(height: 30.h),
        
      ],
    );
  }
}