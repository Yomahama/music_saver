import 'package:flutter/material.dart';
import 'package:music_saver/constants/theme/colors.dart';

class AppBackButton extends StatelessWidget {
  final Function()? onTap;

  const AppBackButton({this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onTap ?? Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_rounded, color: AppColors.black),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
