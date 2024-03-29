import 'package:kraken_animeList_app/config/app_config.dart';
import 'package:kraken_animeList_app/data/models/anime_detail_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AnimeDetailService {
  static Future<AnimeDetailModel> fetchAnimeDetailData(String id) async {
    final response = await http.get(
        Uri.parse(
            "https://api.myanimelist.net/v2/anime/$id?fields=id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,nsfw,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,broadcast,source,average_episode_duration,rating,pictures,background,related_anime,related_manga,recommendations,studios,statistics"),
        headers: {
          'X-MAL-CLIENT-ID': clientID,
        });
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return AnimeDetailModel.fromJson(data);
    } else {
      throw Exception('Failed to load anime detail');
    }
  }
}