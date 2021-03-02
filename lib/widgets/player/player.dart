import 'package:challenge/blocs/audio/audio.dart';
import 'package:challenge/widgets/music/play.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerWidget extends StatefulWidget {
  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  AudioBloc bloc;
  double sliderPosition;

  @override
  void initState() {
    super.initState();
    sliderPosition = 0;
    bloc = BlocProvider.of<AudioBloc>(context);
  }

  Widget get _progress => BlocBuilder(
        cubit: bloc,
        builder: (context, state) => state is! AudioStreamState
            ? Container()
            : Row(
                children: <Widget>[
                  Text(
                      // _formatDuration(audioManagerInstance.position),
                      // audioManagerInstance.position.toString(),
                      'banana'
                      // style: style,
                      ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 2,
                          thumbColor: Colors.blueAccent,
                          overlayColor: Colors.blue,
                          thumbShape: RoundSliderThumbShape(
                            disabledThumbRadius: 5,
                            enabledThumbRadius: 5,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 10,
                          ),
                          activeTrackColor: Colors.blueAccent,
                          inactiveTrackColor: Colors.grey,
                        ),
                        child: Slider(
                          value: sliderPosition,
                          max: 100.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              sliderPosition = value;
                            });
                          },
                          onChangeEnd: (value) {
                            // if (state.manager?.duration != null) {
                            //   final msec = Duration(
                            //     milliseconds:
                            //         (state.manager.duration.inMilliseconds *
                            //                 value)
                            //             .round(),
                            //   );
                            //   bloc.add(AudioSeekEvent(msec));
                            // }
                          },
                        ),
                      ),
                    ),
                  ),
                  Text(
                      // _formatDuration(audioManagerInstance.duration),
                      'banana2'
                      // style: style,
                      ),
                ],
              ),
      );

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: _progress,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                    ),
                    onPressed: () => null,
                  ),
                ),
                backgroundColor: Colors.cyan.withOpacity(0.3),
              ),
              PlayButton(size: 30),
              CircleAvatar(
                backgroundColor: Colors.cyan.withOpacity(0.3),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.white,
                    ),
                    onPressed: () => null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]);
}
