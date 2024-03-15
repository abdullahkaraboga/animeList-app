// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:kraken_animeList_app/data/models/anime_detail_model.dart';
import 'package:kraken_animeList_app/data/services/anime_detail_service.dart';
import 'package:kraken_animeList_app/extension/date_time_extension.dart';
import 'package:kraken_animeList_app/presentation/detail/widgets/anime_image_galery_widget.dart';
import 'package:kraken_animeList_app/presentation/detail/widgets/anime_info_table_widget.dart';
import 'package:kraken_animeList_app/presentation/detail/widgets/anime_info_text_widget.dart';
import 'package:kraken_animeList_app/presentation/detail/widgets/anime_poster_widget.dart';
import 'package:kraken_animeList_app/presentation/detail/widgets/recommended_anime_widget.dart';
import 'package:kraken_animeList_app/presentation/detail/widgets/related_anime_list_widget.dart';

class AnimeDetailScreen extends StatefulWidget {
  final String animeId;

  const AnimeDetailScreen({super.key, required this.animeId});

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  var loading = true;
  late AnimeDetailModel animeDetailModel;
  late String appBarTitle;

  @override
  void initState() {
    appBarTitle = "";
    initAnimeDetail();
    super.initState();
  }

  void initAnimeDetail() async {
    if (!loading) {
      setState(() {
        loading = true;
      });
    }
    var res = await AnimeDetailService.fetchAnimeDetailData(widget.animeId);
    animeDetailModel = res;
    if (!mounted) return;
    setState(() {
      loading = false;
      appBarTitle = animeDetailModel.title ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            appBarTitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        body: loading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: ListView(children: [
                AnimePosterWidget(animeDetailModel: animeDetailModel),
                AnimeInfoTable(animeDetailModel: animeDetailModel),
                AnimeImageGalleryWidget(animeDetailModel: animeDetailModel),
                RelatedAnimeListWidget(animeDetailModel: animeDetailModel),
                RecommendedAnimeWidget(
                  animeDetailModel: animeDetailModel,
                )
              ])));
  }
}
