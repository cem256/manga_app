import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cache/cache_manager.dart';
import '../../core/constants/cache_contants.dart';
import '../../model/manga_response_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState());

  final CacheManager _cacheManager = CacheManager(HiveConstants.favoritesBoxName);

  Future<void> getFavorites({int? malId}) async {
    await _cacheManager.init();
    final favorites = _cacheManager.getValues();
    final isFavorite = favorites.map(((e) => e.malId)).contains(malId);
    emit(state.copyWith(favorites: favorites, isFavorite: isFavorite));
  }

  Future<void> updateFavorites(Data data) async {
    await _cacheManager.init();
    await _cacheManager.putItem(data);
    final favorites = _cacheManager.getValues();
    final isFavorite = favorites.map(((e) => e.malId)).contains(data.malId);
    emit(state.copyWith(favorites: favorites, isFavorite: isFavorite));
  }
}
