import 'package:dio/dio.dart';
import 'package:manga_app/core/utils/logger.dart';
import 'package:manga_app/interface/search_manga_base.dart';
import 'package:manga_app/model/top_manga_model.dart';
import '../interface/top_manga_base.dart';

class NetworkManager implements TopMangaBase, SearchMangaBase {
  late Dio _dio;

  static NetworkManager? _instace;
  static NetworkManager get instance {
    _instace ??= NetworkManager._init();
    return _instace!;
  }

  NetworkManager._init() {
    _dio = Dio(BaseOptions(baseUrl: "https://api.jikan.moe/v4/"));
  }

  @override
  Future<TopMangaResponseModel?> fetchTopManga() async {
    try {
      const int limit = 96;

      var response = await _dio.get("top/manga?limit=$limit");
      final res = TopMangaResponseModel?.fromJson(response.data);

      Log.instance.d(res);
      return res;
    } catch (e) {
      Log.instance.e(e);
      return null;
    }
  }

  @override
  Future<TopMangaResponseModel?> searchManga(String query) async {
    try {
      var response =
          await _dio.get("manga?q=$query&order_by=members&sort=desc");
      final res = TopMangaResponseModel?.fromJson(response.data);

      Log.instance.d(res);
      return res;
    } catch (e) {
      Log.instance.e(e);
      return null;
    }
  }
}
