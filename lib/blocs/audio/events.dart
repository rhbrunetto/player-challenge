import 'package:challenge/models/song.dart';
import 'package:equatable/equatable.dart';

abstract class AudioEvent with EquatableMixin {}

class AudioSelectEvent extends AudioEvent {
  final SongModel song;

  AudioSelectEvent({this.song});

  @override
  List get props => [song];
}

class AudioPlayOrPauseEvent extends AudioEvent {
  @override
  List get props => const [];
}

class AudioSeekEvent extends AudioEvent {
  final Duration position;

  AudioSeekEvent(this.position);
  @override
  List get props => [position];
}
