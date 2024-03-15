import 'package:kraken_animeList_app/data/models/anime_item_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AnimeRankingResponse', () {
    test('fromJson creates AnimeRankingResponse object from JSON', () {
      // Arrange
      final json = {
        "data": [
          {
            "node": {
              "id": 1,
              "title": "Naruto",
              "main_picture": {"medium": "naruto_medium.jpg", "large": "naruto_large.jpg"}
            },
            "ranking": {"rank": 1}
          }
        ],
        "paging": {"previous": null, "next": "https://api.example.com/next-page"}
      };

      final animeRankingResponse = AnimeRankingResponse.fromJson(json);
      expect(animeRankingResponse.animeList.length, 1);
      expect(animeRankingResponse.previousPageUrl, isNull);
      expect(animeRankingResponse.nextPageUrl, "https://api.example.com/next-page");
      // Add more assertions to check other properties of AnimeRankingResponse if needed
    });
  });
}
