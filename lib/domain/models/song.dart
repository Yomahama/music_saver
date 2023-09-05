import 'package:equatable/equatable.dart';
import 'package:music_saver/extensions/double_extensions.dart';

class Song extends Equatable {
  final int id;
  final String title;
  final String artist;
  final String genre;
  final Duration duration;

  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.genre,
    required this.duration,
  });

  String get coverUrl => 'https://picsum.photos/id/$id/600/500';

  double getSize() {
    // Let's say 1 minute of song is equal to 2MB
    const mbPerMinute = 2;

    return (duration.inSeconds / 60) * mbPerMinute;
  }

  String get formattedSize => '${getSize().toStringAsNum()}MB';

  @override
  List<Object> get props {
    return [id, title, artist, genre, duration];
  }
}
