import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/cubit/top_manga/top_manga_cubit.dart';

import 'package:manga_app/view/widgets/manga_gridview_widget.dart';

import '../../model/manga_response_model.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    context.read<TopMangaCubit>().fetchTopManga();
  }

  List<Data> topMangaList = <Data>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: BlocConsumer<TopMangaCubit, TopMangaState>(
        listener: (context, state) {
          if (state is TopMangaLoadedState &&
              state.model != null &&
              state.model?.data != null) {
            topMangaList.addAll(state.model!.data ?? []);
          }
        },
        builder: (context, state) {
          if (state is TopMangaLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopMangaLoadedState) {
            return MangaGridViewWidget(mangaList: topMangaList);
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }

  AppBar _appbar() => AppBar(
        title: const Text("Home"),
      );
}
