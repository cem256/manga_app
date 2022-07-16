import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cache/cache_manager.dart';
import '../../core/constants/cache_contants.dart';
import '../../model/manga_response_model.dart';

class FavoritesCubit extends Cubit<List<Data>> {
  FavoritesCubit() : super([]);

  final CacheManager _cacheManager = CacheManager(HiveConstants.favoritesBoxName);

  Future<void> getInitialFavorites() async {
    await _cacheManager.init();
    emit(_cacheManager.getValues());
  }

  Future<void> updateFavorites(Data data) async {
    await _cacheManager.init();
    await _cacheManager.putItem(data);
    emit(_cacheManager.getValues());
  }
}
