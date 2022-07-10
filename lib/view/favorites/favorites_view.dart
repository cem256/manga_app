import 'package:flutter/material.dart';
import 'package:manga_app/provider/favorites_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/manga_gridview_widget.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Favorites")),
        body: context.watch<FavoritesProvider>().getFavoritesList().isNotEmpty
            ? MangaGridViewWidget(
                mangaList:
                    context.watch<FavoritesProvider>().getFavoritesList())
            : const Center(
                child: Text("You don't have any favorites."),
              ));
  }
}
