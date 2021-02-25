import 'package:challenge/models/song.dart';
import 'package:challenge/resources/constraints.dart';
import 'package:challenge/resources/palette.dart';
import 'package:challenge/widgets/common/image.dart';
import 'package:challenge/widgets/common/spacer.dart';
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
                RoundedImageWidget(
                  imageUrl: song.coverUrl,
                  borderRadius: Constraints.borderRadiusNormal,
                  size: _imageSize,
                ),
                SpacerWidget.normal,
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
