import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/core/extension/context_extension.dart';
import 'package:manga_app/core/utils/logger.dart';
import 'package:manga_app/cubit/search_manga/search_manga_cubit.dart';

import '../core/router/app_router.dart';
import '../model/top_manga_model.dart';
import 'manga_detail_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController userInput = TextEditingController();
  List<Data> topMangaList = <Data>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
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
      ),
      body: BlocConsumer<SearchMangaCubit, SearchMangaState>(
        listener: (context, state) {
          if (state is SearchMangaLoadedState &&
              state.model != null &&
              state.model?.data != null) {
            topMangaList.clear();
            topMangaList.addAll(state.model!.data ?? []);
            Log.instance.d(topMangaList);
          }
        },
        builder: (context, state) {
          if (state is SearchMangaInitialState) {
            return Container();
          } else if (state is SearchMangaLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchMangaLoadedState) {
            return GridView.builder(
                padding: context.paddingAllDefault,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: context.mediumValue,
                    crossAxisSpacing: context.mediumValue,
                    childAspectRatio: 3 / 4,
                    crossAxisCount: 2),
                itemCount: topMangaList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      AppRouter().push(context,
                          MangaDetailView(mangaDetails: topMangaList[index]));
                    },
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          fit: BoxFit.fill,
                          topMangaList[index].images?.jpg?.imageUrl ?? '',
                        ),
                      ),
                      Container(
                        padding: context.paddingHorizontalLow,
                        height: context.dynamicHeight(0.08),
                        width: double.infinity,
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.6)),
                        child: Center(
                          child: Text(
                            topMangaList[index].title ?? '',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ]),
                  );
                });
          } else if (state is SearchMangaEmptyState) {
            return const Center(child: Text("No result found"));
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }
}
