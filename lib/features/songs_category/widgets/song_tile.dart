import 'package:flutter/material.dart';
import 'package:music_saver/animations/tap_animations/animated_color_tap.dart';
import 'package:music_saver/constants/theme/text_styles.dart';
import 'package:music_saver/domain/models/song.dart';
import 'package:music_saver/extensions/duration_extensions.dart';
import 'package:music_saver/widgets/app_cached_network_image.dart';

class SongTile extends StatelessWidget {
  final Song _song;
  final Widget? _trailingChild;

  const SongTile._({required Song song, Widget? trailingChild, super.key})
      : _song = song,
        _trailingChild = trailingChild;

  const SongTile.simple({required Song song, Key? key}) : this._(song: song, key: key);

  const SongTile.withLeadingButton({required Song song, required Widget trailingChild, Key? key})
      : this._(song: song, trailingChild: trailingChild, key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedColorTap(
      padding: EdgeInsets.zero,
      onTap: () {},
      child: Row(
        children: [
          const SizedBox(width: 15),
          AppCachedNetworkImage(
            url: _song.coverUrl,
            height: 50,
            width: 60,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_song.title, style: AppTextStyles.black15w700),
                  const SizedBox(height: 4),
                  Text(
                    '${_song.formattedSize} • ${_song.duration.tohhmmss()}',
                    style: AppTextStyles.grey600shade12w400,
                  ),
                ],
              ),
            ),
          ),
          if (_trailingChild != null) _trailingChild!,
        ],
      ),
    );
  }
}
