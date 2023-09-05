import 'package:flutter/material.dart';
import 'package:music_saver/constants/theme/colors.dart';
import 'package:music_saver/constants/theme/text_styles.dart';

abstract class AppTheme {
  static final data = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.black),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: AppColors.transparent,
      shadowColor: AppColors.transparent,
      backgroundColor: AppColors.white,
      titleTextStyle: AppTextStyles.black18w600,
    ),
  );
}
