import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/models/artist.dart';
import 'package:challenge/resources/constraints.dart';
import 'package:challenge/resources/palette.dart';
import 'package:flutter/material.dart';

class ArtistTopBar extends StatelessWidget {
  final ArtistModel artist;

  ArtistTopBar(this.artist);

  Widget _buildIcon(IconData icon, VoidCallback onTap) => InkWell(
        onTap: onTap,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Constraints.borderRadiusSmall,
            ),
            color: Palette.grey.withOpacity(0.6),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          CachedNetworkImage(
            fit: BoxFit.fitWidth,
            imageUrl: artist.coverUrl,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constraints.paddingLarge,
                horizontal: Constraints.paddingNormal,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIcon(Icons.arrow_back_ios_sharp, () => null),
                  _buildIcon(Icons.more_horiz, () => null),
                ],
              ),
            ),
          )
        ],
      );
}
