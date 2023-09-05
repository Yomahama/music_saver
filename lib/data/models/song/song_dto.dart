class SongDto {
  final int id;
  final String title;
  final String artist;
  final String genre;
  final int durationInSeconds;

  const SongDto({
    required this.id,
    required this.title,
    required this.artist,
    required this.genre,
    required this.durationInSeconds,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'genre': genre,
      'durationInSeconds': durationInSeconds,
    };
  }

  factory SongDto.fromMap(Map<String, dynamic> map) {
    return SongDto(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      artist: map['artist'] ?? '',
      genre: map['genre'] ?? '',
      durationInSeconds: map['durationInSeconds']?.toInt() ?? 0,
    );
  }
}
