
import 'package:kraken_animeList_app/data/models/anime_item_model.dart';
import 'package:kraken_animeList_app/data/services/anime_home_service.dart';

class AnimeRepository {

  final AnimeService service;

  AnimeRepository(this.service);

  Future<List<AnimeItemModel>> fetchAnimeList(int page) async {
    final service = AnimeService();
    final animeList = await service.fetchAnimeList(page);
    return animeList;
  }

}