import 'package:challenge/blocs/audio/audio.dart';
import 'package:challenge/models/song.dart';
import 'package:challenge/resources/constraints.dart';
import 'package:challenge/resources/extensions.dart';
import 'package:challenge/resources/palette.dart';
import 'package:challenge/widgets/common/image.dart';
import 'package:challenge/widgets/common/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerHeaderWidget extends StatefulWidget {
  @override
  _PlayerHeaderWidgetState createState() => _PlayerHeaderWidgetState();
}

class _PlayerHeaderWidgetState extends State<PlayerHeaderWidget> {
  AudioBloc bloc;
  bool favorite;

  @override
  void initState() {
    super.initState();
    favorite = false;
    bloc = BlocProvider.of<AudioBloc>(context);
    // ..add(
    //   AudioSelectEvent(
    //     song: SongModel(
    //         name: 'Last Dance',
    //         coverUrl:
    //             'https://cdns-images.dzcdn.net/images/cover/c57291ee9dd69ed117d0420bc053727a/350x350.jpg',
    //         artistName: 'Rhye',
    //         fileUrl:
    //             'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3'),
    //   ),
    // );
  }

  // Yeah, a little tricky... But it's just a workaround
  void _toggleFav() => setState(() {
        favorite = !favorite;
      });

  Widget get _title => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            bloc.currentSong.name,
            style: context.textTheme.headline1.copyWith(color: Colors.white),
          ),
          IconButton(
            icon: Icon(
              favorite ? Icons.favorite : Icons.favorite_border_outlined,
              color: Palette.yellow,
            ),
            onPressed: () => _toggleFav(),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) => BlocBuilder(
        cubit: bloc,
        builder: (context, state) {
          final song = bloc.currentSong;

          // For this simple example, no need to handle this case
          if (song == null) return Container();

          return Container(
            padding: EdgeInsets.symmetric(vertical: Constraints.paddingLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoundedImageWidget(
                  imageUrl: song.coverUrl,
                  borderRadius: 60,
                ),
                SpacerWidget.large,
                _title,
                SpacerWidget.extraSmall,
                Text(
                  song.artistName,
                  style: context.textTheme.bodyText1,
                )
              ],
            ),
          );
        },
      );
}
