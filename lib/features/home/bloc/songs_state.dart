part of 'songs_bloc.dart';

sealed class SongsState extends Equatable {
  const SongsState();

  @override
  List<Object> get props => [];
}

final class SongsInitial extends SongsState {
  const SongsInitial();
}

final class SongsLoading extends SongsState {
  const SongsLoading();
}

final class SongsLoaded extends SongsState {
  final List<Song> songs;
  const SongsLoaded(this.songs);

  List<SongsCategory> getSongsCategory() {
    final Map<String, List<Song>> songsByGendre = groupBy(songs, (song) => song.genre);

    return songsByGendre.entries
        .map((entry) => SongsCategory(title: entry.key, songs: entry.value))
        .toList();
  }

  @override
  List<Object> get props => [songs];
}

final class SongsFailure extends SongsState {
  final String error;
  const SongsFailure(this.error);

  @override
  List<Object> get props => [error];
}
