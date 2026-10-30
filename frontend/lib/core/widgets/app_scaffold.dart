import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../features/cms/domain/models/site_content.dart';
import '../constants/app_constants.dart';
import '../responsive/app_breakpoints.dart';
import 'app_button.dart';
import 'cms_image.dart';
import 'cms_scope.dart';
import 'site_footer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return CmsScope(
      builder: (context, content) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            children: [
              _SiteHeader(content: content),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: body),
                    SliverToBoxAdapter(child: SiteFooter(content: content)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SiteHeader extends StatelessWidget {
  const _SiteHeader({required this.content});

  final SiteContent content;

  @override
  Widget build(BuildContext context) {
    final useMenu = !AppBreakpoints.isExpanded(context);
    final horizontal = AppSpacing.pagePaddingFor(AppBreakpoints.of(context));

    return Material(
      color: AppColors.white.withValues(alpha: 0.92),
      elevation: 0,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.divider)),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: AppSpacing.md,
        ),
        child: Row(
          children: [
            _BrandMark(content: content),
            const Spacer(),
            if (useMenu)
              IconButton(
                tooltip: 'Open menu',
                onPressed: () => _openMenu(context),
                icon: const Icon(Icons.menu_rounded),
                color: AppColors.ink,
              )
            else ...[
              _PrimaryNav(content: content),
              const SizedBox(width: AppSpacing.md),
              AppButton(
                label: 'Let’s talk',
                onPressed: () => context.go(AppRoutes.contact),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _openMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: AppColors.white,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PrimaryNav(content: content, expanded: true),
                const SizedBox(height: AppSpacing.lg),
                AppButton(
                  label: 'Let’s talk',
                  onPressed: () {
                    Navigator.of(sheetContext).pop();
                    context.go(AppRoutes.contact);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark({required this.content});

  final SiteContent content;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(AppRoutes.home),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.ink,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: CmsImage(
        source: content.brand.logoUrl,
        height: 40,
        semanticLabel: content.brand.name,
        fallback: Text(
          content.brand.name,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppColors.ink),
        ),
      ),
    );
  }
}

class _PrimaryNav extends StatelessWidget {
  const _PrimaryNav({required this.content, this.expanded = false});

  final SiteContent content;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      alignment: expanded ? WrapAlignment.start : WrapAlignment.end,
      children: [
        for (final item in content.navItems)
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
      onPressed: () {
        final navigator = Navigator.of(context, rootNavigator: false);
        if (navigator.canPop()) {
          navigator.pop();
        }
        context.go(path);
      },
      style: TextButton.styleFrom(
        foregroundColor: isActive ? AppColors.brandCyanDeep : AppColors.ink,
        backgroundColor: isActive
            ? AppColors.brandCyan.withValues(alpha: 0.12)
            : Colors.transparent,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        shape: const StadiumBorder(),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: isActive ? AppColors.brandCyanDeep : AppColors.ink,
        ),
      ),
    );
  }
}
