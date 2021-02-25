import 'package:challenge/resources/constraints.dart';
import 'package:challenge/resources/palette.dart';
import 'package:challenge/resources/extensions.dart';
import 'package:challenge/widgets/player/player.dart';
import 'package:challenge/widgets/player/header.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  Widget _buildBackground(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: context.absoluteWidth * 0.8,
          height: context.absoluteHeight * 0.4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Palette.yellow, Palette.green],
            ),
          ),
        ),
      );

  Widget _buildHeader(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: Icon(Icons.expand_more),
            onPressed: () => null,
          ),
          Text(
            'Playing now'.toUpperCase(),
            style: context.textTheme.headline2,
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            color: Colors.white,
            icon: Icon(Icons.queue_music),
            onPressed: () => null,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Palette.black,
        body: Stack(
          children: [
            _buildBackground(context),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constraints.paddingLarge,
                vertical: Constraints.paddingLarge,
              ),
              child: Column(
                children: [
                  _buildHeader(context),
                  PlayerHeaderWidget(),
                  PlayerWidget(),
                ],
              ),
            )
          ],
        ),
      );
}
