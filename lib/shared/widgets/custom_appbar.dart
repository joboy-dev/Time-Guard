import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/shared/constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key, 
    required this.title,
    // required this.icon,
    this.backgroundColor,
    this.titleColor,
    this.elevation,
    this.trailing,
  });

  final String title;
  // final IconData icon;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? elevation;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: kAppbarTextStyle().copyWith(color: titleColor ?? kFourthColor, fontSize: 17.sp)),
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? kPrimaryColor,
      elevation: elevation ?? 0,
      shadowColor: kTertiaryColor, // match with dark mode
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      scrolledUnderElevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r)
      ),
      actions: [
        trailing ?? const SizedBox(),
      ],
    );
  }

  // important when implementing  PreferredSizeWidget class for custom appbars
  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
