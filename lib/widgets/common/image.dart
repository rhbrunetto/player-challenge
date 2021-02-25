import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;
  final double size;

  RoundedImageWidget({
    @required this.imageUrl,
    @required this.borderRadius,
    this.size,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => CachedNetworkImage(
          imageUrl: imageUrl,
          height: size ?? constraints.biggest.width,
          width: size ?? constraints.biggest.width,
          imageBuilder: (context, provider) => Container(
            decoration: BoxDecoration(
              border: Border.all(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                image: provider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
}
