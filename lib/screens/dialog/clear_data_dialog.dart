// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:time_guard/screens/wrapper.dart';
import 'package:time_guard/services/provider/pin_store.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/button.dart';
import 'package:time_guard/shared/widgets/dialog_header.dart';
import 'package:time_guard/shared/widgets/dialog_text.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';
import 'package:time_guard/services/isar.dart';


class ClearDataDialog extends StatefulWidget {
  const ClearDataDialog({super.key});

  @override
  State<ClearDataDialog> createState() => _ClearDataDialogState();
}

class _ClearDataDialogState extends State<ClearDataDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DialogHeader(
          headerText: 'Erase Data', 
          mainColor: kRedColor,
        ),

        const DialogText(
          text: 'This is an irreversible process and all your data will be lost forever. Are you sure you want to do this?',
        ),

        DoubleButton(
          inactiveButton: false, 
          button2Text: 'Yes', 
          button2Color: kPrimaryColor, 
          button2onPressed: () async {
            // navigatorPushReplacementNamed(context, GetStarted.id);
            showSnackbar(context, 'Clearing data...');
            PinStore().clearPin();
            await IsarDB().clearDB(context);
            navigatorPushReplacement(context, const Wrapper());
            showSnackbar(context, 'All data cleared.');
          }
        )
      ].animate(
        interval: kDurationMs(200),
        effects: MyEffects.fadeSlide(),
      ),
    );
  }
}
