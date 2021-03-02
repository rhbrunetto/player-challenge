import 'package:challenge/models/song.dart';
import 'package:challenge/resources/response.dart';

abstract class AudioState {}

class AudioUninitialized extends AudioState {}

class AudioStreamState extends AudioState {
  final SongModel song;
  final bool playing;

  AudioStreamState({this.playing, this.song});
}

class AudioFailState extends AudioState {
  final ErrorModel error;

  AudioFailState(this.error);
}
