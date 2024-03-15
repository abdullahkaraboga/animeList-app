import 'package:kraken_animeList_app/data/services/anime_detail_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AnimeDetailService', () {
    test('fetchAnimeDetailData returns AnimeDetailModel on success', () async {
      const animeId = "1";

      final animeDetail =
          await AnimeDetailService.fetchAnimeDetailData(animeId);

      expect(animeDetail.id, isNotNull);
      expect(animeDetail.title, isNotNull);
    });

    test('fetchAnimeDetailData throws exception on failure', () async {
      const invalidAnimeId = "-1";

      expect(
          () async =>
              await AnimeDetailService.fetchAnimeDetailData(invalidAnimeId),
          throwsException);
    });
  });
}