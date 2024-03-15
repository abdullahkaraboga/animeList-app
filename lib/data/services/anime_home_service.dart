import 'dart:convert';

import 'package:kraken_animeList_app/config/app_config.dart';
import 'package:kraken_animeList_app/data/models/anime_item_model.dart';
import 'package:http/http.dart' as http;

class AnimeService {
  //Number of items to be loaded.
  static const int fetchLimit = 10;

  /*
  all
  airing
  upcoming
  tv
  ova
  movie
  special
  bypopularity
  favorite
  */

  String setURL(int page, fetchLimit) {
    const baseURL = "https://api.myanimelist.net/v2/anime/ranking?";

    //initialURL : https: //api.myanimelist.net/v2/anime/ranking?ranking_type=upcoming&limit=20
    //next : https: //api.myanimelist.net/v2/anime/ranking?offset=20&ranking_type=upcoming&limit=20
    //next : https: //api.myanimelist.net/v2/anime/ranking?offset=40&ranking_type=upcoming&limit=20

    if (page == 1) {
      return "${baseURL}ranking_type=all&limit=$fetchLimit";
    } else {
      return "${baseURL}offset=${fetchLimit * page}&ranking_type=all&limit=$fetchLimit";
    }
  }

  Future<List<AnimeItemModel>> fetchAnimeList(int page) async {
    try {
      final response = await http.get(
        Uri.parse(setURL(page, fetchLimit)),
        headers: {
          'X-MAL-CLIENT-ID': clientID,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        return data.map((json) => AnimeItemModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load anime list');
      }
    } catch (err) {
      throw Exception('Failed to load anime list: $err');
    }
  }
}