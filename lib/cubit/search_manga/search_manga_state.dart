part of 'search_manga_cubit.dart';

@immutable
abstract class SearchMangaState {}

class SearchMangaInitialState extends SearchMangaState {}

class SearchMangaLoadingState extends SearchMangaState {}

class SearchMangaLoadedState extends SearchMangaState {
  final MangaResponseModel? model;

  SearchMangaLoadedState(this.model);
}

class SearchMangaEmptyState extends SearchMangaState {}

class SearchMangaErrorState extends SearchMangaState {}
