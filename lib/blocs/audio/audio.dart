export 'package:challenge/blocs/audio/events.dart';
export 'package:challenge/blocs/audio/states.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:challenge/blocs/audio/events.dart';
import 'package:challenge/blocs/audio/states.dart';
import 'package:challenge/models/song.dart';
import 'package:pedantic/pedantic.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  AudioBloc() : super(AudioUninitialized());

  SongModel _currentSong;
  SongModel get currentSong => _currentSong;

  @override
  Future<void> close() async {
    await audioPlayer.release();
    await super.close();
  }

  final _audioPlayer = AudioPlayer();
  AudioPlayer get audioPlayer => _audioPlayer;

  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  @override
  Stream<AudioState> mapEventToState(AudioEvent event) async* {
    if (event is AudioSelectEvent) yield* _set(event);
    if (event is AudioPlayOrPauseEvent) yield* _playOrPause();
    if (event is AudioSeekEvent) yield* _seek(event);
  }

  Stream<AudioState> _set(AudioSelectEvent event) async* {
    _currentSong = event.song;
    await _audioPlayer.setUrl(event.song.fileUrl);
    yield* _playOrPause();
  }

  Stream<AudioState> _seek(AudioSeekEvent event) async* {
    await _audioPlayer.seek(event.position);
    yield* _refresh();
  }

  Stream<AudioState> _playOrPause() async* {
    if (_currentSong != null) {
      _isPlaying = !_isPlaying;
      await _audioPlayer.play(_currentSong.coverUrl);
      yield* _refresh();
    }
  }

  Stream<AudioState> _refresh() async* {
    if (_currentSong != null) {
      yield AudioStreamState(
        playing: _isPlaying,
        song: _currentSong,
      );
    } else {
      yield AudioUninitialized();
    }
  }
}

// // Initial playback. Preloaded playback information
// AudioManager.instance
// 	.start(
// 		"assets/audio.mp3",
// 		// "network format resource"
// 		// "local resource (file://${file.path})"
// 		"title",
// 		desc: "desc",
// 		// cover: "network cover image resource"
// 		cover: "assets/ic_launcher.png")
// 	.then((err) {
// 	print(err);
// });

// // Play or pause; that is, pause if currently playing, otherwise play
// AudioManager.instance.playOrPause()
