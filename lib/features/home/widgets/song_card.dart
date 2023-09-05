import 'package:flutter/material.dart';
import 'package:music_saver/animations/tap_animations/animated_color_tap.dart';
import 'package:music_saver/constants/theme/text_styles.dart';
import 'package:music_saver/domain/models/song.dart';
import 'package:music_saver/extensions/duration_extensions.dart';
import 'package:music_saver/widgets/app_cached_network_image.dart';

class SongCard extends StatelessWidget {
  final Song song;
  const SongCard({required this.song, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedColorTap(
      padding: const EdgeInsets.all(5),
      borderRadius: BorderRadius.circular(4),
      onTap: () {},
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCachedNetworkImage(url: song.coverUrl),
            const SizedBox(height: 6),
            Text(
              song.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.black15w700,
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(song.formattedSize, style: AppTextStyles.grey600shade12w400),
                Text(song.duration.tohhmmss(), style: AppTextStyles.grey600shade12w400),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
