import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/manga_detail_controller.dart';
import '../../model/manga_detail_model.dart';

part 'manga_detail_state.dart';

class MangaDetailCubit extends Cubit<MangaDetailState> {
  MangaDetailCubit() : super(MangaDetailInitialState());
  final MangaDetailController _controller = MangaDetailController();

  Future<void> fetchTopManga(int? id) async {
    emit(MangaDetailLoadingState());
    final response = await _controller.fetchMangaDetail(id);
    if (response != null) {
      emit(MangaDetailLoadedState(response));
    } else {
      emit(MangaDetailErrorState());
    }
  }
}
