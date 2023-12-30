// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:time_guard/models/app_model.dart';
import 'package:time_guard/services/isar.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/button.dart';
import 'package:time_guard/shared/widgets/dialog_header.dart';
import 'package:time_guard/shared/widgets/dialog_text.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';
import 'package:time_guard/shared/widgets/textfield.dart';

class SetUsageLimitDialog extends StatefulWidget {
  const SetUsageLimitDialog({super.key, required this.app,});

  final App app;

  @override
  State<SetUsageLimitDialog> createState() => _SetUsageLimitDialogState();
}

class _SetUsageLimitDialogState extends State<SetUsageLimitDialog> {
  final _formKey = GlobalKey<FormState>();
  String hours = '';
  String minutes = '';
  final isarDb = IsarDB();

  processForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        int hoursInput = int.parse(hours);
        int minutesInput = int.parse(minutes);

        if (minutesInput > 59) {
          showSnackbar(context, 'Minutes value cannot be more than 59');
        } else {
          // convert into seconds
          int inputSeconds = (hoursInput * 3600) + (minutesInput * 60);
          await isarDb.updateUsageLimit(widget.app, '${hours}h ${minutes}m', inputSeconds);

          navigatorPop(context);
          showSnackbar(context, 'Usage limit set to ${hours}h ${minutes}m for ${widget.app.appName}');
        }
      } on FormatException {
        showSnackbar(context, 'Invalid format. Enter valid input');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DialogHeader(
          headerText: 'Set Usage Limit', 
          mainColor: kPrimaryColor,
        ),

        DialogText(
          text: 'Set usage limit for ${widget.app.appName}',
        ),

        Form(
          key: _formKey,
          child: Column(
            children: [
              NormalTextField(
                hintText: 'Enter hours',
                onChanged: (value) {
                  setState(() {
                    hours = value!;
                  });
                },
                enabledBorderColor: kTextColor(context),
                focusedBorderColor: kPrimaryColor,
                errorBorderColor: kRedColor,
                focusedErrorBorderColor: kRedColor,
                errorTextStyleColor: kRedColor,
                iconColor: kPrimaryColor,
                cursorColor: kPrimaryColor,
                prefixIcon: Icons.alarm,
                textInputType: TextInputType.number,
              ),

              NormalTextField(
                hintText: 'Enter minutes (0-59)',
                onChanged: (value) {
                  setState(() {
                    minutes = value!;
                  });
                },
                enabledBorderColor: kTextColor(context),
                focusedBorderColor: kPrimaryColor,
                errorBorderColor: kRedColor,
                focusedErrorBorderColor: kRedColor,
                errorTextStyleColor: kRedColor,
                iconColor: kPrimaryColor,
                cursorColor: kPrimaryColor,
                prefixIcon: Icons.alarm,
                textInputType: TextInputType.number,
              )

          
            ],
          ),
        ),

        DoubleButton(
          inactiveButton: false, 
          button2Text: 'Set Limit', 
          button2Color: kPrimaryColor, 
          button2onPressed: processForm
        )
      ].animate(
        interval: kDurationMs(200),
        effects: MyEffects.fadeSlide(),
      ),
    );
  }
}


