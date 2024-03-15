import 'package:kraken_animeList_app/data/models/anime_item_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Anime', () {
    test('fromJson creates Anime object from JSON', () {
      final json = {
        "node": {
          "id": 1,
          "title": "Naruto",
          "main_picture": {
            "medium": "naruto_medium.jpg",
            "large": "naruto_large.jpg"
          }
        },
        "ranking": {"rank": 1}
      };

      final anime = AnimeItemModel.fromJson(json);

      expect(anime.id, 1);
      expect(anime.title, "Naruto");
      expect(anime.mediumPictureUrl, "naruto_medium.jpg");
      expect(anime.largePictureUrl, "naruto_large.jpg");
      expect(anime.rank, 1);
    });
  });
}
