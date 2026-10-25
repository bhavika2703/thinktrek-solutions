import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

/// Material 3 light theme mapped onto the ThinkTrek brand palette.
///
/// Navy is structural (app bar, headings). Turquoise is interactive
/// (buttons, links, focus). Green is reserved for small active/accent marks.
abstract final class AppTheme {
  static const BorderRadius _controlRadius = BorderRadius.all(
    Radius.circular(2),
  );

  static ThemeData get light {
    const colorScheme = ColorScheme.light(
      primary: AppColors.primaryAction,
      onPrimary: AppColors.onPrimaryAction,
      secondary: AppColors.structural,
      onSecondary: AppColors.onStructural,
      tertiary: AppColors.accent,
      onTertiary: AppColors.white,
      surface: AppColors.background,
      onSurface: AppColors.bodyText,
      error: AppColors.error,
      onError: AppColors.onError,
      outline: AppColors.border,
      outlineVariant: AppColors.divider,
    );

    final textTheme = AppTextStyles.textTheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.background,
      dividerColor: AppColors.divider,
      focusColor: AppColors.focus.withValues(alpha: 0.12),
      hoverColor: AppColors.structural.withValues(alpha: 0.04),
      splashColor: AppColors.primaryAction.withValues(alpha: 0.08),
      visualDensity: VisualDensity.standard,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.structural,
        foregroundColor: AppColors.onStructural,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: AppColors.onStructural,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primaryAction,
          foregroundColor: AppColors.onPrimaryAction,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: AppSpacing.buttonPadding,
          shape: const RoundedRectangleBorder(borderRadius: _controlRadius),
          textStyle: textTheme.labelLarge?.copyWith(
            color: AppColors.onPrimaryAction,
            letterSpacing: 0.6,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.structural,
          padding: AppSpacing.buttonPadding,
          side: const BorderSide(color: AppColors.structural, width: 1),
          shape: const RoundedRectangleBorder(borderRadius: _controlRadius),
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.link,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          textStyle: textTheme.labelLarge?.copyWith(color: AppColors.link),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        isDense: false,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.bodyText.withValues(alpha: 0.72),
        ),
        labelStyle: textTheme.bodyMedium,
        enabledBorder: const OutlineInputBorder(
          borderRadius: _controlRadius,
          borderSide: BorderSide(color: AppColors.border, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: _controlRadius,
          borderSide: BorderSide(color: AppColors.focus, width: 1.5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: _controlRadius,
          borderSide: BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: _controlRadius,
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),
    );
  }
}
