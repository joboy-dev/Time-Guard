import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

const kFontFamily = 'Fredoka';

Color kBgColorLight =const  Color(0xFFfffcf2);
Color kBgColorDark = const Color(0xFF252422);
Color kPrimaryColor = const Color(0xFFeb5e28);
Color kSecondaryColor =const  Color(0xFFfffcf2);
Color kTertiaryColor = const Color(0xFF403d39);
Color kFourthColor = const Color(0xFFccc5b9);
const kRedColor = Color.fromARGB(255, 206, 15, 15);
Color kScaffoldBgColor(BuildContext context) => Theme.of(context).scaffoldBackgroundColor;

// THEME BASED FONT COLOR
// Color kTextColor(BuildContext context) {
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
TextStyle kAppbarTextStyle() => const TextStyle(fontWeight: FontWeight.bold, fontFamily: kFontFamily);
TextStyle kNavbarTextStyle() => TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, fontFamily:  kFontFamily);

TextStyle kTextFieldTextStyle() => TextStyle(fontSize: 15.sp, color: kSecondaryColor, fontFamily: kFontFamily);
TextStyle kNormalTextStyle(BuildContext context) => TextStyle(fontSize: 15.sp, color: kTertiaryColor, fontFamily: kFontFamily);
// TextStyle kThemeNormalTextStyle(BuildContext context) => TextStyle(fontSize: 15.sp, color: kTertiaryColor, fontFamily: kFontFamily);
TextStyle kSecondaryNormalTextStyle(BuildContext context) => TextStyle(fontSize: 15.sp, color: kPrimaryColor, fontFamily: kFontFamily);
