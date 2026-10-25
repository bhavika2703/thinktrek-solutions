import 'package:flutter/material.dart';

import '../../app/theme/app_spacing.dart';
import '../responsive/app_breakpoints.dart';

/// Centers section content, caps its width, and applies viewport padding.
///
/// Avoids fixed-width pages that overflow on compact browsers.
class AppSectionContainer extends StatelessWidget {
  const AppSectionContainer({
    super.key,
    required this.child,
    this.maxWidth = AppSpacing.maxContentWidth,
    this.padding,
    this.verticalPadding,
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    final windowSize = AppBreakpoints.of(context);
    final horizontal = AppSpacing.pagePaddingFor(windowSize);
    final vertical = verticalPadding ?? AppSpacing.section;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding:
              padding ??
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: child,
        ),
      ),
    );
  }
}
