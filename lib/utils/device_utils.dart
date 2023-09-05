import 'package:flutter/material.dart';

class DeviceUtils {
  const DeviceUtils._();

  static EdgeInsets viewPadding(BuildContext context) {
    return MediaQuery.of(context).viewPadding;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
