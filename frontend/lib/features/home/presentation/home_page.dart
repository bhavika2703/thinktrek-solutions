import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/responsive/app_breakpoints.dart';
import '../../../core/responsive/responsive_builder.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/app_section_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: AppSectionContainer(
          child: ResponsiveBuilder(
            builder: (context, windowSize) {
              final textTheme = Theme.of(context).textTheme;
              final headingStyle = windowSize == AppWindowSize.compact
                  ? textTheme.headlineMedium
                  : textTheme.displayMedium;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Home', style: textTheme.labelMedium),
                  const SizedBox(height: AppSpacing.md),
                  Text(AppConstants.appName, style: headingStyle),
                  const SizedBox(height: AppSpacing.md),
                  Text(AppConstants.appTagline, style: textTheme.bodyLarge),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Temporary homepage for the Flutter web foundation. '
                    'Page layouts will be built from the design system next.',
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  AppButton(
                    label: 'Contact',
                    onPressed: () => context.go(AppRoutes.contact),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
