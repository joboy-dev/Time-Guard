import 'package:flutter/material.dart';

navigatorPop(BuildContext context) {
  Navigator.of(context).pop();
}

navigatorPushReplacement(BuildContext context, Widget screen) {
  Navigator.of(context).pushReplacement(screenRoute(screen));
}

navigatorPush(BuildContext context, Widget screen) {
  Navigator.of(context).push(screenRoute(screen));
}

Route screenRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut)); 
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child
      );
    },
  );
}
