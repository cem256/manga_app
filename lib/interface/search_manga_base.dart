import '../model/manga_response_model.dart';

abstract class SearchMangaBase {
  Future<MangaResponseModel?> searchManga(String query);
}
