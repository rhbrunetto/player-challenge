import 'package:challenge/models/artist.dart';
import 'package:challenge/resources/constraints.dart';
import 'package:challenge/resources/palette.dart';
import 'package:challenge/widgets/artist/section.dart';
import 'package:challenge/widgets/music/album.dart';
import 'package:challenge/widgets/music/song.dart';
import 'package:flutter/material.dart';
import 'package:challenge/resources/extensions.dart';

class ArtistPanelWidget extends StatelessWidget {
  final ArtistModel artist;
  final double height;

  ArtistPanelWidget({
    @required this.artist,
    @required this.height,
  });

  Widget get _header => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _TitledInfo(
            title: 'Songs',
            subtitle: artist.songsCount?.toString(),
          ),
          _TitledInfo(
            title: 'Followers',
            subtitle: artist.followers,
          ),
          _TitledInfo(
            title: 'Following',
            subtitle: artist.following?.toString(),
          ),
        ],
      );

  Widget get _populars => ArtistSectionWidget(
        title: 'Popular',
        content: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                artist.popularSongs.map((song) => SongWidget(song)).toList(),
          ),
        ),
      );

  Widget get _albums => ArtistSectionWidget(
        title: 'Albums',
        content: Column(
          children: artist.albums.map((album) => AlbumWidget(album)).toList(),
        ),
      );

  @override
  Widget build(BuildContext context) => Container(
        width: context.absoluteWidth,
        height: height,
        padding: const EdgeInsets.symmetric(
          vertical: Constraints.paddingExtraLarge,
          horizontal: Constraints.paddingNormal,
        ),
        decoration: ShapeDecoration(
          color: Palette.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Constraints.borderRadiusLarge),
            ),
          ),
        ),
        child: Column(
          children: [
            _header,
            const SizedBox(height: Constraints.spacerLarge),
            Expanded(
              child: ListView(
                children: [
                  _populars,
                  const SizedBox(height: Constraints.spacerLarge),
                  _albums,
                ],
              ),
            ),
          ],
        ),
      );
}

class _TitledInfo extends StatelessWidget {
  final String title;
  final String subtitle;

  const _TitledInfo({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            title,
            style: context.textTheme.bodyText1,
          ),
          const SizedBox(height: Constraints.spacerNormal),
          Text(
            subtitle,
            style: context.textTheme.headline3,
          ),
        ],
      );
}
