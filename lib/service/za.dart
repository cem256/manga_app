import 'package:manga_app/service/network_service.dart';

void main(List<String> args) {
  // api key neydi acaba
  print(NetworkManager.instance.dio.options.baseUrl);
  print(NetworkManager.instance.fetchMangaDetail(81669));
}
