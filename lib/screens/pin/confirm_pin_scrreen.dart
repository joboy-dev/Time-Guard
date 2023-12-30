// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
import 'package:provider/provider.dart';

import 'package:time_guard/screens/pin/base_pin_screen.dart';
import 'package:time_guard/screens/pin/login_screen.dart';
import 'package:time_guard/services/isar.dart';
import 'package:time_guard/services/provider/pin_store.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';

class ConfirmPinScreen extends StatefulWidget {
  const ConfirmPinScreen({super.key, required this.pin});

  final String pin;

  @override
  State<ConfirmPinScreen> createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  final pinInputController = PinInputController(length: 4);

  @override
  Widget build(BuildContext context) {
    final pinStore = context.read<PinStore>();
    final isarDb = IsarDB();

    processPin() async {
      if (pinInputController.text != widget.pin) {
        showSnackbar(context, 'Pin does not match. Try again.');
      } else {
        showSnackbar(context, 'Registering pin...');
        pinStore.setPin(pinInputController.text);
        await isarDb.addInstalledApps(context);
        // await BackgroundService().init();
        navigatorPushReplacement(context, const LoginScreen());
        showSnackbar(context, 'Pin has been registered');
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