import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/constants/view_constants.dart';
import '../../core/extension/context_extension.dart';
import '../../core/router/app_router.dart';
import '../../model/manga_response_model.dart';
import '../detail/manga_detail_view.dart';

part 'manga_card_widget.dart';

class MangaGridViewWidget extends StatelessWidget {
  const MangaGridViewWidget({
    Key? key,
    required this.mangaList,
    this.controller,
  }) : super(key: key);

  final List<Data> mangaList;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: controller,
        padding: context.paddingAllDefault,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: context.mediumValue,
            crossAxisSpacing: context.mediumValue,
            childAspectRatio: 3 / 4,
            crossAxisCount: 2),
        itemCount: mangaList.length,
        itemBuilder: (context, index) {
          return _MangaCardWidget(mangaList, index);
        });
  }
}
