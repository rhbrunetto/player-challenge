import 'package:bloc/bloc.dart';
import 'package:challenge/models/song.dart';
import 'package:challenge/resources/response.dart';
import 'package:equatable/equatable.dart';

abstract class AudioEvent {}

class AudioSelectEvent extends AudioEvent {
  final SongModel song;

  AudioSelectEvent({this.song});
}

class AudioPauseEvent extends AudioEvent {}

class AudioPlayEvent extends AudioEvent {}

abstract class AudioState with EquatableMixin {}

class AudioUninitialized extends AudioState {
  @override
  List get props => const [];
}

class AudioStreamState extends AudioState {
  final SongModel song;
  final double current;
  final bool playing;

  AudioStreamState({this.current, this.song, this.playing});

  @override
  List get props => [song, current, playing];
}

class AudioFailState extends AudioState {
  final ErrorModel error;

  AudioFailState(this.error);

  @override
  List get props => [error];
}

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  AudioBloc() : super(AudioUninitialized());

  SongModel _currentSong;

  SongModel get currentSong => _currentSong;

  bool get playing =>
      state is AudioStreamState ? (state as AudioStreamState).playing : false;

  @override
  Stream<AudioState> mapEventToState(AudioEvent event) async* {
    if (event is AudioSelectEvent) {
      _currentSong = event.song;
      yield* _play(AudioPlayEvent());
    } else {
      if (event is AudioPlayEvent) yield* _play(event);
      if (event is AudioPauseEvent) yield* _pause(event);
    }
  }

  Stream<AudioState> _play(AudioPlayEvent event) async* {
    if (_currentSong != null) {
      yield AudioStreamState(
        current: 0,
        song: _currentSong,
        playing: true,
      );
    }
  }

  Stream<AudioState> _pause(AudioPauseEvent event) async* {
    if (_currentSong != null) {
      yield AudioStreamState(
        current: 0,
        song: _currentSong,
        playing: false,
      );
    }
  }
}
