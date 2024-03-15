// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kraken_animeList_app/data/models/anime_detail_model.dart';
import 'package:kraken_animeList_app/extension/date_time_extension.dart';
import 'package:kraken_animeList_app/presentation/detail/widgets/anime_info_text_widget.dart';

class AnimeInfoTable extends StatelessWidget {
  final AnimeDetailModel animeDetailModel;

  const AnimeInfoTable({super.key, required this.animeDetailModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: const Text(
              "Anime Info",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          AnimeInfoText(
              label: 'Title: ',
              info:
              animeDetailModel.title ?? "-"),
          AnimeInfoText(
              label: 'Genres: ',
              info: animeDetailModel.genres?.map((genre) => genre.toString()).join(', ') ?? ''),
          AnimeInfoText(
              label: 'Episodes: ',
              info: animeDetailModel.numEpisodes.toString()),
          AnimeInfoText(
            label: 'Average Episode Duration: ',
            info: animeDetailModel.averageEpisodeDuration!
                .timeToMinute(),
          ),
          AnimeInfoText(
              label: 'Synopsis: ',
              info: animeDetailModel.synopsis.toString()),
          AnimeInfoText(
              label: 'NumEpisodes: ',
              info: animeDetailModel.numEpisodes.toString()),
          AnimeInfoText(
              label: 'Rating: ',
              info: animeDetailModel.rating.toString()),
          AnimeInfoText(
              label: 'Other Names: ',
              info: animeDetailModel.alternativeTitles!.en!),
        ],
      ),
    );
  }
}