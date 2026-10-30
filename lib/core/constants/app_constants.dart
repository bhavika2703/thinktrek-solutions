abstract final class AppAssets {
  static const String logo = 'assets/logo.png';
  static const String logoThumb = 'assets/log_thumb.png';
}

abstract final class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String services = '/services';
  static const String blog = '/blog';
  static const String contact = '/contact';

  static String blogPost(String slug) => '$blog/$slug';
}
