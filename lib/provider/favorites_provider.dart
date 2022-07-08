import 'package:flutter/material.dart';
import 'package:manga_app/cache/cache_manager.dart';
import 'package:manga_app/core/constants/cache_contants.dart';
import 'package:manga_app/interface/cache_manager_interface.dart';

import '../model/manga_response_model.dart';

class FavoritesProvider extends ChangeNotifier {
  ICacheManager<Data> cacheManager =
      CacheManager(HiveConstants.favoritesBoxName);

  List<Data> getValues() {
    cacheManager.init();
    return cacheManager.getValues();
  }

  void updateList() {
    cacheManager.init();
    cacheManager.getValues();
    notifyListeners();
  }
}
