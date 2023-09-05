import 'package:equatable/equatable.dart';
import 'package:music_saver/domain/models/song.dart';

class SongsCategory extends Equatable {
  final String title;
  final List<Song> songs;

  const SongsCategory({required this.title, required this.songs});

  @override
  List<Object> get props => [title, songs];
}
