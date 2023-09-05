import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:music_saver/data/repos/songs_repo.dart';
import 'package:music_saver/domain/models/song.dart';
import 'package:music_saver/domain/models/ui/songs_category.dart';

part 'songs_event.dart';
part 'songs_state.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  final SongsRepo _songsRepo;
  SongsBloc({required SongsRepo songsRepo})
      : _songsRepo = songsRepo,
        super(const SongsInitial()) {
    on<SongsEventGet>(_getSongs);

    add(const SongsEventGet());
  }

  Future<void> _getSongs(SongsEventGet event, Emitter<SongsState> emit) async {
    emit(const SongsLoading());

    try {
      final songs = await _songsRepo.getSongs();
      emit(SongsLoaded(songs));
    } catch (e) {
      emit(SongsFailure(e.toString()));
    }
  }
}
