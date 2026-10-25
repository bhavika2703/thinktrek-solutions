import 'package:flutter/material.dart';

enum AppButtonVariant { primary, secondary, text }

/// Shared action control. Styling comes from [ThemeData], not local colors.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final child = Text(label);

    return switch (variant) {
      AppButtonVariant.primary => FilledButton(
        onPressed: onPressed,
        child: child,
      ),
      AppButtonVariant.secondary => OutlinedButton(
        onPressed: onPressed,
        child: child,
      ),
      AppButtonVariant.text => TextButton(onPressed: onPressed, child: child),
    };
  }
}
