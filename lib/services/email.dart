// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:time_guard/shared/utils/logger.dart';
import 'package:time_guard/shared/widgets/snackbar.dart';

class EmailService {
  /// Function to send email
  sendMail(BuildContext context, String name, String email, String feedback) async {
    String username = 'devjoboy@gmail.com';
    String password = 'wjjcdzoqptoyaqwo';

    final smtpServer = gmail(username, password);

    final message = Message()
    ..from=Address(username, 'Joseph')
    ..recipients=[username]
    ..subject='Feedback from Time Guard Application'
    ..text='''
      Feedback message from $name.\n
      Email: $email\n\n

      Message:\n
      $feedback
    ''';

    try {
      await send(message, smtpServer);
      showSnackbar(context, 'Feedback sent successfully');
    } on MailerException {
      showSnackbar(context, 'An error occured while sending feedback');
    } catch (e) {
      showSnackbar(context, 'An error occured');
      logger(e.toString());
    }

  }
}