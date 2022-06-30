import 'package:flutter/material.dart';
import 'package:manga_app/core/extension/context_extension.dart';

import '../model/top_manga_model.dart';

class MangaDetailView extends StatefulWidget {
  final Data mangaDetails;
  const MangaDetailView({Key? key, required this.mangaDetails})
      : super(key: key);

  @override
  State<MangaDetailView> createState() => _MangaDetailViewState();
}

class _MangaDetailViewState extends State<MangaDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: context.paddingAllDefault,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _mangaImage(context),
              SizedBox(height: context.lowValue),
              _mangaTitle(context),
              SizedBox(height: context.lowValue),
              _mangaRatingPopularity(context),
              SizedBox(height: context.lowValue),
              _mangaSynopsis(context),
              SizedBox(height: context.dynamicHeight(0.1)),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: Text(widget.mangaDetails.title ?? ""),
    );
  }

  SizedBox _mangaImage(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.4),
      width: double.infinity,
      child: Image.network(
        widget.mangaDetails.images?.jpg?.imageUrl ?? "",
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Text _mangaTitle(BuildContext context) {
    return Text(
      widget.mangaDetails.title ?? "",
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontWeight: FontWeight.bold),
      maxLines: 2,
    );
  }

  Row _mangaRatingPopularity(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rating: ${widget.mangaDetails.score} / 10",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: context.lowValue),
            Text(
              "Popularity: ${widget.mangaDetails.popularity}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
      ],
    );
  }

  Text _mangaSynopsis(BuildContext context) {
    return Text(
      widget.mangaDetails.synopsis ?? "",
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
