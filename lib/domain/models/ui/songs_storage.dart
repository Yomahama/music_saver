import 'package:music_saver/domain/models/song.dart';
import 'package:music_saver/domain/models/ui/storage_type_enum.dart';

class SongsStorage {
  final StorageType storageType;
  final List<Song> songs;

  const SongsStorage({required this.storageType, required this.songs});

  Duration getTotalDuration() {
    Duration totalDuration = Duration.zero;

    for (var i = 0; i < songs.length; i++) {
      totalDuration += songs[i].duration;
    }

    return totalDuration;
  }
}
