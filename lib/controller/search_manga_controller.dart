import '../interface/search_manga_interface.dart';
import '../model/manga_response_model.dart';
import '../service/network_service.dart';

class SearchMangaController extends ISearchManga<MangaResponseModel?> {
  final NetworkManager _service = NetworkManager.instance;

  @override
  Future<MangaResponseModel?> searchManga(String query) {
    return _service.searchManga(query);
  }
}
