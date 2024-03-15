import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kraken_animeList_app/data/models/anime_item_model.dart';
import 'package:kraken_animeList_app/presentation/detail/anime_detail_screen.dart';
import 'package:kraken_animeList_app/presentation/home/widgets/anime_circle_image_widget.dart';
import 'package:kraken_animeList_app/presentation/home/widgets/anime_title_text_widget.dart';
import 'package:kraken_animeList_app/presentation/home/widgets/anime_id_text_widget.dart';
import 'package:kraken_animeList_app/presentation/home/widgets/anime_rank_text_widget.dart';

class AnimeListItem extends StatelessWidget {
  final int itemIndex;
  final List<AnimeItemModel> animeList;

  const AnimeListItem(
      {super.key, required this.itemIndex, required this.animeList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => AnimeDetailScreen(
                  animeId: animeList[itemIndex].id.toString()),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimeCircleImageWidget(
              imagePath: animeList[itemIndex].mediumPictureUrl,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width - 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimeTitleTextWidget(title: animeList[itemIndex].title),
                  AnimeIDTextWidget(animeID: animeList[itemIndex].id),
                  AnimeRankTextWidget(
                    rankValue: animeList[itemIndex].rank,
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}