import 'package:flutter/material.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/screens/pin/create_pin_screen.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      screen: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Container(
              height: 200.h,
              width: 200.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150.r),
              ),
              child: const Image(
                image: AssetImage('assets/images/appicon.png'),
                fit: BoxFit.cover,
              ),
            ),
      
            SizedBox(height: 20.h),
      
            Text(
              'Time Guard',
              style: kNormalTextStyle(context).copyWith(
                fontSize: 40.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
      
            SizedBox(height: 10.h),
      
            Text(
              'Control your screen time effectively.',
              style: kSecondaryNormalTextStyle(context).copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold
              ),
            ),
      
            SizedBox(height: 40.h),
      
            Button(
              buttonText: 'Get Started', 
              onPressed: () {
                navigatorPush(context, const CreatePinScreen());
              }, 
              buttonColor: kPrimaryColor, 
              inactive: false,
              textColor: kSecondaryColor,
            ),
          ],
        ),
      )
    );
  }
}
