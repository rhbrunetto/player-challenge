import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/models/album.dart';
import 'package:challenge/resources/constraints.dart';
import 'package:challenge/resources/palette.dart';
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
            CachedNetworkImage(
              imageUrl: album.coverUrl,
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
            const SizedBox(width: Constraints.spacerLarge),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  album.name,
                  style: context.textTheme.subtitle1,
                ),
                const SizedBox(height: Constraints.spacerSmall),
                Text(
                  album.year ?? '2019',
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
