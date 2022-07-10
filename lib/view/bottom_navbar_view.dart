import 'package:flutter/material.dart';
import 'package:manga_app/view/favorites/favorites_view.dart';
import 'package:manga_app/view/home/home_page_view.dart';
import 'package:manga_app/view/search/search_view.dart';

class BottomNavbarView extends StatefulWidget {
  const BottomNavbarView({Key? key}) : super(key: key);

  @override
  State<BottomNavbarView> createState() => _BottomNavbarViewState();
}

class _BottomNavbarViewState extends State<BottomNavbarView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
      ),
      body: pages[_currentIndex],
    );
  }

  static final pages = [
    const HomePageView(),
    const FavoritesView(),
    SearchView()
  ];
}
