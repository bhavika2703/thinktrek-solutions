import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/app_section_container.dart';
import '../../../core/widgets/cms_scope.dart';
import '../../../core/widgets/icon_from_key.dart';
import '../../cms/domain/models/site_content.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CmsScope(
      builder: (context, content) {
        final textTheme = Theme.of(context).textTheme;
        final services = content.services;

        return AppScaffold(
          body: AppSectionContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(services.intro.eyebrow, style: textTheme.labelMedium),
                const SizedBox(height: AppSpacing.md),
                Text(services.intro.title, style: textTheme.displayMedium),
                const SizedBox(height: AppSpacing.lg),
                Text(services.intro.body, style: textTheme.bodyLarge),
                const SizedBox(height: AppSpacing.xxl),
                for (final item in services.items) ...[
                  _ServiceRow(item: item),
                  const SizedBox(height: AppSpacing.lg),
                ],
                const SizedBox(height: AppSpacing.xl),
                Text(services.processHeading, style: textTheme.headlineSmall),
                const SizedBox(height: AppSpacing.lg),
                for (var i = 0; i < services.processSteps.length; i++) ...[
                  _ProcessRow(
                    index: i + 1,
                    step: services.processSteps[i],
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
                const SizedBox(height: AppSpacing.xl),
                Text('Questions', style: textTheme.headlineSmall),
                const SizedBox(height: AppSpacing.lg),
                for (final faq in services.faqs) ...[
                  _FaqRow(faq: faq),
                  const SizedBox(height: AppSpacing.md),
                ],
                const SizedBox(height: AppSpacing.xl),
                AppButton(
                  label: 'Request a conversation',
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

class _ServiceRow extends StatelessWidget {
  const _ServiceRow({required this.item});

  final ServiceItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: item.highlighted ? AppColors.ink : AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: item.highlighted ? AppColors.ink : AppColors.border,
        ),
      ),
      child: InkWell(
        onTap: () => context.go(AppRoutes.contact),
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: item.highlighted
                      ? AppColors.white.withValues(alpha: 0.12)
                      : AppColors.ice,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  iconFromKey(item.iconKey),
                  color: item.highlighted
                      ? AppColors.white
                      : AppColors.brandCyanDeep,
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.highlighted)
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: Text(
                          'HIGHLIGHTED',
                          style: textTheme.labelMedium?.copyWith(
                            color: AppColors.brandGreen,
                          ),
                        ),
                      ),
                    Text(
                      item.title,
                      style: textTheme.titleLarge?.copyWith(
                        color: item.highlighted
                            ? AppColors.white
                            : AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      item.summary,
                      style: textTheme.bodyMedium?.copyWith(
                        color: item.highlighted
                            ? AppColors.white.withValues(alpha: 0.86)
                            : AppColors.bodyText,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      item.body,
                      style: textTheme.bodyMedium?.copyWith(
                        color: item.highlighted
                            ? AppColors.white.withValues(alpha: 0.78)
                            : AppColors.bodyText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProcessRow extends StatelessWidget {
  const _ProcessRow({required this.index, required this.step});

  final int index;
  final ProcessStep step;

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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$index'.padLeft(2, '0'),
              style: textTheme.titleLarge?.copyWith(
                color: AppColors.brandCyan,
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(step.title, style: textTheme.titleLarge),
                  const SizedBox(height: AppSpacing.sm),
                  Text(step.body, style: textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqRow extends StatelessWidget {
  const _FaqRow({required this.faq});

  final FaqItem faq;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          childrenPadding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            0,
            AppSpacing.lg,
            AppSpacing.lg,
          ),
          title: Text(faq.question, style: textTheme.titleMedium),
          children: [Text(faq.answer, style: textTheme.bodyMedium)],
        ),
      ),
    );
  }
}
