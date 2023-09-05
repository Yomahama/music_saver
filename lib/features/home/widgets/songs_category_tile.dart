import 'package:flutter/material.dart';
import 'package:music_saver/constants/dimens.dart';
import 'package:music_saver/constants/theme/text_styles.dart';
import 'package:music_saver/domain/models/ui/songs_category.dart';
import 'package:music_saver/features/home/widgets/song_card.dart';
import 'package:music_saver/features/songs_category/pages/songs_category_page.dart';
import 'package:music_saver/widgets/clickable_text.dart';

class SongsCategoryTile extends StatelessWidget {
  final SongsCategory _songsCategory;
  const SongsCategoryTile({required SongsCategory songsCategory, super.key})
      : _songsCategory = songsCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SongsCategoryHeader(songsCategory: _songsCategory),
        const SizedBox(height: 10),
        SizedBox(
          height: 170,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            separatorBuilder: (_, __) => const SizedBox(width: 5),
            itemCount: _songsCategory.songs.length < 5 ? _songsCategory.songs.length : 5,
            itemBuilder: (_, i) => SongCard(song: _songsCategory.songs[i]),
          ),
        ),
      ],
    );
  }
}

class _SongsCategoryHeader extends StatelessWidget {
  final SongsCategory _songsCategory;
  const _SongsCategoryHeader({required SongsCategory songsCategory})
      : _songsCategory = songsCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.hPadding),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _songsCategory.title,
              style: AppTextStyles.black19w600,
            ),
          ),
          const SizedBox(width: 20),
          ClickableText(
            onPressed: () {
              Navigator.pushNamed(context, SongsCategoryPage.route, arguments: _songsCategory);
            },
            text: 'See all',
          ),
        ],
      ),
    );
  }
}
