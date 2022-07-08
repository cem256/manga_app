import 'package:flutter/material.dart';
import 'package:manga_app/provider/favorites_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/manga_gridview_widget.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Favorites")),
        body: context.watch<FavoritesProvider>().getValues().isNotEmpty
            ? MangaGridViewWidget(
                mangaList: context.watch<FavoritesProvider>().getValues())
            : const Center(
                child: Text("You don't have any favorites."),
              ));
  }
}
