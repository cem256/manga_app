import '../model/manga_detail_model.dart';

abstract class MangaDetailBase {
  Future<MangaDetailResponseModel?> fetchMangaDetail(int? id);
}
