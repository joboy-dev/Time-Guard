import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Color kBgColorLight =const  Color(0xFFfffcf2);
Color kBgColorDark = const Color(0xFF252422);
Color kPrimaryColor = const Color(0xFFeb5e28);
Color kSecondaryColor = const Color(0xFFccc5b9);
Color kTertiaryColor = const Color(0xFF403d39);
const kRedColor = Color.fromARGB(255, 206, 15, 15);
Color kScaffoldBgColor(BuildContext context) => Theme.of(context).scaffoldBackgroundColor;

// THEME BASED FONT COLOR
// Color kFontTheme(BuildContext context) {
//   final darkMode = context.watch<ThemeSwitch>().isDarkMode;
//   return darkMode ? kTertiaryColor : kPrimaryColor;
// }

// RESPONSIVENESS
Size kHeightWidth(BuildContext context) {
  return MediaQuery.of(context).size;
}

EdgeInsets kAppPadding() => EdgeInsets.only(left: 10.r, right: 10.r, top: 15.r);

// ANIMATION DURATION
Duration kDurationMs(int ms) => Duration(milliseconds: ms);
Duration kDurationSecs(int seconds) => Duration(seconds: seconds);

// TEXT STYLES
const kAppbarTextStyle = TextStyle(fontWeight: FontWeight.bold);
TextStyle kNavbarTextStyle() => TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold);

TextStyle kTextFieldTextStyle() => TextStyle(fontSize: 15.sp, color: kSecondaryColor);
// TextStyle kNormalTextStyle(BuildContext context) => TextStyle(fontSize: 15.sp, color: kFontTheme(context));
TextStyle kYellowNormalTextStyle(BuildContext context) => TextStyle(fontSize: 15.sp, color: kSecondaryColor);
