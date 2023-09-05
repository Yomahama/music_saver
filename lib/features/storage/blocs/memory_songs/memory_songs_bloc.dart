import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_saver/domain/models/song.dart';

part 'memory_songs_event.dart';
part 'memory_songs_state.dart';

class MemorySongsBloc extends Bloc<MemorySongsEvent, MemorySongsState> {
  MemorySongsBloc() : super(const MemorySongsState()) {
    on<MemorySongEventAddSong>(_addSong);
    on<MemorySongEventRemoveSong>(_removeSong);
  }

  void _addSong(MemorySongEventAddSong event, Emitter<MemorySongsState> emit) {
    final songs = List<Song>.from(state.songs);
    songs.add(event.song);

    emit(MemorySongsState(songs));
  }

  void _removeSong(MemorySongEventRemoveSong event, Emitter<MemorySongsState> emit) {
    final songs = List<Song>.from(state.songs);
    songs.remove(event.song);

    emit(MemorySongsState(songs));
  }
}
