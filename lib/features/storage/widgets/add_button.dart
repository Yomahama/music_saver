import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:music_saver/constants/theme/animation_durations.dart';
import 'package:music_saver/constants/theme/colors.dart';

class AddButton extends StatefulWidget {
  final Function() onTap;
  final bool isAdded;
  const AddButton({required this.onTap, required this.isAdded, super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Animations.duration200);

    final tween = Tween<double>(
      begin: widget.isAdded ? 1 : 0,
      end: widget.isAdded ? 0 : 1,
    );

    _animation = tween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AddButton oldWidget) {
    if (oldWidget.isAdded != widget.isAdded) {
      _runAnimation();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _runAnimation() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        widget.onTap();
        HapticFeedback.mediumImpact();
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (_, child) {
            return Transform.rotate(
              angle: pi * (1 - _animation.value),
              child: child,
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              FadeTransition(
                opacity: _animation,
                child: const Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  size: 26,
                  color: AppColors.green,
                ),
              ),
              FadeTransition(
                opacity: _animation.drive(Tween<double>(begin: 1, end: 0)),
                child: const Icon(
                  CupertinoIcons.add_circled,
                  size: 26,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
