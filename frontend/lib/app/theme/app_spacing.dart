import 'package:flutter/material.dart';

import '../../core/responsive/app_breakpoints.dart';

/// Shared spacing, padding and layout constraints.
abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double section = 80;

  /// Editorial pages read better with a bounded measure, not full-bleed text.
  static const double maxContentWidth = 1120;

  static const double pagePaddingCompact = 20;
  static const double pagePaddingMedium = 32;
  static const double pagePaddingExpanded = 48;

  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 16,
  );

  static double pagePaddingFor(AppWindowSize size) {
    return switch (size) {
      AppWindowSize.compact => pagePaddingCompact,
      AppWindowSize.medium => pagePaddingMedium,
      AppWindowSize.expanded => pagePaddingExpanded,
    };
  }
}
