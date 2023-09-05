import 'package:flutter/material.dart';
import 'package:music_saver/constants/theme/animation_durations.dart';
import 'package:music_saver/constants/theme/colors.dart';

class AnimatedColorTap extends StatefulWidget {
  final Function()? onTap;
  final Widget child;
  final EdgeInsets? padding;
  final BorderRadius borderRadius;

  const AnimatedColorTap({
    required this.onTap,
    required this.child,
    this.padding = const EdgeInsets.all(15),
    this.borderRadius = BorderRadius.zero,
    super.key,
  });

  @override
  State<AnimatedColorTap> createState() => _AnimatedColorTapState();
}

class _AnimatedColorTapState extends State<AnimatedColorTap> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _highlightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Animations.durationZero,
      reverseDuration: Animations.defaultDuration,
      vsync: this,
    );

    _highlightAnimation = ColorTween(
      begin: AppColors.white,
      end: AppColors.grey200,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      onTapCancel: () {
        _controller.reverse();
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedBuilder(
        animation: _highlightAnimation,
        builder: (_, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              color: _highlightAnimation.value,
            ),
            padding: widget.padding,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
