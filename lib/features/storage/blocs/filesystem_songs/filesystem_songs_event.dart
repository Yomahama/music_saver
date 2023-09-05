part of 'filesystem_songs_bloc.dart';

sealed class FilesystemSongsEvent extends Equatable {
  const FilesystemSongsEvent();

  @override
  List<Object> get props => [];
}

final class FilesystemSongsEventAddSong extends FilesystemSongsEvent {
  final Song song;

  const FilesystemSongsEventAddSong(this.song);

  @override
  List<Object> get props => [song];
}

final class FilesystemSongsEventRemoveSong extends FilesystemSongsEvent {
  final Song song;

  const FilesystemSongsEventRemoveSong(this.song);

  @override
  List<Object> get props => [song];
}

final class FilesystemSongsEventGetSongs extends FilesystemSongsEvent {
  const FilesystemSongsEventGetSongs();
}

final class FilesystemSongsEventSaveChanges extends FilesystemSongsEvent {
  final List<Song> currentSongs;
  final List<Song> newSongs;

  const FilesystemSongsEventSaveChanges({
    required this.currentSongs,
    required this.newSongs,
  });

  @override
  List<Object> get props => [currentSongs, newSongs];
}
