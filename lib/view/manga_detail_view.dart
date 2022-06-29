import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_app/cubit/manga_detail/manga_detail_cubit.dart';

class MangaDetailView extends StatefulWidget {
  final int? mangaId;
  const MangaDetailView({Key? key, required this.mangaId}) : super(key: key);

  @override
  State<MangaDetailView> createState() => _MangaDetailViewState();
}

class _MangaDetailViewState extends State<MangaDetailView> {
  @override
  void initState() {
    context.read<MangaDetailCubit>().fetchTopManga(widget.mangaId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mangaId.toString()),
      ),
    );
  }
}
