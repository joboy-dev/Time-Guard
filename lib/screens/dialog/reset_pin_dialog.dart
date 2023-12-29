import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/services/provider/pin_store.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/button.dart';
import 'package:time_guard/shared/widgets/dialog_header.dart';
import 'package:time_guard/shared/widgets/dialog_text.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';

class ResetPinDialog extends StatefulWidget {
  const ResetPinDialog({super.key});

  @override
  State<ResetPinDialog> createState() => _ResetPinDialogState();
}

class _ResetPinDialogState extends State<ResetPinDialog> {
  // Generate random pin
  int pincode = Random().nextInt(9000) + 1000;
  String _pin = '';

  @override
  Widget build(BuildContext context) {
    final pinStore = context.read<PinStore>();

    savePin () {
      setState(() {
        // convert random pin number to string
        _pin = pincode.toString();
      });

      // save pin to flutter secure storage
      pinStore.setPin(_pin);
      showSnackbar(context, 'Pin has been set to $_pin.');
      navigatorPop(context);
    }

    return Column(
      children: [
        DialogHeader(
          headerText: 'Reset Pin', 
          mainColor: kPrimaryColor,
          icon: Icons.restore,
        ),

        DialogText(
          text: 'Your new pin will be $pincode.',
        ),

        DoubleButton(
          inactiveButton: false, 
          button2Text: 'Save Pin', 
          button2Color: kPrimaryColor, 
          button2onPressed: () {
            savePin();
          }
        )
      ].animate(
        interval: kDurationMs(200),
        effects: MyEffects.fadeSlide(),
      ),
    );
  }
}
