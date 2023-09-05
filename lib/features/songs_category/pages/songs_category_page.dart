import 'package:flutter/material.dart';
import 'package:music_saver/constants/dimens.dart';
import 'package:music_saver/domain/models/ui/songs_category.dart';
import 'package:music_saver/features/songs_category/widgets/song_tile.dart';
import 'package:music_saver/widgets/app_divider.dart';
import 'package:music_saver/widgets/app_sliver_appbar/app_sliver_app_bar.dart';

class SongsCategoryPage extends StatefulWidget {
  final SongsCategory _songsCategory;
  const SongsCategoryPage({required SongsCategory songsCategory, super.key})
      : _songsCategory = songsCategory;

  static const route = '/song_category_page';

  @override
  State<SongsCategoryPage> createState() => _SongsCategoryPageState();
}

class _SongsCategoryPageState extends State<SongsCategoryPage> {
  SongsCategory get _songsCategory => widget._songsCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppSliverAppBar(title: _songsCategory.title),
          SliverPadding(
            padding: Dimens.botPaddingInsets(context),
            sliver: SliverList.separated(
              separatorBuilder: (_, __) => const AppDivider(),
              itemCount: _songsCategory.songs.length,
              itemBuilder: (_, i) => SongTile.simple(song: _songsCategory.songs[i]),
            ),
          ),
        ],
      ),
    );
  }
}
