import 'package:manga_app/model/top_manga_model.dart';

abstract class TopMangaBase {
  Future<TopMangaResponseModel?> fetchTopManga(String filter);
}
