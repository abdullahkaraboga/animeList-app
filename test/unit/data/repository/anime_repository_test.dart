import 'package:kraken_animeList_app/data/models/anime_item_model.dart';
import 'package:kraken_animeList_app/data/repositories/anime_respository.dart';
import 'package:kraken_animeList_app/data/services/anime_home_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAnimeService extends Mock implements AnimeService {}

void main() {
  group('AnimeRepository', () {
    test('fetchAnimePosts returns List<Anime> on success', () async {
      final mockService = MockAnimeService();
      final repository = AnimeRepository(mockService);
      const page = 3;
      final List<AnimeItemModel> expectedAnimeList = [
        AnimeItemModel(
          id: 1,
          title: 'Naruto',
          mediumPictureUrl: 'naruto_medium.jpg',
          largePictureUrl: 'naruto_large.jpg',
          rank: 1,
        ),
      ];

      when(mockService.fetchAnimeList(1))
          .thenAnswer((_) async => expectedAnimeList);

      final animeList = await repository.fetchAnimeList(page);

      expect(animeList, expectedAnimeList);
    });
  });
}
