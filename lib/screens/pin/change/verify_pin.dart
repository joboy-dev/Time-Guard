// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/screens/pin/base_pin_screen.dart';
import 'package:time_guard/screens/pin/change/change_pin.dart';
import 'package:time_guard/services/provider/pin_store.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';

class VerifyPinScreen extends StatefulWidget {
  const VerifyPinScreen({super.key});

  @override
  State<VerifyPinScreen> createState() => _VerifyPinScreenState();
}

class _VerifyPinScreenState extends State<VerifyPinScreen> {
  final pinInputController = PinInputController(length: 4);

  @override
  Widget build(BuildContext context) {
    final pinStore = context.read<PinStore>();

    processPin() async {
      final pin = await pinStore.loadPin();

      if (pinInputController.text != pin) {
        showSnackbar(context, 'Pin is incorrect. Try again');
      } else {
        // Navigatr to home page
        navigatorPushReplacement(context, const ChangePinScreen());
        showSnackbar(context, 'Pin is correct. Change your pin');
      }

    }
    return BasePinScreen(
      pageTitle: 'Enter Pin',
      pageSubTitle: 'Enter your old pin',
      pinInputController: pinInputController,
      onSubmit: processPin,
    );
  }
}