import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:time_guard/shared/utils/logger.dart';

class PinStore extends ChangeNotifier{
  
  String? _pin ;
  String get pin => _pin!;

  // initialize secure storage
  final storage = const FlutterSecureStorage();
  final key = 'pincode';

  void setPin(String pincode) async {
    // Store pincode in secure storage
    await storage.write(key: key, value: pincode);
    logger('(PinStore) Pin: $pincode');

    // set prin in provider
    _pin = pincode;
    notifyListeners();
  }

  void clearPin() async {
    // delete prin from storage
    await storage.delete(key: key);
    
    // reset pin in provider
    _pin = null;
    notifyListeners();
  }

  Future<String?> loadPin() async {
    _pin = await storage.read(key: key);
    logger('Loading pin: $_pin');
    return _pin;
  }

}