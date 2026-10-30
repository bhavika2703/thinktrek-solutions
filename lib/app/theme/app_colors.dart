import 'package:flutter/material.dart';

/// Brand palette sampled from [assets/logo.png].
///
/// Cyan is the wordmark. Lime green is the trail mark. Surfaces stay light
/// so the logo can sit on the same white field it was designed for.
abstract final class AppColors {
  static const Color brandCyan = Color(0xFF00A8D0);
  static const Color brandCyanBright = Color(0xFF02ABE4);
  static const Color brandCyanDeep = Color(0xFF007CA6);
  static const Color brandGreen = Color(0xFF30E060);
  static const Color brandGreenDeep = Color(0xFF008818);
  static const Color ink = Color(0xFF0B3A4A);
  static const Color slate = Color(0xFF3A5560);
  static const Color mist = Color(0xFFF3FBFD);
  static const Color ice = Color(0xFFE6F7FB);
  static const Color white = Color(0xFFFFFFFF);

  static const Color primaryAction = brandCyanDeep;
  static const Color onPrimaryAction = white;
  static const Color link = brandCyanDeep;
  static const Color focus = brandCyan;
  static const Color highlight = brandCyan;

  static const Color structural = white;
  static const Color heading = ink;
  static const Color onStructural = ink;

  static const Color bodyText = slate;

  static const Color background = mist;
  static const Color surface = white;

  static const Color border = Color(0xFFC9E8F0);
  static const Color divider = Color(0xFFD7EEF4);

  static const Color accent = brandGreen;
  static const Color activeIndicator = brandGreenDeep;

  static const Color error = Color(0xFF9B2C2C);
  static const Color onError = white;
}
