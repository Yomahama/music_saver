import 'package:flutter/material.dart';
import 'package:music_saver/utils/device_utils.dart';

abstract class Dimens {
  static EdgeInsets botPaddingInsets(BuildContext context, [double additionalPadding = 20]) {
    return EdgeInsets.only(bottom: DeviceUtils.viewPadding(context).bottom + additionalPadding);
  }

  static double botPaddingDouble(BuildContext context, [double additionalPadding = 20]) {
    return DeviceUtils.viewPadding(context).bottom + additionalPadding;
  }

  static const hPadding = 10.0;
}
