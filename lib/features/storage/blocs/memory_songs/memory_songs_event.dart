part of 'memory_songs_bloc.dart';

sealed class MemorySongsEvent extends Equatable {
  const MemorySongsEvent();

  @override
  List<Object> get props => [];
}

final class MemorySongEventAddSong extends MemorySongsEvent {
  final Song song;

  const MemorySongEventAddSong(this.song);

  @override
  List<Object> get props => [song];
}

final class MemorySongEventRemoveSong extends MemorySongsEvent {
  final Song song;

  const MemorySongEventRemoveSong(this.song);

  @override
  List<Object> get props => [song];
}
