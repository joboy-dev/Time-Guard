import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/navigator.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Color buttonColor;
  final bool inactive;
  final double? width;
  final Color? textColor;
  final double? borderRadius;
  final String? fontFamily;

  const Button({
    super.key, 
    required this.buttonText,
    required this.onPressed,
    required this.buttonColor,
    required this.inactive,
    this.width,
    this.textColor,
    this.borderRadius,
    this.fontFamily
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width ?? 200.w,
      height: 50.h,
      color: inactive ? kTertiaryColor : buttonColor,
      focusColor: inactive
          ? kTertiaryColor.withOpacity(0.5)
          : buttonColor.withOpacity(0.5),
      elevation: inactive ? 1.0 : 2.0,
      focusElevation: inactive ? 1.0 : 4.0,
      splashColor: inactive
          ? kTertiaryColor.withOpacity(0.5)
          : buttonColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 20.r),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor ?? kPrimaryColor,
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily ?? kFontFamily,
        ),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  });

  final String firstText, secondText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: kPrimaryColor.withOpacity(0.1),
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: kNormalTextStyle(context).copyWith(
            fontSize: 15.sp, 
            color: kTextColor(context), // match with dark mode
          ),
          children: [
            TextSpan(
              text: secondText,
              style: kNormalTextStyle(context).copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoubleButton extends StatelessWidget {
  const DoubleButton({
    super.key,
    required this.inactiveButton,
    required this.button2Text,
    required this.button2Color,
    required this.button2onPressed,
  });

  final bool inactiveButton;
  final String button2Text;
  final Color button2Color;
  final Function() button2onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Button(
            buttonText: 'Cancel',
            onPressed: () {
              navigatorPop(context);
            },
            buttonColor: kRedColor,
            textColor: kSecondaryColor,
            inactive: false,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Button(
            buttonText: button2Text,
            onPressed: button2onPressed,
            buttonColor: button2Color,
            inactive: inactiveButton,
            textColor: kSecondaryColor,
          ),
        ),
      ],
    );
  }
}

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.text,
    this.iconWidget,
    required this.onPressed,
    this.fontSize,
    this.textColor,
    this.fontWeight,
    this.iconsize,
    this.trailing,
  });

  final String text;
  final Widget? iconWidget;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? iconsize;
  final Widget? trailing;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(left: 10.r),
        child: Row(
          children: [
            Expanded(flex: 0, child: iconWidget ?? SizedBox(width: 0.w,)),
            if(iconWidget != null) SizedBox(width: 20.sp),
            Expanded(
              flex: 2,
              child: Text(
                text,
                style: kNormalTextStyle(context).copyWith(
                  fontSize: fontSize ?? 20.sp,
                  color: textColor ?? kTextColor(context), // adapt with darkmode
                  fontWeight: fontWeight ?? FontWeight.normal,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: trailing ?? const SizedBox()
            ),
          ],
        ),
      ),
    );
  }
}