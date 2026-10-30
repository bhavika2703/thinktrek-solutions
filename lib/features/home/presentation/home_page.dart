import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/responsive/app_breakpoints.dart';
import '../../../core/responsive/responsive_builder.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/app_section_container.dart';
import '../../../core/widgets/cms_scope.dart';
import '../../../core/widgets/icon_from_key.dart';
import '../../cms/domain/models/site_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CmsScope(
      builder: (context, content) {
        return AppScaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _HeroSection(content: content),
              _StatsStrip(stats: content.home.stats),
              _ServicesPreview(content: content),
              _CareBand(cta: content.home.cta),
            ],
          ),
        );
      },
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.content});

  final SiteContent content;

  @override
  Widget build(BuildContext context) {
    final home = content.home;

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE8FBFF), AppColors.mist, Color(0xFFE9FBEF)],
        ),
      ),
      child: AppSectionContainer(
        child: ResponsiveBuilder(
          builder: (context, windowSize) {
            final textTheme = Theme.of(context).textTheme;
            final compact = windowSize == AppWindowSize.compact;
            final headingStyle = compact
                ? textTheme.displayMedium
                : textTheme.displayLarge;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(
                    home.intro.eyebrow,
                    style: textTheme.labelMedium,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(home.intro.title, style: headingStyle),
                const SizedBox(height: AppSpacing.md),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 640),
                  child: Text(
                    content.brand.tagline,
                    style: textTheme.headlineSmall?.copyWith(
                      color: AppColors.brandCyanDeep,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 640),
                  child: Text(home.intro.body, style: textTheme.bodyLarge),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  '${content.founder.name} · ${content.founder.title} · ${content.brand.location}',
                  style: textTheme.bodySmall,
                ),
                const SizedBox(height: AppSpacing.xl),
                Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.sm,
                  children: [
                    AppButton(
                      label: home.primaryCtaLabel,
                      onPressed: () => context.go(AppRoutes.contact),
                    ),
                    AppButton(
                      label: home.secondaryCtaLabel,
                      variant: AppButtonVariant.secondary,
                      onPressed: () => context.go(AppRoutes.services),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _StatsStrip extends StatelessWidget {
  const _StatsStrip({required this.stats});

  final List<StatItem> stats;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final compact = AppBreakpoints.isCompact(context);

    return ColoredBox(
      color: AppColors.white,
      child: AppSectionContainer(
        verticalPadding: AppSpacing.xxl,
        child: Builder(
          builder: (context) {
            final items = [
              for (final stat in stats)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stat.value,
                      style: textTheme.displayMedium?.copyWith(
                        color: AppColors.brandCyan,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(stat.label, style: textTheme.titleMedium),
                  ],
                ),
            ];
            if (compact) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < items.length; i++) ...[
                    if (i > 0) const SizedBox(height: AppSpacing.lg),
                    items[i],
                  ],
                ],
              );
            }
            return Row(
              children: [
                for (var i = 0; i < items.length; i++) ...[
                  if (i > 0) const SizedBox(width: AppSpacing.xl),
                  Expanded(child: items[i]),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ServicesPreview extends StatelessWidget {
  const _ServicesPreview({required this.content});

  final SiteContent content;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final highlight = content.services.highlighted.isNotEmpty
        ? content.services.highlighted.first
        : content.services.items.first;
    final rest = content.services.items
        .where((item) => item.id != highlight.id)
        .take(3)
        .toList();

    return AppSectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SERVICES', style: textTheme.labelMedium),
          const SizedBox(height: AppSpacing.md),
          Text(content.home.featuredHeading, style: textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.sm),
          Text(content.home.featuredBody, style: textTheme.bodyLarge),
          const SizedBox(height: AppSpacing.xl),
          _HighlightCard(item: highlight),
          const SizedBox(height: AppSpacing.xl),
          ResponsiveBuilder(
            builder: (context, windowSize) {
              final horizontal = windowSize == AppWindowSize.expanded;
              final cards = [
                for (final item in rest) _ServiceCard(item: item),
              ];
              if (!horizontal) {
                return Column(
                  children: [
                    for (var i = 0; i < cards.length; i++) ...[
                      if (i > 0) const SizedBox(height: AppSpacing.lg),
                      cards[i],
                    ],
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < cards.length; i++) ...[
                    if (i > 0) const SizedBox(width: AppSpacing.lg),
                    Expanded(child: cards[i]),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  const _HighlightCard({required this.item});

  final ServiceItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: AppColors.ink,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: () => context.go(AppRoutes.services),
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HIGHLIGHTED SERVICE',
                style: textTheme.labelMedium?.copyWith(
                  color: AppColors.brandGreen,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                item.title,
                style: textTheme.headlineSmall?.copyWith(color: AppColors.white),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                item.summary,
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.white.withValues(alpha: 0.88),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Read the full service list →',
                style: textTheme.labelLarge?.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.item});

  final ServiceItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: AppColors.border),
      ),
      child: InkWell(
        onTap: () => context.go(AppRoutes.services),
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.ice,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  iconFromKey(item.iconKey),
                  color: AppColors.brandCyanDeep,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(item.title, style: textTheme.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              Text(item.summary, style: textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _CareBand extends StatelessWidget {
  const _CareBand({required this.cta});

  final CtaContent cta;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppSectionContainer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.brandCyan, Color(0xFF1ED760)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cta.title,
                style: textTheme.headlineMedium?.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: Text(
                  cta.body,
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.white.withValues(alpha: 0.92),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              FilledButton(
                onPressed: () => context.go(cta.buttonPath),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.brandCyanDeep,
                ),
                child: Text(cta.buttonLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
