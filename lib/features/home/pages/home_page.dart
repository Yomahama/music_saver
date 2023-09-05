import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_saver/constants/dimens.dart';
import 'package:music_saver/constants/theme/text_styles.dart';
import 'package:music_saver/domain/models/ui/songs_storage.dart';
import 'package:music_saver/domain/models/ui/storage_type_enum.dart';
import 'package:music_saver/features/home/bloc/songs_bloc.dart';
import 'package:music_saver/features/home/widgets/songs_category_tile.dart';
import 'package:music_saver/features/home/widgets/storage_tile.dart';
import 'package:music_saver/features/storage/blocs/filesystem_songs/filesystem_songs_bloc.dart';
import 'package:music_saver/features/storage/blocs/memory_songs/memory_songs_bloc.dart';
import 'package:music_saver/widgets/app_divider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            BlocBuilder<SongsBloc, SongsState>(
              builder: (context, state) {
                if (state is! SongsLoaded) return const SliverToBoxAdapter();
                final songsCategories = state.getSongsCategory();

                return SliverList.separated(
                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                  itemCount: songsCategories.length,
                  itemBuilder: (_, i) => SongsCategoryTile(songsCategory: songsCategories[i]),
                );
              },
            ),
            SliverList.list(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.hPadding),
                  child: Text('Storage', style: AppTextStyles.black19w600),
                ),
                const SizedBox(height: 10),
                BlocBuilder<MemorySongsBloc, MemorySongsState>(
                  builder: (context, state) {
                    return StorageTile(
                      songsStorage: SongsStorage(
                        storageType: StorageType.memory,
                        songs: state.songs,
                      ),
                    );
                  },
                ),
                const AppDivider(),
                BlocBuilder<FilesystemSongsBloc, FilesystemSongsState>(
                  builder: (context, state) {
                    return StorageTile(
                      songsStorage: SongsStorage(
                        storageType: StorageType.filesystem,
                        songs: state.songs,
                      ),
                    );
                  },
                ),
                const AppDivider(),
                SizedBox(height: Dimens.botPaddingDouble(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
