import 'package:flutter/material.dart';
import 'package:custom_pin_screen/custom_pin_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/shared/constants.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      screen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  'Create Pin',
                  style: kNormalTextStyle(context).copyWith(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.h),
                    
                Text(
                  'Enter your desired pin',
                  style: kSecondaryNormalTextStyle(context).copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
              ],
            ),
          ),

          SizedBox(height: 20.h),

          Expanded(
            flex: 3,
            child: CustomKeyBoard(maxLength: 6,)
          )
      
      
        ],
      ),
    );
  }
}