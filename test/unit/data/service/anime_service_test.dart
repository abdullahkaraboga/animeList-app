import 'package:kraken_animeList_app/data/services/anime_home_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AnimeService', () {
    test('fetchAnimeList returns list of Anime on success', () async {
      final service = AnimeService();
      const expectedAnimeCount = 10;
      const page = 1;

      final animeList = await service.fetchAnimeList(page);

      expect(animeList.length, expectedAnimeCount);
    });

    test('fetchAnimeList throws exception on failure', () async {
      final service = AnimeService();
      const page = -1;
      expect(() async => await service.fetchAnimeList(page), throwsException);

    });
  });
}
