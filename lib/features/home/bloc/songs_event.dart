part of 'songs_bloc.dart';

sealed class SongsEvent extends Equatable {
  const SongsEvent();

  @override
  List<Object> get props => [];
}

final class SongsEventGet extends SongsEvent {
  const SongsEventGet();
}
