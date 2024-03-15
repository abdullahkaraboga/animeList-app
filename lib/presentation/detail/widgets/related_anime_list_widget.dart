import 'package:flutter/material.dart';
import 'package:kraken_animeList_app/data/models/anime_detail_model.dart';
import 'package:cached_network_image/cached_network_image.dart';


class RelatedAnimeListWidget extends StatelessWidget {
  final AnimeDetailModel animeDetailModel;

  const RelatedAnimeListWidget({super.key, required this.animeDetailModel});

  @override
  Widget build(BuildContext context) {
    return animeDetailModel.relatedAnime!.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Related Anime",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: animeDetailModel.relatedAnime!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 120,
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                height: 150,
                                imageUrl : animeDetailModel.relatedAnime![index].node!
                                    .mainPicture!.medium!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              animeDetailModel
                                  .relatedAnime![index].node!.title!,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          );
  }
}
