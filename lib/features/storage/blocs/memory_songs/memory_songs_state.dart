part of 'memory_songs_bloc.dart';

class MemorySongsState extends Equatable {
  final List<Song> songs;
  const MemorySongsState([this.songs = const []]);

  bool isAdded(Song song) {
    return songs.contains(song);
  }

  @override
  List<Object> get props => [songs];
}
