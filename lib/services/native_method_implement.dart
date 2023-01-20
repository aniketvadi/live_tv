import 'package:flutter/services.dart';

class NativeCodeImplement {
  static const platform = MethodChannel("com.crystal.live_tv");

  static Future<int> getRandomNumber() async {
    int random = 0;
    try {
      random = await platform.invokeMethod("getRandomNumber");
    } on PlatformException catch (e) {
      random = 0;
    }
    return random;
  }
}
