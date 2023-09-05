import 'package:music_saver/domain/models/song.dart';

abstract interface class ISongsRepo {
  Future<List<Song>> getSongs();
  Future<List<Song>> readSongs();
  Future<bool> writeSongs(List<Song> songs);
}
