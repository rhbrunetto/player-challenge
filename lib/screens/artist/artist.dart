import 'package:challenge/models/artist.dart';
import 'package:challenge/resources/constraints.dart';
import 'package:challenge/widgets/artist/panel.dart';
import 'package:challenge/widgets/artist/topbar.dart';
import 'package:challenge/widgets/music/play.dart';
import 'package:flutter/material.dart';
import 'package:challenge/resources/extensions.dart';

class ArtistScreen extends StatelessWidget {
  final ArtistModel artist;

  ArtistScreen(this.artist);

  final _panelHeightFactor = 0.65;
  final _iconSize = 68.0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ArtistTopBar(artist),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ArtistPanelWidget(
                artist: artist,
                height: context.absoluteHeight * _panelHeightFactor,
              ),
            ),
            Positioned(
              right: Constraints.borderRadiusLarge,
              top: (context.absoluteHeight * (1 - _panelHeightFactor)) -
                  _iconSize / 2.0,
              child: PlayButton(size: _iconSize),
            ),
            Positioned(
              left: Constraints.paddingNormal,
              top: (context.absoluteHeight * (1 - _panelHeightFactor)) -
                  3 * Constraints.paddingLarge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Artist'.toUpperCase(),
                    style: context.textTheme.headline2,
                  ),
                  Text(
                    artist.name,
                    style: context.textTheme.headline1,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
