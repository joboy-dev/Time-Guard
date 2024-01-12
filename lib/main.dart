import 'package:background_fetch/background_fetch.dart';
import 'package:device_preview/device_preview.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/models/app_model.dart';
import 'package:time_guard/screens/onboarding/splash_screen.dart';
import 'package:time_guard/services/isar.dart';
import 'package:time_guard/services/notification.dart';
import 'package:time_guard/services/provider/app_provider.dart';
import 'package:time_guard/services/provider/pin_store.dart';
import 'package:time_guard/services/provider/record_provider.dart';
import 'package:time_guard/services/provider/theme_provider.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/logger.dart';

// Initialize notifications plugin
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void backgroundFetchHeadlessTask(HeadlessTask task, BuildContext context) async {
  var taskId = task.taskId;
  logger(taskId);

  final trackedApps = context.read<AppProvider>().trackedApps;

  // Tracked Apps
  for (App app in trackedApps) {
    double timePercent = (app.timeUsedOnAppInSeconds / app.usageLimitInSeconds) * 100;
    logger(timePercent);

    if (app.timeUsedOnAppInSeconds >= app.usageLimitInSeconds) {
      Notifications.showNotification(
        title: '${app.appName} Usage Limit Reached', 
        body: 'You have exceeded your usage limit of ${app.usageLimit} for ${app.appName} application. You have used the app for ${app.timeUsedOnApp}'
      );
    } else if (timePercent >= 85.0) {
      Notifications.showNotification(
        title: 'App usage limit warning', 
        body: 'You are approaching your usage limit for ${app.appName}. You have spent ${app.timeUsedOnApp} and the limit set is ${app.usageLimit}'
      );
    }
  }
}

void addRecord() async {
  logger('Start');
  await IsarDB().addRecordIsarAlone();
  logger('Done');
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Request notification permission
  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
    AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();

  await AndroidAlarmManager.initialize();
  await Notifications.init();
  await BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PinStore()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => RecordProvider()),
      ],
      // child: DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const TimeGuard(),
      // ),
      child: const TimeGuard()
    )
  );

  await AndroidAlarmManager.periodic(
    const Duration(hours: 24), 
    17, 
    addRecord,
    allowWhileIdle: true,
    wakeup: true,
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
