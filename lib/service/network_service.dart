import 'package:dio/dio.dart';
import '../core/utils/logger.dart';
import '../interface/search_manga_interface.dart';
import '../model/manga_response_model.dart';
import '../interface/top_manga_interface.dart';

class NetworkManager implements ITopManga<MangaResponseModel?>, ISearchManga<MangaResponseModel?> {
  late Dio _dio;
  late String _baseUrl;

  static NetworkManager? _instace;
  static NetworkManager get instance {
    _instace ??= NetworkManager._init();
    return _instace!;
  }

  NetworkManager._init() {
    _baseUrl = "https://api.jikan.moe/v4/";
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
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
