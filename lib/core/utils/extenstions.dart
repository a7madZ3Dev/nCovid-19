import 'package:flutter/material.dart';

/// Extensions
extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  Orientation get orientation => MediaQuery.of(this).orientation;
  bool get portrait => MediaQuery.of(this).orientation == Orientation.portrait;
  bool get landscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
}

extension StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}
