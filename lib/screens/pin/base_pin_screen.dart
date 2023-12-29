import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
import 'package:pin_plus_keyboard/pin_plus_keyboard.dart';

import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/animations.dart';

class BasePinScreen extends StatefulWidget {
  const BasePinScreen({
    super.key, 
    required this.pageTitle, 
    required this.pageSubTitle, 
    required this.pinInputController,
    required this.onSubmit,
    this.extraWidget,
  });

  final String pageTitle;
  final String pageSubTitle;
  final PinInputController pinInputController;
  final Function() onSubmit;
  final Widget? extraWidget;
    
  @override
  State<BasePinScreen> createState() => _BasePinScreenState();
}

class _BasePinScreenState extends State<BasePinScreen> {

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      screen: Column(
        children: [
          SizedBox(height: 20.h),
          Text(
            widget.pageTitle,
            style: kNormalTextStyle(context).copyWith(
              fontSize: 25.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 10.h),
              
          Text(
            widget.pageSubTitle,
            style: kSecondaryNormalTextStyle(context).copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 40.h),

          Center(
            child: PinPlusKeyBoardPackage(
              spacing: 40.h, 
              pinInputController: widget.pinInputController, 
              onSubmit: widget.onSubmit, 
              keyboardFontFamily: kFontFamily,
              inputShape: InputShape.circular,
              inputHeight: 55.h,
              inputWidth: 55.w,
              inputTextStyle: kNormalTextStyle(context).copyWith(
                color: kPrimaryColor
              ),
              inputBorderThickness: 1.r,
              inputBorderColor: kPrimaryColor,
              keyboardBtnSize: 60.r,
              keyboardButtonShape: KeyboardButtonShape.circular,
              focusColor: kTextColor(context).withOpacity(0.2),
              buttonBorderColor: kPrimaryColor,
              btnTextColor: kTextColor(context),
              cancelColor: kRedColor,
              doneButton: Icon(Icons.check, size: 30.r, color: kPrimaryColor,),
              backButton: Icon(Icons.cancel, size: 30.r, color: kPrimaryColor,),
            ),
          ),
          SizedBox(height: 20.h),

          SizedBox(child: widget.extraWidget),
        ].animate(
          effects: MyEffects.fadeSlide(offset: const Offset(0.0, -0.1)), 
          interval: kDurationMs(200)
        ),
      ),
    );
  }
}