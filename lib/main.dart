import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manga_app/core/constants/app_contants.dart';
import 'package:manga_app/core/theme/app_theme.dart';
import 'package:manga_app/view/bottom_navbar_view.dart';

void main() async {
  await Hive.initFlutter();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MangaApp());
}

class MangaApp extends StatelessWidget {
  const MangaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppConstants.providers,
      child: MaterialApp(
        title: AppConstants.appname,
        theme: AppTheme().appTheme,
        debugShowCheckedModeBanner: false,
        home: const BottomNavbarView(),
      ),
    );
  }
}
