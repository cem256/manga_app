import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:manga_app/core/extension/context_extension.dart';
import 'package:provider/provider.dart';
import '../../core/constants/view_constants.dart';
import '../../model/manga_response_model.dart';
import '../../provider/favorites_provider.dart';

class MangaDetailView extends StatelessWidget {
  final Data mangaDetails;
  const MangaDetailView({Key? key, required this.mangaDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.centerLeft, children: [
              _mangaFadeImage(context),
              Padding(
                padding: context.paddingAllDefault,
                child: _mangaImageCard(context),
              ),
            ]),
            Padding(
              padding: context.paddingAllDefault,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: context.lowValue),
                  _mangaTitle(context),
                  SizedBox(height: context.lowValue),
                  _mangaSynopsis(context),
                  SizedBox(height: context.dynamicHeight(0.1)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      title: const Text("Details"),
      actions: [
        IconButton(
            onPressed: () async {
              await context.read<FavoritesProvider>().putItem(mangaDetails);
            },
            icon: const Icon(Icons.favorite),
            color: context
                    .watch<FavoritesProvider>()
                    .isFavorite(mangaDetails.malId)
                ? Colors.red
                : null)
      ],
    );
  }

  SizedBox _mangaFadeImage(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
      width: double.infinity,
      child: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: CachedNetworkImage(
          imageUrl: "${mangaDetails.images?.jpg?.imageUrl}",
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  ClipRRect _mangaImageCard(BuildContext context) {
    return ClipRRect(
      borderRadius: ViewConstants.borderCircular,
      child: SizedBox(
        width: context.dynamicWidth(0.3),
        child: CachedNetworkImage(
          imageUrl: "${mangaDetails.images?.jpg?.imageUrl}",
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Text _mangaTitle(BuildContext context) {
    return Text(
      mangaDetails.title ?? "",
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontWeight: FontWeight.bold),
      maxLines: 2,
    );
  }

  Text _mangaSynopsis(BuildContext context) {
    return Text(
      mangaDetails.synopsis ?? "",
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
