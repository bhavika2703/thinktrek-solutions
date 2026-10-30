import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/models/site_content.dart';
import '../domain/repositories/cms_repository.dart';

sealed class CmsState extends Equatable {
  const CmsState();

  @override
  List<Object?> get props => [];
}

class CmsLoading extends CmsState {
  const CmsLoading();
}

class CmsLoaded extends CmsState {
  const CmsLoaded(this.content);

  final SiteContent content;

  @override
  List<Object?> get props => [content];
}

class CmsError extends CmsState {
  const CmsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class CmsCubit extends Cubit<CmsState> {
  CmsCubit(this._repository) : super(const CmsLoading());

  final CmsRepository _repository;

  Future<void> load() async {
    emit(const CmsLoading());
    try {
      final content = await _repository.getSiteContent();
      emit(CmsLoaded(content));
    } catch (error) {
      emit(CmsError('$error'));
    }
  }

  /// Hook for the future admin panel: persist then refresh public pages.
  Future<void> save(SiteContent content) async {
    await _repository.saveSiteContent(content);
    emit(CmsLoaded(content));
  }
}
