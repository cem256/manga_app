import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manga_app/cubit/top_manga/top_manga_cubit.dart';
import 'package:manga_app/provider/favorites_provider.dart';
import 'package:manga_app/view/bottom_navbar_view.dart';
import 'package:provider/provider.dart';
import 'cubit/search_manga/search_manga_cubit.dart';

void main() async {
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FavoritesProvider())
  ], child: const MangaApp()));
}

class MangaApp extends StatelessWidget {
  const MangaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TopMangaCubit>(create: (_) => TopMangaCubit()),
        BlocProvider<SearchMangaCubit>(create: (_) => SearchMangaCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(
              primary: Colors.white, secondary: Colors.white),
        ),
        debugShowCheckedModeBanner: false,
        home: const BottomNavbarView(),
      ),
    );
  }
}
