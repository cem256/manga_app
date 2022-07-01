import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/core/extension/context_extension.dart';
import 'package:manga_app/core/router/app_router.dart';
import 'package:manga_app/cubit/top_manga/top_manga_cubit.dart';

import 'package:manga_app/view/manga_detail_view.dart';

import '../model/top_manga_model.dart';

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
            return _TopMangaGridViewWidget(topMangaList: topMangaList);
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
        title: const Text("Top Manga"),
      );
}

class _TopMangaGridViewWidget extends StatelessWidget {
  const _TopMangaGridViewWidget({
    Key? key,
    required this.topMangaList,
  }) : super(key: key);

  final List<Data> topMangaList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: context.paddingAllDefault,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: context.mediumValue,
            crossAxisSpacing: context.mediumValue,
            childAspectRatio: 3 / 4,
            crossAxisCount: 2),
        itemCount: topMangaList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              AppRouter().push(
                  context, MangaDetailView(mangaDetails: topMangaList[index]));
            },
            child: Stack(
                alignment: Alignment.bottomCenter,
                children: [_stackImage(index), _stackText(context, index)]),
          );
        });
  }

  SizedBox _stackImage(int index) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(
        fit: BoxFit.fill,
        topMangaList[index].images?.jpg?.imageUrl ?? '',
      ),
    );
  }

  Container _stackText(BuildContext context, int index) {
    return Container(
      padding: context.paddingHorizontalLow,
      height: context.dynamicHeight(0.08),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
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
    );
  }
}
