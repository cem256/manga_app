import 'package:manga_app/service/network_service.dart';
import '../interface/top_manga_interface.dart';
import '../model/manga_response_model.dart';

class TopMangaController extends ITopManga<MangaResponseModel?> {
  final NetworkManager _service = NetworkManager.instance;

  @override
  Future<MangaResponseModel?> fetchTopManga() {
    return _service.fetchTopManga();
  }
}
