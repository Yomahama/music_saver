import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:music_saver/data/models/song/song_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongsService {
  final SharedPreferences _sharedPreferences;

  const SongsService({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  Future<List<SongDto>> getSongs() async {
    final response = await rootBundle.loadString('assets/data.json');
    final json = jsonDecode(response);

    final songs = List<SongDto>.from(json.map((songDto) => SongDto.fromMap(songDto)));
    return songs;
  }

  Future<bool> writeSongs(List<SongDto> songsDto) async {
    final json = jsonEncode(songsDto.map((x) => x.toMap()).toList());
    return _sharedPreferences.setString('songsDto', json);
  }

  Future<List<SongDto>?> readSongs() async {
    final response = _sharedPreferences.getString('songsDto');
    if (response == null) return null;

    final songsList = jsonDecode(response);
    return List<SongDto>.from(songsList.map((x) => SongDto.fromMap(x)));
  }
}
