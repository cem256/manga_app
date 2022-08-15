import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/search_manga/search_manga_cubit.dart';
import '../widgets/custom_error_widget.dart';
import '../widgets/manga_gridview_widget.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  final TextEditingController userInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: BlocBuilder<SearchMangaCubit, SearchMangaState>(
        builder: (context, state) {
          if (state is SearchMangaInitialState) {
            return Container();
          } else if (state is SearchMangaLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchMangaLoadedState) {
            return MangaGridViewWidget(mangaList: state.model?.data ?? []);
          } else if (state is SearchMangaEmptyState) {
            return const CustomErrorWidget(message: "No result found");
          } else {
            return const CustomErrorWidget();
          }
        },
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
        title: TextField(
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.search,
      controller: userInput,
      onChanged: (userInput) {
        if (userInput.length > 2) {
          EasyDebounce.debounce("searchManga", const Duration(milliseconds: 1000), () {
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
            icon: const Icon(Icons.clear),
          )),
    ));
  }
}
