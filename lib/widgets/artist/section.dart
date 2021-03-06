import 'package:challenge/widgets/common/spacer.dart';
import 'package:flutter/material.dart';
import 'package:challenge/resources/extensions.dart';

class ArtistSectionWidget extends StatelessWidget {
  final String title;
  final Widget content;

  ArtistSectionWidget({
    @required this.title,
    @required this.content,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme.headline4),
          SpacerWidget.normal,
          content,
        ],
      );
}
