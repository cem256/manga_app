import '../model/top_manga_model.dart';

abstract class SearchMangaBase {
  Future<TopMangaResponseModel?> searchManga(String query);
}
