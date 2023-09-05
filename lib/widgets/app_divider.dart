import 'package:flutter/material.dart';
import 'package:music_saver/constants/theme/colors.dart';

class AppDivider extends StatelessWidget {
  final Color? color;
  final double height;
  final EdgeInsets margin;

  const AppDivider({
    this.color,
    this.height = 1,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color ?? AppColors.grey100,
      margin: margin,
      width: double.infinity,
    );
  }
}
