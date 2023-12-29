import 'package:flutter/material.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
import 'package:provider/provider.dart';

import 'package:time_guard/screens/pin/base_pin_screen.dart';
import 'package:time_guard/services/provider/pin_store.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';

class ConfirmPinChangeScreen extends StatefulWidget {
  const ConfirmPinChangeScreen({super.key, required this.pin});

  final String pin;

  @override
  State<ConfirmPinChangeScreen> createState() => _ConfirmPinChangeScreenState();
}

class _ConfirmPinChangeScreenState extends State<ConfirmPinChangeScreen> {
  final pinInputController = PinInputController(length: 4);

  @override
  Widget build(BuildContext context) {
    final pinStore = context.read<PinStore>();

    processPin() {
      if (pinInputController.text != widget.pin) {
        showSnackbar(context, 'Pin does not match. Try again.');
      } else {
        pinStore.setPin(pinInputController.text);
        navigatorPop(context);
        showSnackbar(context, 'Pin has been changed to ${pinInputController.text}');
      }
    }
    return BasePinScreen(
      pageTitle: 'Re-enter Pin',
      pageSubTitle: 'Confirm your pin',
      pinInputController: pinInputController,
      onSubmit: processPin,
    );
  }
}