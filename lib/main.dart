import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/screens/onboarding/splash_screen.dart';
import 'package:time_guard/services/provider/app_provider.dart';
import 'package:time_guard/services/provider/pin_store.dart';
import 'package:time_guard/services/provider/theme_provider.dart';
import 'package:time_guard/shared/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PinStore()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const TimeGuard(),
      ),
      // child: const TimeGuard()
    )
  );
}

class TimeGuard extends StatelessWidget {
  const TimeGuard({super.key});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;


    return Consumer<ThemeProvider>(
      builder: (context, theme, child) {
        /// Function to get the theme for the app
        ThemeMode getThemeMode() {
          final themeValue = theme.themeValue;
          if (themeValue == 'light') {
            return ThemeMode.light;
          } else if (themeValue == 'dark') {
            return ThemeMode.dark;
          } else {
            return ThemeMode.system;
          }
        }

        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) => MaterialApp(
            title: 'Time Guard',
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: kBgColorLight,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: kBgColorDark,
            ),
            themeMode: getThemeMode(),
            home: const SplashScreen(),
            themeAnimationDuration: const Duration(milliseconds: 200),
            themeAnimationCurve: Curves.easeIn,
          ),
        );
      },
    );
  }
}
