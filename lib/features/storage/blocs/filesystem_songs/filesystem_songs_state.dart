part of 'filesystem_songs_bloc.dart';

class FilesystemSongsState extends Equatable {
  final List<Song> songs;
  final String? error;
  const FilesystemSongsState({this.songs = const [], this.error});

  bool isAdded(Song song) {
    return songs.contains(song);
  }

  @override
  List<Object?> get props => [songs, error];
}
