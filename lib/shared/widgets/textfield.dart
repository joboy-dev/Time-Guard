import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/shared/constants.dart';

class RadioField extends StatelessWidget {
  const RadioField({
    super.key,
    required this.value,
    required this.selectedValue,
    required this.onChanged,
    required this.title,
    this.selected,
  });

  final String? selectedValue;
  final Function(String? value) onChanged;
  final String title;
  final String value;
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    return RadioListTile.adaptive(
      value: value, 
      groupValue: selectedValue, 
      onChanged: onChanged,
      tileColor: Colors.transparent,
      title: Text(title, style: kNormalTextStyle(context).copyWith(
          color: kTextColor(context).withOpacity(0.7),
        ),
      ),
      activeColor: kPrimaryColor,
      selected: selected ?? false,
      selectedTileColor: kPrimaryColor.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r)
      ),
    );
  }
}


class NormalTextField extends StatelessWidget {
  const NormalTextField({
    super.key,
    this.initialValue,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    required this.enabledBorderColor,
    required this.focusedBorderColor,
    required this.errorBorderColor,
    required this.focusedErrorBorderColor,
    required this.errorTextStyleColor,
    required this.iconColor,
    required this.cursorColor,
    required this.prefixIcon,
    this.suffixIcon,
    this.readonly,
    this.fontSize,
    this.textInputType,
    this.textColor,
    this.suffixIconOTap,
    this.labelText,
    this.maxLines,
    this.fillColor,
    this.filled=false,
    this.borderRadius,
    this.validator,
  });

  final String? initialValue;
  final String? labelText;
  final String hintText;
  final bool? readonly;
  final Function(String? value) onChanged;
  final Function()? suffixIconOTap;
  final String? Function(String? value)? validator;
  final Color enabledBorderColor;
  final bool obscureText;
  final Color? textColor;
  final bool? filled;
  final Color? fillColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color focusedErrorBorderColor;
  final Color errorTextStyleColor;
  final Color iconColor;
  final Color cursorColor;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final double? fontSize;
  final TextInputType? textInputType;
  final int? maxLines;
  final double? borderRadius;
  // Function(String? newValue) onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.r),
      child: TextFormField(
        readOnly: readonly ?? false,
        initialValue: initialValue,
        minLines: 1,
        maxLines: maxLines ?? 1,
        style: kNormalTextStyle(context).copyWith(
          fontSize: fontSize ?? 15.sp, 
          color: textColor ?? kTextColor(context),
        ),
        cursorColor: cursorColor,
        obscureText: obscureText,
        keyboardType: textInputType ?? TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          filled: filled,
          fillColor: fillColor,
          hintStyle: kNormalTextStyle(context).copyWith(
              color: kTextColor(context).withOpacity(0.5), 
              fontSize: fontSize ?? 15.sp,
              fontWeight: FontWeight.normal,
            ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 25.r, left: 15.r),
            child: Icon(
              prefixIcon,
              color: iconColor,
              size: 20.r,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: suffixIconOTap ?? () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(suffixIcon, color: kSecondaryColor),
            ),
          ),
          labelStyle: TextStyle(
            color: kTextColor(context).withOpacity(0.5),
            fontWeight: FontWeight.normal,
            fontSize: 15.sp,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: enabledBorderColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorBorderColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedErrorBorderColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          errorStyle: TextStyle(
            color: errorTextStyleColor,
            fontSize: 15.sp,
          ),
        ),
        // onSaved: onSaved,
        onChanged: onChanged,
        validator: validator ??  (value) {
          if (value!.isEmpty ) {
            return 'This field cannot be empty';
          } else {
            return null;
          }
        },
      ),
    );
  }
}


class DropDownFormField extends StatelessWidget {

  const DropDownFormField({
    super.key,
    required this.value,
    required this.items,
    this.labelText,
    this.iconSize,
    this.fontSize,
    this.padding,
    required this.onChanged,
    required this.prefixIcon,
    required this.iconColor, 
    required this.enabledBorderColor, 
    required this.focusedBorderColor, 
    required this.errorBorderColor, 
    required this.focusedErrorBorderColor, 
    required this.errorTextStyleColor,
    this.borderRadius,
  });

  final dynamic value;
  final String? labelText;
  final List<DropdownMenuItem> items;
  final double? fontSize;
  final double? iconSize;
  final EdgeInsets? padding;
  final IconData prefixIcon;
  final Color iconColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color focusedErrorBorderColor;
  final Color errorTextStyleColor;
  final void Function(dynamic value)? onChanged;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      items: items,
      style: kSecondaryNormalTextStyle(context).copyWith(fontSize: fontSize ?? 15.sp),
      onChanged: onChanged,
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 4,
      padding: padding ?? const EdgeInsets.only(bottom: 20.0),
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: kNormalTextStyle(context).copyWith(
          color: kTextColor(context).withOpacity(0.5), 
          fontSize: fontSize ?? 15.sp,
          fontWeight: FontWeight.normal,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 15.r, right: 25.r),
          child: Icon(
            prefixIcon,
            color: iconColor,
            size: iconSize ?? 20.r,
          ),
        ),
        labelStyle: TextStyle(
          color: kTextColor(context).withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 15.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorBorderColor, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedErrorBorderColor, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
        ),
        errorStyle: TextStyle(
          color: errorTextStyleColor,
          fontSize: 17.sp,
        ),
      ),
      validator: (value) {
        if (value == null) {
          return 'Make a choice';
        } else {
          return null;
        }
      },
    );
  }
}

class TextareaTextField extends StatelessWidget {
  const TextareaTextField({
    super.key,
    this.initialValue,
    this.readonly,
    required this.hintText,
    this.labelText,
    required this.onChanged,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    required this.errorTextStyleColor,
    required this.cursorColor,
    this.borderRadius,
    this.validator,
  });

  final String? initialValue;
  final String hintText;
  final String? labelText;
  final bool? readonly;
  final Function(String? value) onChanged;
  final String? Function(String? value)? validator;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;
  final Color errorTextStyleColor;
  final Color cursorColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.r),
      child: TextFormField(
        readOnly: readonly ?? false,
        maxLines: null,
        minLines: 4,
        keyboardType: TextInputType.multiline,
        initialValue: initialValue,
        style: kNormalTextStyle(context),
        cursorColor: cursorColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: kNormalTextStyle(context).copyWith(color: kTextColor(context).withOpacity(0.5)),
          // labelText: labelText ?? hintText,
          labelStyle: TextStyle(
            color: kTextColor(context).withOpacity(0.5),
            fontWeight: FontWeight.normal,
            fontSize: 15.sp,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: enabledBorderColor ?? Colors.transparent, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: focusedBorderColor ?? Colors.transparent, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: errorBorderColor ?? Colors.transparent, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: focusedErrorBorderColor ?? Colors.transparent, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          errorStyle: TextStyle(
            color: errorTextStyleColor,
            fontSize: 15.0,
          ),
        ),
        // onSaved: onSaved,
        onChanged: onChanged,
        validator: validator ?? (value) {
          if (value!.isEmpty || value.length < 5) {
            return 'This field must not be less than 5 characters';
          } else {
            return null;
          }
        },
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key, 
    this.initialValue,
    this.readOnly,
    required this.onChanged,
    required this.iconColor, 
    this.enabledBorderColor, 
    this.focusedBorderColor, 
    this.errorBorderColor, 
    this.focusedErrorBorderColor, 
    required this.errorTextStyleColor, 
    required this.cursorColor,
    this.borderRadius,
    this.labelText,
    this.hintText,
    // required this.disableButton,
  });

  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final bool? readOnly;
  final Color iconColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;
  final Color errorTextStyleColor;
  final Color cursorColor;
  final double? borderRadius;
  // bool disableButton;

  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.r),
      child: TextFormField(
        readOnly: readOnly ?? false,
        initialValue: initialValue,
        cursorColor: cursorColor,
        keyboardType: TextInputType.emailAddress,
        style: kNormalTextStyle(context).copyWith(fontSize: 15.sp),
        decoration: InputDecoration(
          hintText: hintText ?? 'Email',
          hintStyle: kNormalTextStyle(context).copyWith(color: kTextColor(context).withOpacity(0.5)),
          labelText: labelText ?? 'Email',
          labelStyle: TextStyle(
            color: kTextColor(context).withOpacity(0.5),
            fontWeight: FontWeight.normal,
            fontSize: 15.sp,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 25.r, left: 15.r),
            child: Icon(
              Icons.email_rounded,
              color: iconColor,
              size: 20.r,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: enabledBorderColor ?? Colors.transparent, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: focusedBorderColor ?? Colors.transparent, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: errorBorderColor ?? Colors.transparent, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: focusedErrorBorderColor ?? Colors.transparent, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          errorStyle: TextStyle(
            color: errorTextStyleColor,
            fontSize: 15.sp,
          ),
        ),
        onChanged: onChanged,
        validator: (value) {
          return RegExp(
                      r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!)
              ? null
              : 'Please enter a valid email';
        },
      ),
    );
  }
}
