import 'package:flutter/material.dart';

/// Brand palette and semantic colors.
///
/// Widgets should use semantic names (primaryAction, heading, border, …)
/// rather than raw brand values so the visual language stays consistent.
abstract final class AppColors {
  static const Color brandTurquoise = Color(0xFF079FC0);
  static const Color brandGreen = Color(0xFF168B36);
  static const Color deepNavy = Color(0xFF1C3154);
  static const Color warmOffWhite = Color(0xFFF8F7F3);
  static const Color charcoal = Color(0xFF333B46);
  static const Color dividerGrey = Color(0xFFDADDD8);
  static const Color white = Color(0xFFFFFFFF);

  // Semantic roles
  static const Color primaryAction = brandTurquoise;
  static const Color onPrimaryAction = white;
  static const Color link = brandTurquoise;
  static const Color focus = brandTurquoise;
  static const Color highlight = brandTurquoise;

  static const Color structural = deepNavy;
  static const Color heading = deepNavy;
  static const Color onStructural = white;

  static const Color bodyText = charcoal;

  static const Color background = warmOffWhite;
  static const Color surface = white;

  static const Color border = dividerGrey;
  static const Color divider = dividerGrey;

  static const Color accent = brandGreen;
  static const Color activeIndicator = brandGreen;

  /// Material requires an error token; this is not a brand/decorative color.
  static const Color error = Color(0xFF9B2C2C);
  static const Color onError = white;
}
