import 'package:manga_app/service/network_service.dart';
import '../interfaces/top_manga_base.dart';
import '../model/top_manga_model.dart';

class TopMangaController extends TopMangaBase {
  final NetworkManager _service = NetworkManager.instance;

  @override
  Future<TopMangaResponseModel?> fetchTopManga(String filter) {
    return _service.fetchTopManga(filter);
  }
}
