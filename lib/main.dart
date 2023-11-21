import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/screens/splash_screen.dart';
import 'package:time_guard/shared/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: const [],
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
        themeMode: ThemeMode.light,
        home: const SplashScreen(),
        themeAnimationDuration: const Duration(milliseconds: 200),
        themeAnimationCurve: Curves.easeIn,
      ),
    );
  }
}
