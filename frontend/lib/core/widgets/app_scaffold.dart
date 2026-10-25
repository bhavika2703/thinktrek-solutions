import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../constants/app_constants.dart';
import '../responsive/app_breakpoints.dart';

/// Temporary site chrome so routes can be exercised before the real layout.
class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _SiteHeader(),
          const Divider(height: 1, thickness: 1),
          Expanded(child: body),
        ],
      ),
    );
  }
}

class _SiteHeader extends StatelessWidget {
  const _SiteHeader();

  @override
  Widget build(BuildContext context) {
    final isCompact = AppBreakpoints.isCompact(context);
    final horizontal = AppSpacing.pagePaddingFor(AppBreakpoints.of(context));

    return Material(
      color: AppColors.structural,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: isCompact ? AppSpacing.md : AppSpacing.lg,
        ),
        child: isCompact
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _BrandMark(),
                  const SizedBox(height: AppSpacing.md),
                  const _PrimaryNav(),
                ],
              )
            : const Row(
                children: [
                  _BrandMark(),
                  SizedBox(width: AppSpacing.lg),
                  Expanded(child: _PrimaryNav()),
                ],
              ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(AppRoutes.home),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.onStructural,
        padding: EdgeInsets.zero,
      ),
      child: Text(
        AppConstants.appName,
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(color: AppColors.onStructural),
      ),
    );
  }
}

class _PrimaryNav extends StatelessWidget {
  const _PrimaryNav();

  static const _items = <({String label, String path})>[
    (label: 'Home', path: AppRoutes.home),
    (label: 'About', path: AppRoutes.about),
    (label: 'Services', path: AppRoutes.services),
    (label: 'Contact', path: AppRoutes.contact),
  ];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      alignment: WrapAlignment.end,
      children: [
        for (final item in _items)
          _NavLink(
            label: item.label,
            path: item.path,
            isActive: _isActive(location, item.path),
          ),
      ],
    );
  }

  static bool _isActive(String location, String path) {
    if (path == AppRoutes.home) {
      return location == AppRoutes.home;
    }
    return location == path || location.startsWith('$path/');
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({
    required this.label,
    required this.path,
    required this.isActive,
  });

  final String label;
  final String path;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(path),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.onStructural,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: AppColors.onStructural),
          ),
          const SizedBox(height: AppSpacing.xs),
          Container(
            height: 2,
            width: 18,
            color: isActive ? AppColors.activeIndicator : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
