import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_saver/constants/theme/animation_durations.dart';
import 'package:music_saver/constants/theme/colors.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String _url;
  final double _width;
  final double _height;
  const AppCachedNetworkImage({
    required String url,
    double width = 120,
    double height = 100,
    super.key,
  })  : _url = url,
        _width = width,
        _height = height;

  static const _borderRadius = BorderRadius.all(Radius.circular(4));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      decoration: const BoxDecoration(
        color: AppColors.grey150,
        borderRadius: _borderRadius,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: _url,
            fit: BoxFit.cover,
            placeholder: (_, __) => const SizedBox(),
            errorWidget: (_, __, ___) => const SizedBox(),
            fadeInDuration: Animations.defaultDuration,
          ),
          Container(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              border: Border.all(color: Colors.black26.withOpacity(0.05), width: 0.75),
            ),
          ),
        ],
      ),
    );
  }
}
