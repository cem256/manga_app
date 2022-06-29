import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/controller/top_manga_controller.dart';
import '../../model/top_manga_model.dart';

part 'top_manga_state.dart';

class TopMangaCubit extends Cubit<TopMangaState> {
  TopMangaCubit() : super(TopMangaInitialState());
  final TopMangaController _controller = TopMangaController();

  Future<void> fetchTopManga() async {
    emit(TopMangaLoadingState());
    final response = await _controller.fetchTopManga();
    if (response != null) {
      emit(TopMangaLoadedState(response));
    } else {
      emit(TopMangaErrorState());
    }
  }
}
