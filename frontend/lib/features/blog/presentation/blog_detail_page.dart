import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/app_section_container.dart';
import '../../cms/domain/repositories/cms_repository.dart';
import '../../cms/presentation/blog_cubit.dart';

class BlogDetailPage extends StatelessWidget {
  const BlogDetailPage({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BlogCubit(context.read<CmsRepository>())..loadPost(slug),
      child: const AppScaffold(body: _BlogDetailBody()),
    );
  }
}

class _BlogDetailBody extends StatelessWidget {
  const _BlogDetailBody();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppSectionContainer(
      child: BlocBuilder<BlogCubit, BlogState>(
        builder: (context, state) {
          return switch (state) {
            BlogLoading() => const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.xxl),
              child: Center(child: CircularProgressIndicator()),
            ),
            BlogError(:final message) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message, style: textTheme.bodyLarge),
                const SizedBox(height: AppSpacing.xl),
                AppButton(
                  label: 'Back to blog',
                  onPressed: () => context.go(AppRoutes.blog),
                ),
              ],
            ),
            BlogListLoaded() => const SizedBox.shrink(),
            BlogPostLoaded(:final post) => ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () => context.go(AppRoutes.blog),
                    child: const Text('← All articles'),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text('BLOG', style: textTheme.labelMedium),
                  const SizedBox(height: AppSpacing.md),
                  Text(post.title, style: textTheme.displayMedium),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    '${post.publishedAt.day} ${_month(post.publishedAt.month)} ${post.publishedAt.year} · ${post.author}',
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  for (final paragraph in post.body.split('\n\n')) ...[
                    Text(paragraph, style: textTheme.bodyLarge),
                    const SizedBox(height: AppSpacing.lg),
                  ],
                ],
              ),
            ),
          };
        },
      ),
    );
  }
}

String _month(int month) {
  const names = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return names[month - 1];
}
