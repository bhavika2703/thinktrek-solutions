import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

/// Light theme mapped onto the ThinkTrek logo palette.
///
/// Cyan drives actions and focus. Lime is a small accent. Ink is for type.
abstract final class AppTheme {
  static const BorderRadius _controlRadius = BorderRadius.all(
    Radius.circular(999),
  );

  static ThemeData get light {
    const colorScheme = ColorScheme.light(
      primary: AppColors.primaryAction,
      onPrimary: AppColors.onPrimaryAction,
      secondary: AppColors.ink,
      onSecondary: AppColors.white,
      tertiary: AppColors.accent,
      onTertiary: AppColors.ink,
      surface: AppColors.surface,
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
      hoverColor: AppColors.brandCyan.withValues(alpha: 0.06),
      splashColor: AppColors.brandCyan.withValues(alpha: 0.10),
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
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: AppColors.border),
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
            letterSpacing: 0.2,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.ink,
          padding: AppSpacing.buttonPadding,
          side: const BorderSide(color: AppColors.border, width: 1.5),
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
        filled: true,
        fillColor: AppColors.white,
        isDense: false,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.bodyText.withValues(alpha: 0.62),
        ),
        labelStyle: textTheme.bodyMedium,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.border, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.focus, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),
    );
  }
}
