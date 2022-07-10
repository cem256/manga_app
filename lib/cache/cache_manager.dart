import 'package:hive/hive.dart';
import 'package:manga_app/core/constants/cache_contants.dart';
import 'package:manga_app/model/manga_response_model.dart';

import '../core/utils/logger.dart';

abstract class ICacheManager<T> {
  final String key;

  ICacheManager(this.key);

  Future<void> init();
  void registerAdapters();
  Future<void> clear();
  List<T> getValues();
  Future<void> putItem(T item);
  Future<void> deleteItem(dynamic key);
}

class CacheManager extends ICacheManager<Data> {
  CacheManager(super.key);

  Box<Data>? _box;

  @override
  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.mangaTypeId)) {
      Hive.registerAdapter(MangaResponseModelAdapter());
      Hive.registerAdapter(DataAdapter());
      Hive.registerAdapter(ImagesAdapter());
      Hive.registerAdapter(JpgAdapter());
    }
  }

  @override
  Future<void> clear() async {
    await _box?.clear();
  }

  @override
  Future<void> deleteItem(key) async {
    await _box?.delete(key);
  }

  @override
  List<Data> getValues() {
    return _box?.values.toList() ?? [];
  }

  @override
  Future<void> putItem(Data item) async {
    if (_box?.containsKey(item.malId) ?? false) {
      await deleteItem(item.malId);
      Log.instance.i("${item.title ?? ''} removed from favorites list");
    } else {
      await _box?.put(item.malId, item);
      Log.instance.i("${item.title ?? ''} added to favorites list");
    }
  }
}
