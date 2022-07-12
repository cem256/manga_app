import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/search_manga_controller.dart';
import '../../model/manga_response_model.dart';

part 'search_manga_state.dart';

class SearchMangaCubit extends Cubit<SearchMangaState> {
  SearchMangaCubit() : super(SearchMangaInitialState());
  final SearchMangaController _controller = SearchMangaController();

  Future<void> searchManga(String query) async {
    emit(SearchMangaLoadingState());
    final response = await _controller.searchManga(query);
    if (response != null) {
      response.data!.isEmpty ? emit(SearchMangaEmptyState()) : emit(SearchMangaLoadedState(response));
    } else {
      emit(SearchMangaErrorState());
    }
  }
}
