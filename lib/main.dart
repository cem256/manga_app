import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/cubit/top_manga/top_manga_cubit.dart';
import 'package:manga_app/view/bottom_navbar_view.dart';
import 'cubit/manga_detail/manga_detail_cubit.dart';

void main() => runApp(const MangaApp());

class MangaApp extends StatelessWidget {
  const MangaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TopMangaCubit>(create: (_) => TopMangaCubit()),
        BlocProvider<MangaDetailCubit>(create: (_) => MangaDetailCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavbarView(),
      ),
    );
  }
}