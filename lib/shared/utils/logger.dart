import 'dart:developer';

import 'package:flutter/foundation.dart';

logger(Object object) {
  if (kDebugMode) {
    log('$object');
  }
}