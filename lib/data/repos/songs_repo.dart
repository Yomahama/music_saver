import 'package:music_saver/data/models/song/song_mapper.dart';
import 'package:music_saver/data/services/songs_service.dart';
import 'package:music_saver/domain/models/song.dart';
import 'package:music_saver/domain/repos_interfaces/songs_repo_interface.dart';

class SongsRepo implements ISongsRepo {
  final SongsService _songsService;

  const SongsRepo({required SongsService songsService}) : _songsService = songsService;

  @override
  Future<List<Song>> getSongs() async {
    final songsDto = await _songsService.getSongs();
    return SongMapper.toSongs(songsDto);
  }

  @override
  Future<List<Song>> readSongs() async {
    final songsDto = await _songsService.readSongs();
    if (songsDto == null) return [];

    return SongMapper.toSongs(songsDto);
  }

  @override
  Future<bool> writeSongs(List<Song> songs) async {
    final songsDto = SongMapper.toSongsDto(songs);
    return _songsService.writeSongs(songsDto);
  }
}
