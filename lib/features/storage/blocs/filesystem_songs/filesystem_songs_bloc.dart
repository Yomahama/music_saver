import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:music_saver/data/repos/songs_repo.dart';
import 'package:music_saver/domain/models/song.dart';

part 'filesystem_songs_event.dart';
part 'filesystem_songs_state.dart';

class FilesystemSongsBloc extends Bloc<FilesystemSongsEvent, FilesystemSongsState> {
  final SongsRepo _songsRepo;
  FilesystemSongsBloc({required SongsRepo songsRepo})
      : _songsRepo = songsRepo,
        super(const FilesystemSongsState()) {
    on<FilesystemSongsEventGetSongs>(_getSongs);
    on<FilesystemSongsEventAddSong>(_addSong);
    on<FilesystemSongsEventRemoveSong>(_removeSong);
    on<FilesystemSongsEventSaveChanges>(_saveChanges);

    add(const FilesystemSongsEventGetSongs());
  }

  Future<void> _getSongs(
    FilesystemSongsEventGetSongs event,
    Emitter<FilesystemSongsState> emit,
  ) async {
    final songs = await _songsRepo.readSongs();
    emit(FilesystemSongsState(songs: songs));
  }

  Future<void> _addSong(
    FilesystemSongsEventAddSong event,
    Emitter<FilesystemSongsState> emit,
  ) async {
    final currentSongs = List<Song>.from(state.songs);

    final newSongs = [...currentSongs, event.song];
    emit(FilesystemSongsState(songs: newSongs));

    add(FilesystemSongsEventSaveChanges(currentSongs: currentSongs, newSongs: newSongs));
  }

  Future<void> _removeSong(
    FilesystemSongsEventRemoveSong event,
    Emitter<FilesystemSongsState> emit,
  ) async {
    final currentSongs = List<Song>.from(state.songs);

    final newSongs = List<Song>.from(currentSongs);
    newSongs.remove(event.song);
    emit(FilesystemSongsState(songs: newSongs));

    add(FilesystemSongsEventSaveChanges(currentSongs: currentSongs, newSongs: newSongs));
  }

  Future<void> _saveChanges(
    FilesystemSongsEventSaveChanges event,
    Emitter<FilesystemSongsState> emit,
  ) async {
    try {
      final hasSaved = await _songsRepo.writeSongs(event.newSongs);

      if (!hasSaved) {
        emit(FilesystemSongsState(songs: event.currentSongs, error: 'Unable to save'));
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(FilesystemSongsState(songs: event.currentSongs, error: e.toString()));
    }
  }
}
