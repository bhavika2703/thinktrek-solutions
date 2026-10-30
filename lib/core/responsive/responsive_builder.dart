import 'package:flutter/material.dart';

import 'app_breakpoints.dart';

typedef ResponsiveWidgetBuilder =
    Widget Function(BuildContext context, AppWindowSize windowSize);

/// Rebuilds when the parent constraints cross a breakpoint.
///
/// Prefer this inside sections. For page-level decisions that should follow
/// the full viewport (not a nested pane), use [AppBreakpoints.of].
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({super.key, required this.builder});

  final ResponsiveWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        return builder(context, AppBreakpoints.fromWidth(width));
      },
    );
  }
}
