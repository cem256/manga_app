import 'package:flutter/material.dart';
import 'package:manga_app/core/extension/context_extension.dart';
import '../../model/manga_response_model.dart';
import 'manga_card_widget.dart';

class MangaGridViewWidget extends StatelessWidget {
  const MangaGridViewWidget({
    Key? key,
    required this.mangaList,
  }) : super(key: key);

  final List<Data> mangaList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: context.paddingAllDefault,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: context.mediumValue,
            crossAxisSpacing: context.mediumValue,
            childAspectRatio: 3 / 4,
            crossAxisCount: 2),
        itemCount: mangaList.length,
        itemBuilder: (context, index) {
          return MangaCardWidget(mangaList, index);
        });
  }
}
