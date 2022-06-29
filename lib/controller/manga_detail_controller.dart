import 'package:manga_app/model/manga_detail_model.dart';
import '../interfaces/manga_detail_base.dart';
import '../service/network_service.dart';

class MangaDetailController extends MangaDetailBase {
  final NetworkManager _service = NetworkManager.instance;

  @override
  Future<MangaDetailResponseModel?> fetchMangaDetail(int? id) {
    return _service.fetchMangaDetail(id);
  }
}
