import 'package:dio/dio.dart';
import 'package:manga_app/core/utils/logger.dart';
import 'package:manga_app/interface/search_manga_interface.dart';
import 'package:manga_app/model/manga_response_model.dart';
import '../interface/top_manga_interface.dart';

class NetworkManager implements ITopManga<MangaResponseModel?>, ISearchManga<MangaResponseModel?> {
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
  Future<MangaResponseModel?> fetchTopManga(int page) async {
    try {
      const int limit = 500;
      Log.instance.d("Current page is $page");

      var response = await _dio.get("top/manga?limit=$limit&page=$page");
      final res = MangaResponseModel?.fromJson(response.data);

      Log.instance.d(res);
      return res;
    } catch (e) {
      Log.instance.e(e);
      return null;
    }
  }

  @override
  Future<MangaResponseModel?> searchManga(String query) async {
    try {
      var response = await _dio.get("manga?q=$query&order_by=members&sort=desc");
      final res = MangaResponseModel?.fromJson(response.data);

      Log.instance.d(res);
      return res;
    } catch (e) {
      Log.instance.e(e);
      return null;
    }
  }
}
