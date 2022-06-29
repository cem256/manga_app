part of 'manga_detail_cubit.dart';

@immutable
abstract class MangaDetailState {}

class MangaDetailInitialState extends MangaDetailState {}

class MangaDetailLoadingState extends MangaDetailState {}

class MangaDetailLoadedState extends MangaDetailState {
  final MangaDetailResponseModel? model;

  MangaDetailLoadedState(this.model);
}

class MangaDetailErrorState extends MangaDetailState {}
