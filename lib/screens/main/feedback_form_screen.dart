import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/services/email.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/widgets/button.dart';
import 'package:time_guard/shared/widgets/custom_appbar.dart';
import 'package:time_guard/shared/widgets/loader.dart';
import 'package:time_guard/shared/widgets/textfield.dart';

class FeedbackFromScreen extends StatefulWidget {
  const FeedbackFromScreen({super.key});

  @override
  State<FeedbackFromScreen> createState() => _FeedbackFromScreenState();
}

class _FeedbackFromScreenState extends State<FeedbackFromScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String feedback = '';

  bool isLoading = false;

  validateFrom() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await EmailService().sendMail(context, name, email, feedback);

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      screen: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomAppbar(
              title: 'Send Feedback- To help us improve',
              backgroundColor: Colors.transparent,
              titleColor: kTextColor(context).withOpacity(0.5),
              elevation: 0.0,
              
            ),
            SizedBox(height: 20.h),

            NormalTextField(
              hintText: 'Name', 
              onChanged: (value) {
                setState(() {
                  name = value!;
                });
              }, 
              enabledBorderColor: kTextColor(context),
              focusedBorderColor: kPrimaryColor,
              errorBorderColor: kRedColor,
              focusedErrorBorderColor: kRedColor,
              errorTextStyleColor: kRedColor,
              iconColor: kPrimaryColor, 
              cursorColor: kPrimaryColor, 
              prefixIcon: Icons.person,
            ),

            EmailTextField(
              onChanged: (value) {
                setState(() {
                  email = value!;
                });
              }, 
              enabledBorderColor: kTextColor(context),
              focusedBorderColor: kPrimaryColor,
              errorBorderColor: kRedColor,
              focusedErrorBorderColor: kRedColor,
              errorTextStyleColor: kRedColor,
              iconColor: kPrimaryColor, 
              cursorColor: kPrimaryColor, 
            ),

            TextareaTextField(
              hintText: 'Enter feedback', 
              onChanged: (value) {
                setState(() {
                  feedback = value!;
                });
              }, 
              errorTextStyleColor: kRedColor, 
              cursorColor: kPrimaryColor,
              enabledBorderColor: kTextColor(context),
              focusedBorderColor: kPrimaryColor,
              errorBorderColor: kRedColor,
              focusedErrorBorderColor: kRedColor,
            ),

            isLoading ? const Loader() : Button(
              buttonText: 'Send Feedback', 
              onPressed: validateFrom, 
              buttonColor: kPrimaryColor, 
              inactive: false,
              textColor: kSecondaryColor,
            ),

          ].animate(
            interval: kDurationMs(200),
            effects: MyEffects.fadeSlide()
          ),
        ),
      ),
    );
  }
}