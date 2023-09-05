import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_saver/constants/dimens.dart';
import 'package:music_saver/domain/models/song.dart';
import 'package:music_saver/domain/models/ui/storage_type_enum.dart';
import 'package:music_saver/features/home/bloc/songs_bloc.dart';
import 'package:music_saver/features/songs_category/widgets/song_tile.dart';
import 'package:music_saver/features/storage/blocs/filesystem_songs/filesystem_songs_bloc.dart';
import 'package:music_saver/features/storage/blocs/memory_songs/memory_songs_bloc.dart';
import 'package:music_saver/features/storage/widgets/add_button.dart';
import 'package:music_saver/widgets/app_divider.dart';
import 'package:music_saver/widgets/app_sliver_appbar/app_sliver_app_bar.dart';

class StorageSongsPage extends StatelessWidget {
  final StorageType _storageType;
  const StorageSongsPage({required StorageType storageType, super.key})
      : _storageType = storageType;

  static const route = '/storage_songs_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppSliverAppBar(title: _storageType.title),
          SliverPadding(
            padding: Dimens.botPaddingInsets(context),
            sliver: BlocBuilder<SongsBloc, SongsState>(
              builder: (context, state) {
                if (state is! SongsLoaded) return const SliverToBoxAdapter();
                final songs = state.songs;

                return SliverList.separated(
                  separatorBuilder: (_, __) => const AppDivider(),
                  itemCount: songs.length,
                  itemBuilder: (_, i) => SongTile.withLeadingButton(
                    song: songs[i],
                    trailingChild: _storageType == StorageType.memory
                        ? AddSongToMemoryButton(song: songs[i])
                        : AddSongToFilesystemButton(song: songs[i]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AddSongToMemoryButton extends StatelessWidget {
  final Song _song;
  const AddSongToMemoryButton({required Song song, super.key}) : _song = song;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemorySongsBloc, MemorySongsState>(
      buildWhen: (p, c) => p.isAdded(_song) != c.isAdded(_song),
      builder: (context, state) {
        final isAdded = state.isAdded(_song);

        return AddButton(
          onTap: () {
            if (isAdded) {
              context.read<MemorySongsBloc>().add(MemorySongEventRemoveSong(_song));
            } else {
              context.read<MemorySongsBloc>().add(MemorySongEventAddSong(_song));
            }
          },
          isAdded: isAdded,
        );
      },
    );
  }
}

class AddSongToFilesystemButton extends StatelessWidget {
  final Song _song;
  const AddSongToFilesystemButton({required Song song, super.key}) : _song = song;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilesystemSongsBloc, FilesystemSongsState>(
      buildWhen: (p, c) => p.isAdded(_song) != c.isAdded(_song),
      builder: (context, state) {
        final isAdded = state.isAdded(_song);

        return AddButton(
          onTap: () {
            if (isAdded) {
              context.read<FilesystemSongsBloc>().add(FilesystemSongsEventRemoveSong(_song));
            } else {
              context.read<FilesystemSongsBloc>().add(FilesystemSongsEventAddSong(_song));
            }
          },
          isAdded: isAdded,
        );
      },
    );
  }
}
