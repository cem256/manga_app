import 'package:manga_app/model/manga_response_model.dart';

abstract class TopMangaBase {
  Future<MangaResponseModel?> fetchTopManga();
}
