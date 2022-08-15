import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/favorites/favorites_cubit.dart';
import '../widgets/custom_error_widget.dart';
import '../widgets/manga_gridview_widget.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    context.read<FavoritesCubit>().getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(title: const Text("Favorites")),
            body: (state.favorites ?? []).isNotEmpty
                ? MangaGridViewWidget(mangaList: state.favorites ?? [])
                : const CustomErrorWidget(
                    message: "You don't have any favorites",
                  ));
      },
    );
  }
}
