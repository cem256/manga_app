import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/core/utils/logger.dart';
import 'package:manga_app/cubit/search_manga/search_manga_cubit.dart';
import 'package:manga_app/view/widgets/manga_gridview_widget.dart';

import '../../model/manga_response_model.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  final TextEditingController userInput = TextEditingController();
  final List<Data> searchMangaList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: BlocConsumer<SearchMangaCubit, SearchMangaState>(
        listener: (context, state) {
          if (state is SearchMangaLoadedState &&
              state.model != null &&
              state.model?.data != null) {
            searchMangaList.clear();
            searchMangaList.addAll(state.model!.data ?? []);
            Log.instance.d(searchMangaList);
          }
        },
        builder: (context, state) {
          if (state is SearchMangaInitialState) {
            return Container();
          } else if (state is SearchMangaLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchMangaLoadedState) {
            return MangaGridViewWidget(mangaList: searchMangaList);
          } else if (state is SearchMangaEmptyState) {
            return const Center(child: Text("No result found"));
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      title: TextField(
        textCapitalization: TextCapitalization.words,
        controller: userInput,
        onChanged: (userInput) {
          if (userInput.length > 2) {
            EasyDebounce.debounce(
                "searchManga", const Duration(milliseconds: 1000), () {
              context.read<SearchMangaCubit>().searchManga(userInput);
            });
          }
        },
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search...",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
              onPressed: () {
                userInput.text = "";
              },
              icon: const Icon(Icons.clear)),
        ),
      ),
    );
  }
}
