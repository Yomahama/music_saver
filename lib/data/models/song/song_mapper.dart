import 'package:music_saver/data/models/song/song_dto.dart';
import 'package:music_saver/domain/models/song.dart';

abstract class SongMapper {
  static Song toSong(SongDto dto) {
    return Song(
      id: dto.id,
      title: dto.title,
      artist: dto.artist,
      genre: dto.genre,
      duration: Duration(seconds: dto.durationInSeconds),
    );
  }

  static SongDto toDto(Song song) {
    return SongDto(
      id: song.id,
      title: song.title,
      artist: song.artist,
      genre: song.genre,
      durationInSeconds: song.duration.inSeconds,
    );
  }

  static List<Song> toSongs(List<SongDto> songsDto) {
    return songsDto.map(toSong).toList();
  }

  static List<SongDto> toSongsDto(List<Song> songs) {
    return songs.map(toDto).toList();
  }
}
