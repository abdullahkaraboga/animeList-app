import 'package:flutter/material.dart';
import 'package:kraken_animeList_app/data/models/anime_detail_model.dart';
import 'package:cached_network_image/cached_network_image.dart';


class AnimeImageGalleryWidget extends StatelessWidget {
  const AnimeImageGalleryWidget({
    super.key,
    required this.animeDetailModel,
  });

  final AnimeDetailModel animeDetailModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16) +
          const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Image Gallery',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          GridView.builder(
            itemCount: animeDetailModel.pictures!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 9 / 16,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl : animeDetailModel.pictures![index].large!,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}