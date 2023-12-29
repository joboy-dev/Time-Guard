import 'package:flutter/material.dart';
import 'package:time_guard/screens/onboarding/get_started_screen.dart';
import 'package:time_guard/screens/pin/login_screen.dart';
import 'package:time_guard/services/provider/pin_store.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String? _pin;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // call function to load pin
      String? pin = await PinStore().loadPin();
      setState(() {
        _pin = pin;
      });

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return _pin == null ? const GetStartedScreen() : const LoginScreen();
  }
}