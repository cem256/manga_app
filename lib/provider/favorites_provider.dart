import 'package:flutter/material.dart';
import 'package:manga_app/cache/cache_manager.dart';
import 'package:manga_app/core/constants/cache_contants.dart';
import '../model/manga_response_model.dart';

class FavoritesProvider extends ChangeNotifier {
  final CacheManager _cacheManager =
      CacheManager(HiveConstants.favoritesBoxName);

  bool isFavorite(int? id) {
    _cacheManager.init();
    return _cacheManager.getValues().map((e) => e.malId).contains(id);
  }

  Future<void> putItem(Data data) async {
    await _cacheManager.putItem(data);
    notifyListeners();
  }

  List<Data> getFavoritesList() {
    _cacheManager.init();
    return _cacheManager.getValues();
  }
}
