import 'package:flutter/material.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';

import 'package:time_guard/screens/pin/base_pin_screen.dart';
import 'package:time_guard/screens/pin/confirm_pin_scrreen.dart';
import 'package:time_guard/shared/utils/logger.dart';
import 'package:time_guard/shared/utils/navigator.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final pinInputController = PinInputController(length: 4);

  @override
  Widget build(BuildContext context) {
    return BasePinScreen(
      pageTitle: 'Register Pin',
      pageSubTitle: 'Enter your desired pin',
      pinInputController: pinInputController,
      onSubmit: () {
        logger(pinInputController.text);
        navigatorPush(context, ConfirmPinScreen(pin: pinInputController.text));
      },
    );
  }
}