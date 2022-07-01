import 'package:manga_app/interface/search_manga_base.dart';

import '../model/top_manga_model.dart';
import '../service/network_service.dart';

class SearchMangaController extends SearchMangaBase {
  final NetworkManager _service = NetworkManager.instance;

  @override
  Future<TopMangaResponseModel?> searchManga(String query) {
    return _service.searchManga(query);
  }
}
