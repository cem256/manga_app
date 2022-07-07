import 'package:flutter/material.dart';
import 'package:manga_app/cache/cache_manager.dart';
import 'package:manga_app/core/constants/cache_contants.dart';
import 'package:manga_app/interface/cache_manager_interface.dart';
import '../../model/manga_response_model.dart';
import '../widgets/manga_gridview_widget.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  ICacheManager<Data> cacheManager =
      CacheManager(HiveConstants.favoritesBoxName);
  List<Data> favoritesList = [];

  @override
  void initState() {
    super.initState();
    initCache();
  }

  Future<void> initCache() async {
    await cacheManager.init();
    favoritesList = cacheManager.getValues();
    print(favoritesList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Favorites")),
        body: MangaGridViewWidget(mangaList: favoritesList));
  }
}
