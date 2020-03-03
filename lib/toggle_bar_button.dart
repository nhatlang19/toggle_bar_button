import 'dart:async';

import 'package:flutter/services.dart';

class ToggleBarButton {
  static const MethodChannel _channel =
      const MethodChannel('toggle_bar_button');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
