import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/core/extension/context_extension.dart';
import 'package:manga_app/cubit/favorites/favorites_cubit.dart';
import '../../core/constants/view_constants.dart';
import '../../model/manga_response_model.dart';

class MangaDetailView extends StatefulWidget {
  final Data mangaDetails;
  const MangaDetailView({Key? key, required this.mangaDetails}) : super(key: key);

  @override
  State<MangaDetailView> createState() => _MangaDetailViewState();
}

class _MangaDetailViewState extends State<MangaDetailView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesCubit>().getInitialFavorites();
  }

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
              await context.read<FavoritesCubit>().updateFavorites(widget.mangaDetails);
            },
            icon: const Icon(Icons.favorite),
            color: context.watch<FavoritesCubit>().state.map((e) => e.malId).contains(widget.mangaDetails.malId)
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
          imageUrl: "${widget.mangaDetails.images?.jpg?.imageUrl}",
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
          imageUrl: "${widget.mangaDetails.images?.jpg?.imageUrl}",
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Text _mangaTitle(BuildContext context) {
    return Text(
      widget.mangaDetails.title ?? "",
      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
      maxLines: 2,
    );
  }

  Text _mangaSynopsis(BuildContext context) {
    return Text(
      widget.mangaDetails.synopsis ?? "",
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
