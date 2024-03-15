import 'package:flutter/material.dart';
import 'package:kraken_animeList_app/data/models/anime_detail_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AnimePosterWidget extends StatelessWidget {
  const AnimePosterWidget({
    super.key,
    required this.animeDetailModel,
  });

  final AnimeDetailModel animeDetailModel;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: animeDetailModel.mainPicture!.large!,
      fit: BoxFit.cover,
      height: 400,
      width: double.infinity,
    );
  }
}
