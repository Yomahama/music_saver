import 'package:flutter/material.dart';
import 'package:music_saver/constants/theme/animation_durations.dart';
import 'package:music_saver/constants/theme/colors.dart';
import 'package:music_saver/constants/theme/text_styles.dart';

class ClickableText extends StatefulWidget {
  final Function() onPressed;
  final String text;
  final TextStyle textStyle;

  const ClickableText({
    required this.onPressed,
    required this.text,
    this.textStyle = AppTextStyles.black15w800,
    super.key,
  });

  @override
  State<ClickableText> createState() => _ClickableTextState();
}

class _ClickableTextState extends State<ClickableText> with SingleTickerProviderStateMixin {
  TextStyle get _style => widget.textStyle;

  late final AnimationController _animationController;
  late final Animation<TextStyle> _styleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Animations.durationZero,
      reverseDuration: Animations.defaultDuration,
      vsync: this,
    );

    final textColor = _style.color ?? AppColors.black;

    _styleAnimation = TextStyleTween(
      begin: _style,
      end: _style.copyWith(color: textColor.withOpacity(0.2)),
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _animationController.forward();
      },
      onTapUp: (_) {
        _animationController.reverse();
        widget.onPressed();
      },
      onTapCancel: () {
        _animationController.reverse();
      },
      child: DefaultTextStyleTransition(
        style: _styleAnimation,
        child: Text(widget.text),
      ),
    );
  }
}
