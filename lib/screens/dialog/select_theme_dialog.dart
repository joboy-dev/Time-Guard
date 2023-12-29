import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/services/provider/theme_provider.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/utils/navigator.dart';
import 'package:time_guard/shared/widgets/dialog_header.dart';
import 'package:time_guard/shared/widgets/dialog_text.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';
import 'package:time_guard/shared/widgets/textfield.dart';

class SelectThemeDialog extends StatefulWidget {
  const SelectThemeDialog({super.key});

  @override
  State<SelectThemeDialog> createState() => _SelectThemeDialogState();
}

class _SelectThemeDialogState extends State<SelectThemeDialog> {
  final _formKey = GlobalKey<FormState>();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    /// Function to determine which radio item will be selected
    bool isSelected(String value) {
      if (themeProvider.themeValue == value) {
        return true;
      } else {
        return false;
      }
    }

    return Column(
      children: [
        DialogHeader(
          headerText: 'Select Theme', 
          mainColor: kPrimaryColor,
        ),

        const DialogText(
          text: 'Change the theme of the app',
        ),

        Form(
          key: _formKey,
          child: Column(
            children: [
              RadioField(
                title: 'Dark Theme',
                value: 'dark',
                selectedValue: selectedValue,
                selected: isSelected('dark'),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                  themeProvider.setThemeMode(value!);
                  showSnackbar(context, 'Theme set to $value theme');
                  navigatorPop(context);
                  // logger(selectedValue!);
                },
              ),

              RadioField(
                title: 'Light Theme',
                value: 'light',
                selectedValue: selectedValue,
                selected: isSelected('light'),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                  themeProvider.setThemeMode(value!);
                  showSnackbar(context, 'Theme set to $value theme');
                  navigatorPop(context);
                  // logger(selectedValue!);
                },
              ),

              RadioField(
                title: 'System Default',
                value: 'system',
                selectedValue: selectedValue,
                selected: isSelected('system'),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                  themeProvider.setThemeMode(value!);
                  showSnackbar(context, 'Theme set to $value theme');
                  navigatorPop(context);
                  // logger(selectedValue!);
                },
              ),
            ],
          ),
        ),

        // DoubleButton(
        //   inactiveButton: false, 
        //   button2Text: 'Select', 
        //   button2Color: kPrimaryColor, 
        //   button2onPressed: () {
        //   }
        // )
      ].animate(
        interval: kDurationMs(200),
        effects: MyEffects.fadeSlide(),
      ),
    );
  }
}


