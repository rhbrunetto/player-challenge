import 'package:flutter/material.dart';
import 'package:challenge/resources/constraints.dart';

class SpacerWidget extends StatelessWidget {
  final double dimension;

  const SpacerWidget({
    this.dimension = Constraints.spacerNormal,
  });

  static const SpacerWidget extraSmall = SpacerWidget(
    dimension: Constraints.spacerExtraSmall,
  );
  static const SpacerWidget small = SpacerWidget(
    dimension: Constraints.spacerSmall,
  );
  static const SpacerWidget normal = SpacerWidget(
    dimension: Constraints.spacerNormal,
  );
  static const SpacerWidget large = SpacerWidget(
    dimension: Constraints.spacerLarge,
  );
  static const SpacerWidget extraLarge = SpacerWidget(
    dimension: Constraints.spacerExtraLarge,
  );

  @override
  Widget build(BuildContext context) => SizedBox(
        height: dimension,
        width: dimension,
      );
}
