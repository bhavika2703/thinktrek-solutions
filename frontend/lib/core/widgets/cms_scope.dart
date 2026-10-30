import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/theme/app_colors.dart';
import '../../features/cms/domain/models/site_content.dart';
import '../../features/cms/presentation/cms_cubit.dart';

class CmsScope extends StatelessWidget {
  const CmsScope({super.key, required this.builder});

  final Widget Function(BuildContext context, SiteContent content) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CmsCubit, CmsState>(
      builder: (context, state) {
        return switch (state) {
          CmsLoading() => const _CmsStatus(child: CircularProgressIndicator()),
          CmsError(:final message) => _CmsStatus(child: Text(message)),
          CmsLoaded(:final content) => builder(context, content),
        };
      },
    );
  }
}

class _CmsStatus extends StatelessWidget {
  const _CmsStatus({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background,
      child: Center(child: child),
    );
  }
}
