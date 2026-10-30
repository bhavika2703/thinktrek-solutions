import '../models/site_content.dart';

/// Content gateway. Swap [LocalCmsRepository] for an HTTP client when the
/// admin API is live — cubits stay the same.
abstract class CmsRepository {
  Future<SiteContent> getSiteContent();

  Future<void> saveSiteContent(SiteContent content);

  Future<List<BlogPost>> getPosts();

  Future<BlogPost?> getPostBySlug(String slug);

  Future<void> savePost(BlogPost post);
}
