import 'package:challenge/blocs/audio/audio.dart';
import 'package:challenge/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayButton extends StatefulWidget {
  final double size;

  PlayButton({
    this.size = 68,
  });

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  AudioBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<AudioBloc>(context);
  }

  @override
  Widget build(BuildContext context) => BlocBuilder(
        cubit: bloc,
        builder: (context, state) => InkWell(
          onTap: () {
            bloc.add(AudioPlayOrPauseEvent());
          },
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.size),
              color: Palette.yellow,
            ),
            child: Icon(
              bloc.isPlaying ? Icons.pause : Icons.play_arrow,
              size: widget.size * 0.75,
              color: Colors.black,
            ),
          ),
        ),
      );
}
