import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/app_section_container.dart';
import '../../cms/domain/models/site_content.dart';
import '../../cms/domain/repositories/cms_repository.dart';
import '../../cms/presentation/blog_cubit.dart';

class BlogListPage extends StatelessWidget {
  const BlogListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BlogCubit(context.read<CmsRepository>())..loadPosts(),
      child: const AppScaffold(body: _BlogListBody()),
    );
  }
}

class _BlogListBody extends StatelessWidget {
  const _BlogListBody();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppSectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('BLOG', style: textTheme.labelMedium),
          const SizedBox(height: AppSpacing.md),
          Text('Notes from the practice.', style: textTheme.displayMedium),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Articles an admin can replace, edit, or add through the same '
            'content store as the rest of the site.',
            style: textTheme.bodyLarge,
          ),
          const SizedBox(height: AppSpacing.xxl),
          BlocBuilder<BlogCubit, BlogState>(
            builder: (context, state) {
              return switch (state) {
                BlogLoading() => const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.xxl),
                  child: Center(child: CircularProgressIndicator()),
                ),
                BlogError(:final message) => Text(message),
                BlogPostLoaded(:final post) => _PostCard(post: post),
                BlogListLoaded(:final posts) => Column(
                  children: [
                    for (var i = 0; i < posts.length; i++) ...[
                      if (i > 0) const SizedBox(height: AppSpacing.lg),
                      _PostCard(post: posts[i]),
                    ],
                  ],
                ),
              };
            },
          ),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({required this.post});

  final BlogPost post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final date =
        '${post.publishedAt.day} ${_month(post.publishedAt.month)} ${post.publishedAt.year}';

    return Material(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: AppColors.border),
      ),
      child: InkWell(
        onTap: () => context.go(AppRoutes.blogPost(post.slug)),
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$date · ${post.author}',
                style: textTheme.labelMedium,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(post.title, style: textTheme.headlineSmall),
              const SizedBox(height: AppSpacing.sm),
              Text(post.excerpt, style: textTheme.bodyMedium),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Read article →',
                style: textTheme.labelLarge?.copyWith(
                  color: AppColors.brandCyanDeep,
                ),
              ),
            ],
          ),
        ),
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
