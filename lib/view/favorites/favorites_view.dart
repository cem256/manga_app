import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/cubit/favorites/favorites_cubit.dart';

import '../widgets/manga_gridview_widget.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    context.read<FavoritesCubit>().getInitialFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Favorites")),
        body: context.watch<FavoritesCubit>().state.isNotEmpty
            ? MangaGridViewWidget(
                mangaList: context.watch<FavoritesCubit>().state)
            : const Center(
                child: Text("You don't have any favorites."),
              ));
  }
}
