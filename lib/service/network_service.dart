import 'package:dio/dio.dart';
import 'package:manga_app/interfaces/manga_detail_base.dart';
import 'package:manga_app/interfaces/top_manga_base.dart';
import 'package:manga_app/model/manga_detail_model.dart';
import 'package:manga_app/model/top_manga_model.dart';

class NetworkManager implements TopMangaBase, MangaDetailBase {
  late Dio dio;

  static NetworkManager? _instace;
  static NetworkManager get instance {
    _instace ??= NetworkManager._init();
    return _instace!;
  }

  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: "https://api.jikan.moe/v4/"));
  }

  @override
  Future<TopMangaResponseModel?> fetchTopManga(String filter) async {
    try {
      const int limit = 100;

      var response = await dio.get("top/manga?filter=$filter&limit=$limit");
      final res = TopMangaResponseModel?.fromJson(response.data);

      return res;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<MangaDetailResponseModel?> fetchMangaDetail(int? id) async {
    try {
      var response = await dio.get("manga/$id");
      final res = MangaDetailResponseModel?.fromJson(response.data);

      return res;
    } catch (e) {
      return null;
    }
  }
}

enum Filter { bypopularity, favorite, upcoming }
