import 'package:kraken_animeList_app/data/models/anime_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AnimeDetailModel', () {
    test('fromJson creates AnimeDetailModel object from JSON', () {
      final json = {
        "id": 1,
        "title": "Naruto",
        "main_picture": {"medium": "naruto_medium.jpg", "large": "naruto_large.jpg"},
      };

      final animeDetailModel = AnimeDetailModel.fromJson(json);
      expect(animeDetailModel.id, 1);
      expect(animeDetailModel.title, "Naruto");
      expect(animeDetailModel.mainPicture?.medium, "naruto_medium.jpg");
      expect(animeDetailModel.mainPicture?.large, "naruto_large.jpg");
    });
  });
}
