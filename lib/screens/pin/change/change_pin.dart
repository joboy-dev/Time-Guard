import 'package:flutter/material.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';

import 'package:time_guard/screens/pin/base_pin_screen.dart';
import 'package:time_guard/screens/pin/change/confirm_pin_change.dart';
import 'package:time_guard/shared/utils/navigator.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  final pinInputController = PinInputController(length: 4);

  @override
  Widget build(BuildContext context) {

    processPin() {
      navigatorPushReplacement(context, ConfirmPinChangeScreen(pin: pinInputController.text,));
    }

    return BasePinScreen(
      pageTitle: 'Change Pin',
      pageSubTitle: 'Enter pin you want to change to',
      pinInputController: pinInputController,
      onSubmit: processPin,
    );
  }
}