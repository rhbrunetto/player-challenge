import 'package:challenge/screens/artist/artist.dart';
import 'package:flutter/material.dart';
import 'package:challenge/blocs/artist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistListScreen extends StatefulWidget {
  @override
  _ArtistListScreenState createState() => _ArtistListScreenState();
}

class _ArtistListScreenState extends State<ArtistListScreen> {
  ArtistBloc artistBloc;

  @override
  void initState() {
    super.initState();
    artistBloc = BlocProvider.of<ArtistBloc>(context)
      ..add(
        ArtistLoadEvent(),
      );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('CookieJar Challenge'),
        ),
        body: BlocBuilder(
          cubit: artistBloc,
          builder: (context, state) {
            if (state is ArtistFailState) {
              return Text(state.error?.message);
            }

            if (state is! ArtistSuccessState) return Container();

            final artists = (state as ArtistSuccessState).artists;
            return Column(
              children: artists
                  .map(
                    (artist) => InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ArtistScreen(artist),
                        ),
                      ),
                      child: Text(artist.name),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      );
}
