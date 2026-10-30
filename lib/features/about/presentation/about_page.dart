import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/app_section_container.dart';
import '../../../core/widgets/cms_scope.dart';
import '../../cms/domain/models/site_content.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CmsScope(
      builder: (context, content) {
        final textTheme = Theme.of(context).textTheme;
        final about = content.about;
        final founder = content.founder;

        return AppScaffold(
          body: AppSectionContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(about.intro.eyebrow, style: textTheme.labelMedium),
                const SizedBox(height: AppSpacing.md),
                Text(about.intro.title, style: textTheme.displayMedium),
                const SizedBox(height: AppSpacing.lg),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Text(about.intro.body, style: textTheme.bodyLarge),
                ),
                const SizedBox(height: AppSpacing.xxl),
                _FounderCard(founder: founder, location: content.brand.location),
                const SizedBox(height: AppSpacing.xxl),
                Wrap(
                  spacing: AppSpacing.lg,
                  runSpacing: AppSpacing.lg,
                  children: [
                    for (final value in about.values) _ValueCard(value: value),
                  ],
                ),
                const SizedBox(height: AppSpacing.xxl),
                Text('Education', style: textTheme.headlineSmall),
                const SizedBox(height: AppSpacing.md),
                for (final item in founder.education) ...[
                  Text('• $item', style: textTheme.bodyLarge),
                  const SizedBox(height: AppSpacing.sm),
                ],
                const SizedBox(height: AppSpacing.xl),
                Text('Experience', style: textTheme.headlineSmall),
                const SizedBox(height: AppSpacing.lg),
                for (final item in founder.experience) ...[
                  _ExperienceRow(item: item),
                  const SizedBox(height: AppSpacing.lg),
                ],
                Text('Community', style: textTheme.headlineSmall),
                const SizedBox(height: AppSpacing.md),
                Text(founder.volunteer, style: textTheme.bodyLarge),
                const SizedBox(height: AppSpacing.xxl),
                AppButton(
                  label: 'Work with us',
                  onPressed: () => context.go(AppRoutes.contact),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FounderCard extends StatelessWidget {
  const _FounderCard({required this.founder, required this.location});

  final FounderContent founder;
  final String location;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(founder.name, style: textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.xs),
            Text(
              '${founder.title} · $location',
              style: textTheme.titleMedium?.copyWith(
                color: AppColors.brandCyanDeep,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(founder.summary, style: textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  const _ValueCard({required this.value});

  final AboutValue value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 320, minWidth: 240),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.border),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppColors.brandGreen,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(value.title, style: textTheme.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              Text(value.body, style: textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceRow extends StatelessWidget {
  const _ExperienceRow({required this.item});

  final ExperienceItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.role, style: textTheme.titleLarge),
            const SizedBox(height: AppSpacing.xs),
            Text(
              item.period,
              style: textTheme.labelLarge?.copyWith(
                color: AppColors.brandCyanDeep,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(item.detail, style: textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
