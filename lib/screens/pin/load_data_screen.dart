// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/services/isar.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/bottom_navbar.dart';
import 'package:time_guard/shared/widgets/loader.dart';

class LoadDataScreen extends StatefulWidget {
  const LoadDataScreen({super.key});

  @override
  State<LoadDataScreen> createState() => _LoadDataScreenState();
}

class _LoadDataScreenState extends State<LoadDataScreen> {
  final isarDb = IsarDB();
  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await isarDb.reloadData(context);

      navigatorPushReplacement(context, const BottomNavBar());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      screen: Center(
        child: Column(
          children: [
            const Loader(),
            SizedBox(height: 20.h),
            Text(
              'Loading data',
              style: kNormalTextStyle(context),
            )
          ]
        ),
      ),
    );
  }
}