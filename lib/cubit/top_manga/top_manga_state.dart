part of 'top_manga_cubit.dart';

@immutable
abstract class TopMangaState {}

class TopMangaInitialState extends TopMangaState {}

class TopMangaLoadingState extends TopMangaState {}

class TopMangaLoadedState extends TopMangaState {
  final MangaResponseModel? model;

  TopMangaLoadedState(this.model);
}

class TopMangaErrorState extends TopMangaState {}
