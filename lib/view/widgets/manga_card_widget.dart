import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:manga_app/core/extension/context_extension.dart';
import '../../core/constants/view_constants.dart';
import '../../core/router/app_router.dart';
import '../../model/manga_response_model.dart';
import '../detail/manga_detail_view.dart';

class MangaCardWidget extends StatelessWidget {
  const MangaCardWidget(this.mangaList, this.index, {Key? key})
      : super(key: key);

  final List<Data> mangaList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter()
            .push(context, MangaDetailView(mangaDetails: mangaList[index]));
      },
      child: ClipRRect(
        borderRadius: ViewConstants.borderCircular,
        child: Stack(
            alignment: Alignment.bottomCenter,
            children: [_stackImage(), _stackText(context)]),
      ),
    );
  }

  SizedBox _stackImage() {
    return SizedBox(
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: "${mangaList[index].images?.jpg?.imageUrl}",
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.fill,
      ),
    );
  }

  Container _stackText(BuildContext context) {
    return Container(
      padding: context.paddingHorizontalLow,
      height: context.dynamicHeight(0.08),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
      child: Center(
        child: Text(
          mangaList[index].title ?? '',
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
