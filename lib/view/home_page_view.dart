import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/cubit/top_manga/top_manga_cubit.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
    context.read<TopMangaCubit>().fetchTopManga("bypopularity");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: BlocBuilder<TopMangaCubit, TopMangaState>(
        builder: (context, state) {
          if (state is TopMangaLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopMangaLoadedState) {
            return const Center(
              child: Text("Success"),
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}
