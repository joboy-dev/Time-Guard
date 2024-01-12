// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:time_guard/screens/applications/records_screen.dart';
import 'package:time_guard/screens/main/home_screen.dart';
import 'package:time_guard/screens/main/settings_screen.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/custom_appbar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  static const String id = 'navbar';

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // controller
  PersistentTabController? _controller;

  // index
  int _index = 0;

  // navbar items
  List<PersistentBottomNavBarItem> _navbarItems() => [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.house, size: 30.sp),
      inactiveIcon: Icon(Icons.house, size: 25.sp),
      title: 'Home',
      activeColorPrimary: kFourthColor,
      activeColorSecondary: kFourthColor,
      inactiveColorPrimary: kFourthColor.withOpacity(0.5),
      inactiveColorSecondary: kFourthColor.withOpacity(0.5),
      textStyle: kNavbarTextStyle(),
    ),

    PersistentBottomNavBarItem(
      icon: Icon(Icons.settings, size: 30.sp),
      inactiveIcon: Icon(Icons.settings, size: 25.sp),
      title: 'Settings',
      activeColorPrimary: kFourthColor,
      activeColorSecondary: kFourthColor,
      inactiveColorPrimary: kFourthColor.withOpacity(0.5),
      inactiveColorSecondary: kFourthColor.withOpacity(0.5),
      textStyle: kNavbarTextStyle(),
    ),
  ];

  // app bars
  List<CustomAppbar> _appbars() => [
    CustomAppbar(
      title: 'Home', 
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              navigatorPush(context, const RecordsScreen());
            }, 
            icon: Icon(Icons.bar_chart, color: kFourthColor, size: 30.sp,),
          ),
        ],
      ),
    ),
    const CustomAppbar(
      title: 'Settings', 
    ),
  ];

  // screens
  List<Widget> _screens() => [
    const HomeScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbars()[_index],
      body: PersistentTabView(
        context,
        screens: _screens(),
        items: _navbarItems(),
        controller: _controller,
        backgroundColor: kPrimaryColor,
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          duration: kDurationMs(500),
          curve: Curves.fastOutSlowIn
        ),
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
                  ? 0.0
                  : kHeightWidth(context).height > 1000 ? 70.h : 55.h,
        navBarStyle: NavBarStyle.style11,
        hideNavigationBarWhenKeyboardShows: true,
        onItemSelected: (value) {
          setState(() {
            _index = value;
          });
        },
      ).animate().fade(duration: kDurationMs(1000)),
    );
  }
}