import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/cms/data/local_cms_repository.dart';
import '../features/cms/domain/repositories/cms_repository.dart';
import '../features/cms/presentation/cms_cubit.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class ThinkTrekApp extends StatelessWidget {
  ThinkTrekApp({
    super.key,
    CmsRepository? cmsRepository,
    GoRouter? router,
  }) : cmsRepository = cmsRepository ?? LocalCmsRepository(),
       router = router ?? createAppRouter();

  final CmsRepository cmsRepository;
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<CmsRepository>.value(
      value: cmsRepository,
      child: BlocProvider(
        create: (context) => CmsCubit(cmsRepository)..load(),
        child: BlocBuilder<CmsCubit, CmsState>(
          builder: (context, state) {
            final title = state is CmsLoaded
                ? state.content.brand.name
                : 'ThinkTrek Solutions';
            return MaterialApp.router(
              title: title,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              themeMode: ThemeMode.light,
              routerConfig: router,
            );
          },
        ),
      ),
    );
  }
}
