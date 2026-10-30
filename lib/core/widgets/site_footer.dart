import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../features/cms/domain/models/site_content.dart';
import '../launch/app_launch.dart';
import '../responsive/app_breakpoints.dart';
import 'app_section_container.dart';
import 'cms_image.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key, required this.content});

  final SiteContent content;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final compact = AppBreakpoints.isCompact(context);
    final brand = content.brand;
    final contact = content.contact;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: AppSectionContainer(
        verticalPadding: AppSpacing.xxl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Builder(
              builder: (context) {
                final brandBlock = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CmsImage(
                      source: brand.logoUrl,
                      height: 36,
                      semanticLabel: brand.name,
                      fallback: Text(brand.name, style: textTheme.titleMedium),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(brand.tagline, style: textTheme.bodyMedium),
                    const SizedBox(height: AppSpacing.sm),
                    Text(brand.location, style: textTheme.bodySmall),
                  ],
                );
                final links = Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.sm,
                  children: [
                    for (final item in content.navItems)
                      _FooterLink(label: item.label, path: item.path),
                  ],
                );
                if (compact) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      brandBlock,
                      const SizedBox(height: AppSpacing.xl),
                      links,
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: brandBlock),
                    const SizedBox(width: AppSpacing.xxl),
                    links,
                  ],
                );
              },
            ),
            const SizedBox(height: AppSpacing.xl),
            Wrap(
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.sm,
              children: [
                TextButton(
                  onPressed: () => launchAppUri(contact.email),
                  child: Text(contact.email),
                ),
                for (final phone in contact.phones)
                  TextButton(
                    onPressed: () => launchAppUri(phone),
                    child: Text(phone),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              '© ${DateTime.now().year} ${brand.name}. ${content.founder.name}, ${content.founder.title}.',
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink({required this.label, required this.path});

  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(path),
      child: Text(label),
    );
  }
}
