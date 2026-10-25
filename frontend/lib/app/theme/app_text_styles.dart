import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Editorial typography: large, light headings and generous body leading.
///
/// Uses the platform/web default sans family so we do not add font packages
/// until a licensed typeface is chosen.
abstract final class AppTextStyles {
  static const String? fontFamily = null;

  static TextTheme textTheme({
    Color heading = AppColors.heading,
    Color body = AppColors.bodyText,
  }) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 56,
        fontWeight: FontWeight.w300,
        height: 1.12,
        letterSpacing: -0.6,
        color: heading,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 44,
        fontWeight: FontWeight.w300,
        height: 1.15,
        letterSpacing: -0.4,
        color: heading,
      ),
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 36,
        fontWeight: FontWeight.w400,
        height: 1.2,
        letterSpacing: -0.2,
        color: heading,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 1.25,
        color: heading,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        height: 1.3,
        color: heading,
      ),
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1.35,
        letterSpacing: 0.1,
        color: heading,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
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
        color: AppColors.bodyText.withValues(alpha: 0.72),
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.3,
        letterSpacing: 0.4,
        color: heading,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.3,
        letterSpacing: 0.6,
        color: heading,
      ),
    );
  }
}
