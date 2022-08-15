import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/top_manga_controller.dart';
import '../../model/manga_response_model.dart';

part 'top_manga_state.dart';

class TopMangaCubit extends Cubit<TopMangaState> {
  TopMangaCubit() : super(TopMangaInitialState());

  final TopMangaController _controller = TopMangaController();

  Future<void> fetchTopManga(int page) async {
    if (page == 1) {
      emit(TopMangaLoadingState());
    }
    final response = await _controller.fetchTopManga(page);

    if (response != null) {
      emit(TopMangaLoadedState(response));
    } else {
      emit(TopMangaErrorState());
    }
  }
}
