import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension ContextExtension on BuildContext {
  double get absoluteHeight => MediaQuery.of(this).size.height;
  double get absoluteWidth => MediaQuery.of(this).size.width;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
