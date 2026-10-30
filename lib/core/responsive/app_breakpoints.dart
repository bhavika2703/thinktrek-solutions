import 'package:flutter/material.dart';

/// Viewport bands for the marketing site.
///
/// Compact: phones and narrow browsers (< 600).
/// Medium: tablets and small laptops (600–1023).
/// Expanded: desktop (>= 1024).
enum AppWindowSize { compact, medium, expanded }

abstract final class AppBreakpoints {
  static const double compactMax = 600;
  static const double mediumMax = 1024;

  static AppWindowSize fromWidth(double width) {
    if (width < compactMax) {
      return AppWindowSize.compact;
    }
    if (width < mediumMax) {
      return AppWindowSize.medium;
    }
    return AppWindowSize.expanded;
  }

  static AppWindowSize of(BuildContext context) {
    return fromWidth(MediaQuery.sizeOf(context).width);
  }

  static bool isCompact(BuildContext context) =>
      of(context) == AppWindowSize.compact;

  static bool isMedium(BuildContext context) =>
      of(context) == AppWindowSize.medium;

  static bool isExpanded(BuildContext context) =>
      of(context) == AppWindowSize.expanded;
}
