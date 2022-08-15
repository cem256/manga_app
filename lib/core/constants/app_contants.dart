import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/favorites/favorites_cubit.dart';
import '../../cubit/search_manga/search_manga_cubit.dart';
import '../../cubit/top_manga/top_manga_cubit.dart';

class AppConstants {
  static String get appname => "Manga App";
  static List<BlocProvider> providers = [
    BlocProvider<TopMangaCubit>(create: (_) => TopMangaCubit()),
    BlocProvider<SearchMangaCubit>(create: (_) => SearchMangaCubit()),
    BlocProvider<FavoritesCubit>(create: (_) => FavoritesCubit()),
  ];
}
