import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/models/song.dart';
import 'package:challenge/resources/constraints.dart';
import 'package:challenge/resources/palette.dart';
import 'package:flutter/material.dart';
import 'package:challenge/resources/extensions.dart';

class SongWidget extends StatelessWidget {
  final SongModel song;

  SongWidget(this.song);

  double get _imageSize => 150;
  double get _iconSize => 40;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: Constraints.paddingLarge),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: song.coverUrl,
                  imageBuilder: (context, provider) => Container(
                    height: _imageSize,
                    width: _imageSize,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:
                          BorderRadius.circular(Constraints.borderRadiusNormal),
                      image: DecorationImage(
                        image: provider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Constraints.paddingNormal),
                Text(
                  song.name,
                  style: context.textTheme.subtitle1,
                ),
              ],
            ),
            Positioned(
              top: _imageSize - (_iconSize / 2.0),
              right: Constraints.paddingNormal,
              child: Container(
                height: _iconSize,
                width: _iconSize,
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: Palette.darkGrey,
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: _iconSize * 0.75,
                ),
              ),
            ),
          ],
        ),
      );
}
