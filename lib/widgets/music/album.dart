import 'package:challenge/models/album.dart';
import 'package:challenge/resources/constraints.dart';
import 'package:challenge/resources/palette.dart';
import 'package:challenge/widgets/common/image.dart';
import 'package:challenge/widgets/common/spacer.dart';
import 'package:flutter/material.dart';
import 'package:challenge/resources/extensions.dart';

class AlbumWidget extends StatelessWidget {
  final AlbumModel album;

  AlbumWidget(this.album);

  double get _imageSize => 100;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(
          bottom: Constraints.paddingNormal,
        ),
        // ListTile didn't fit well...
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedImageWidget(
              imageUrl: album.coverUrl,
              size: _imageSize,
              borderRadius: Constraints.borderRadiusNormal,
            ),
            SpacerWidget.large,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  album.name,
                  style: context.textTheme.subtitle1,
                ),
                SpacerWidget.small,
                Text(
                  album.year,
                  style: context.textTheme.subtitle2,
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.more_horiz,
                  color: Palette.yellow,
                ),
              ),
            ),
          ],
        ),
      );
}
