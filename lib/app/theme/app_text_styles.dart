import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Clean, tight marketing type on the default sans family.
abstract final class AppTextStyles {
  static const String? fontFamily = null;

  static TextTheme textTheme({
    Color heading = AppColors.heading,
    Color body = AppColors.bodyText,
  }) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 64,
        fontWeight: FontWeight.w700,
        height: 1.05,
        letterSpacing: -1.6,
        color: heading,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 48,
        fontWeight: FontWeight.w700,
        height: 1.08,
        letterSpacing: -1.2,
        color: heading,
      ),
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 36,
        fontWeight: FontWeight.w600,
        height: 1.15,
        letterSpacing: -0.6,
        color: heading,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: -0.3,
        color: heading,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: heading,
      ),
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.35,
        color: heading,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: heading,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.65,
        color: body,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: body,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.bodyText.withValues(alpha: 0.78),
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: 0.1,
        color: heading,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: 0.8,
        color: AppColors.brandCyanDeep,
      ),
    );
  }
}
