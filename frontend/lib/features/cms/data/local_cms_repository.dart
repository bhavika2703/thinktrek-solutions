import '../domain/models/site_content.dart';
import '../domain/repositories/cms_repository.dart';
import 'thinktrek_seed.dart';

/// In-memory store. Admin APIs later persist the same models.
class LocalCmsRepository implements CmsRepository {
  LocalCmsRepository({SiteContent? site, List<BlogPost>? posts})
    : _site = site ?? ThinktrekSeed.site,
      _posts = List<BlogPost>.from(posts ?? ThinktrekSeed.posts);

  SiteContent _site;
  final List<BlogPost> _posts;

  @override
  Future<SiteContent> getSiteContent() async => _site;

  @override
  Future<void> saveSiteContent(SiteContent content) async {
    _site = content;
  }

  @override
  Future<List<BlogPost>> getPosts() async {
    final copy = [..._posts]
      ..sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
    return copy;
  }

  @override
  Future<BlogPost?> getPostBySlug(String slug) async {
    for (final post in _posts) {
      if (post.slug == slug) {
        return post;
      }
    }
    return null;
  }

  @override
  Future<void> savePost(BlogPost post) async {
    final index = _posts.indexWhere((item) => item.id == post.id);
    if (index >= 0) {
      _posts[index] = post;
    } else {
      _posts.add(post);
    }
  }
}
