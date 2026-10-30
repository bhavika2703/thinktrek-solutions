import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../features/about/presentation/about_page.dart';
import '../../features/blog/presentation/blog_detail_page.dart';
import '../../features/blog/presentation/blog_list_page.dart';
import '../../features/contact/presentation/contact_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/services/presentation/services_page.dart';

GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.about,
        name: 'about',
        builder: (context, state) => const AboutPage(),
      ),
      GoRoute(
        path: AppRoutes.services,
        name: 'services',
        builder: (context, state) => const ServicesPage(),
      ),
      GoRoute(
        path: AppRoutes.blog,
        name: 'blog',
        builder: (context, state) => const BlogListPage(),
        routes: [
          GoRoute(
            path: ':slug',
            name: 'blog-post',
            builder: (context, state) {
              return BlogDetailPage(slug: state.pathParameters['slug']!);
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.contact,
        name: 'contact',
        builder: (context, state) => const ContactPage(),
      ),
    ],
  );
}
