// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/screens/dialog/reset_pin_dialog.dart';
import 'package:time_guard/screens/pin/base_pin_screen.dart';
import 'package:time_guard/screens/pin/load_data_screen.dart';
import 'package:time_guard/services/isar.dart';
import 'package:time_guard/services/provider/pin_store.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/button.dart';
import 'package:time_guard/shared/widgets/dialog.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final pinInputController = PinInputController(length: 4);
  final isarDb = IsarDB();

  @override
  Widget build(BuildContext context) {
    final pinStore = context.read<PinStore>();

    processPin() async {
      final pin = await pinStore.loadPin();

      if (pinInputController.text != pin) {
        showSnackbar(context, 'Pin is incorrect. Try again');
      } else {
        await isarDb.reloadData(context);

        // Navigatr to home page
        navigatorPushReplacement(context, const LoadDataScreen());
        showSnackbar(context, 'Pin is correct.');
      }

    }
    return BasePinScreen(
      pageTitle: 'Enter Pin',
      pageSubTitle: 'Enter your pin to continue to the application',
      pinInputController: pinInputController,
      onSubmit: processPin,
      extraWidget: ButtonText(
        firstText: 'Forgot your pin? ', 
        secondText: 'Reset pin', 
        onTap: () {
          showDialogBox(context: context, screen: const ResetPinDialog());
        },
      ),
    );
  }
}