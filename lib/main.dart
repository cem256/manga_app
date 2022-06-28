import 'package:flutter/material.dart';
import 'package:manga_app/view/bottom_navbar_view.dart';

void main() => runApp(const MangaApp());

class MangaApp extends StatelessWidget {
  const MangaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavbarView(),
    );
  }
}
