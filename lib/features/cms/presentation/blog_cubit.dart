import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/models/site_content.dart';
import '../domain/repositories/cms_repository.dart';

sealed class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object?> get props => [];
}

class BlogLoading extends BlogState {
  const BlogLoading();
}

class BlogListLoaded extends BlogState {
  const BlogListLoaded(this.posts);

  final List<BlogPost> posts;

  @override
  List<Object?> get props => [posts];
}

class BlogPostLoaded extends BlogState {
  const BlogPostLoaded(this.post);

  final BlogPost post;

  @override
  List<Object?> get props => [post];
}

class BlogError extends BlogState {
  const BlogError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class BlogCubit extends Cubit<BlogState> {
  BlogCubit(this._repository) : super(const BlogLoading());

  final CmsRepository _repository;

  Future<void> loadPosts() async {
    emit(const BlogLoading());
    try {
      final posts = await _repository.getPosts();
      emit(BlogListLoaded(posts));
    } catch (error) {
      emit(BlogError('$error'));
    }
  }

  Future<void> loadPost(String slug) async {
    emit(const BlogLoading());
    try {
      final post = await _repository.getPostBySlug(slug);
      if (post == null) {
        emit(const BlogError('This article is not published.'));
        return;
      }
      emit(BlogPostLoaded(post));
    } catch (error) {
      emit(BlogError('$error'));
    }
  }

  Future<void> savePost(BlogPost post) async {
    await _repository.savePost(post);
    await loadPosts();
  }
}
