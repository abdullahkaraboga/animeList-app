// To parse this JSON data, do
//
//     final animeDetailModel = animeDetailModelFromJson(jsonString);

import 'dart:convert';

AnimeDetailModel animeDetailModelFromJson(String str) => AnimeDetailModel.fromJson(json.decode(str));

String animeDetailModelToJson(AnimeDetailModel data) => json.encode(data.toJson());

class AnimeDetailModel {
  int? id;
  String? title;
  Picture? mainPicture;
  AlternativeTitles? alternativeTitles;
  DateTime? startDate;
  DateTime? endDate;
  String? synopsis;
  double? mean;
  int? rank;
  int? popularity;
  int? numListUsers;
  int? numScoringUsers;
  String? nsfw;
  String? createdAt;
  String? updatedAt;
  String? mediaType;
  String? status;
  List<Genre>? genres;
  int? numEpisodes;
  StartSeason? startSeason;
  Broadcast? broadcast;
  String? source;
  int? averageEpisodeDuration;
  String? rating;
  List<Picture>? pictures;
  String? background;
  List<RelatedAnime>? relatedAnime;
  List<dynamic>? relatedManga;
  List<Recommendation>? recommendations;
  List<Genre>? studios;

  AnimeDetailModel({
    this.id,
    this.title,
    this.mainPicture,
    this.alternativeTitles,
    this.startDate,
    this.endDate,
    this.synopsis,
    this.mean,
    this.rank,
    this.popularity,
    this.numListUsers,
    this.numScoringUsers,
    this.nsfw,
    this.createdAt,
    this.updatedAt,
    this.mediaType,
    this.status,
    this.genres,
    this.numEpisodes,
    this.startSeason,
    this.broadcast,
    this.source,
    this.averageEpisodeDuration,
    this.rating,
    this.pictures,
    this.background,
    this.relatedAnime,
    this.relatedManga,
    this.recommendations,
    this.studios,
  });

  factory AnimeDetailModel.fromJson(Map<String, dynamic> json) => AnimeDetailModel(
    id: json["id"],
    title: json["title"],
    mainPicture: json["main_picture"] == null ? null : Picture.fromJson(json["main_picture"]),
    alternativeTitles: json["alternative_titles"] == null ? null : AlternativeTitles.fromJson(json["alternative_titles"]),
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    synopsis: json["synopsis"],
    mean: json["mean"]?.toDouble(),
    rank: json["rank"],
    popularity: json["popularity"],
    numListUsers: json["num_list_users"],
    numScoringUsers: json["num_scoring_users"],
    nsfw: json["nsfw"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    mediaType: json["media_type"],
    status: json["status"],
    genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
    numEpisodes: json["num_episodes"],
    startSeason: json["start_season"] == null ? null : StartSeason.fromJson(json["start_season"]),
    broadcast: json["broadcast"] == null ? null : Broadcast.fromJson(json["broadcast"]),
    source: json["source"],
    averageEpisodeDuration: json["average_episode_duration"],
    rating: json["rating"],
    pictures: json["pictures"] == null ? [] : List<Picture>.from(json["pictures"]!.map((x) => Picture.fromJson(x))),
    background: json["background"],
    relatedAnime: json["related_anime"] == null ? [] : List<RelatedAnime>.from(json["related_anime"]!.map((x) => RelatedAnime.fromJson(x))),
    relatedManga: json["related_manga"] == null ? [] : List<dynamic>.from(json["related_manga"]!.map((x) => x)),
    recommendations: json["recommendations"] == null ? [] : List<Recommendation>.from(json["recommendations"]!.map((x) => Recommendation.fromJson(x))),
    studios: json["studios"] == null ? [] : List<Genre>.from(json["studios"]!.map((x) => Genre.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "main_picture": mainPicture?.toJson(),
    "alternative_titles": alternativeTitles?.toJson(),
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "synopsis": synopsis,
    "mean": mean,
    "rank": rank,
    "popularity": popularity,
    "num_list_users": numListUsers,
    "num_scoring_users": numScoringUsers,
    "nsfw": nsfw,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "media_type": mediaType,
    "status": status,
    "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
    "num_episodes": numEpisodes,
    "start_season": startSeason?.toJson(),
    "broadcast": broadcast?.toJson(),
    "source": source,
    "average_episode_duration": averageEpisodeDuration,
    "rating": rating,
    "pictures": pictures == null ? [] : List<dynamic>.from(pictures!.map((x) => x.toJson())),
    "background": background,
    "related_anime": relatedAnime == null ? [] : List<dynamic>.from(relatedAnime!.map((x) => x.toJson())),
    "related_manga": relatedManga == null ? [] : List<dynamic>.from(relatedManga!.map((x) => x)),
    "recommendations": recommendations == null ? [] : List<dynamic>.from(recommendations!.map((x) => x.toJson())),
    "studios": studios == null ? [] : List<dynamic>.from(studios!.map((x) => x.toJson())),
  };
}

class AlternativeTitles {
  List<String>? synonyms;
  String? en;
  String? ja;

  AlternativeTitles({
    this.synonyms,
    this.en,
    this.ja,
  });

  factory AlternativeTitles.fromJson(Map<String, dynamic> json) => AlternativeTitles(
    synonyms: json["synonyms"] == null ? [] : List<String>.from(json["synonyms"]!.map((x) => x)),
    en: json["en"],
    ja: json["ja"],
  );

  Map<String, dynamic> toJson() => {
    "synonyms": synonyms == null ? [] : List<dynamic>.from(synonyms!.map((x) => x)),
    "en": en,
    "ja": ja,
  };
}

class Broadcast {
  String? dayOfTheWeek;
  String? startTime;

  Broadcast({
    this.dayOfTheWeek,
    this.startTime,
  });

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
    dayOfTheWeek: json["day_of_the_week"],
    startTime: json["start_time"],
  );

  Map<String, dynamic> toJson() => {
    "day_of_the_week": dayOfTheWeek,
    "start_time": startTime,
  };
}

class Genre {
  int? id;
  String? name;

  Genre({
    this.id,
    this.name,
  });

  @override
  String toString() {
    return name!;
  }

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Picture {
  String? medium;
  String? large;

  Picture({
    this.medium,
    this.large,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "medium": medium,
    "large": large,
  };
}

class Recommendation {
  Node? node;
  int? numRecommendations;

  Recommendation({
    this.node,
    this.numRecommendations,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
    node: json["node"] == null ? null : Node.fromJson(json["node"]),
    numRecommendations: json["num_recommendations"],
  );

  Map<String, dynamic> toJson() => {
    "node": node?.toJson(),
    "num_recommendations": numRecommendations,
  };
}

class Node {
  int? id;
  String? title;
  Picture? mainPicture;

  Node({
    this.id,
    this.title,
    this.mainPicture,
  });

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    id: json["id"],
    title: json["title"],
    mainPicture: json["main_picture"] == null ? null : Picture.fromJson(json["main_picture"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "main_picture": mainPicture?.toJson(),
  };
}

class RelatedAnime {
  Node? node;
  String? relationType;
  String? relationTypeFormatted;

  RelatedAnime({
    this.node,
    this.relationType,
    this.relationTypeFormatted,
  });

  factory RelatedAnime.fromJson(Map<String, dynamic> json) => RelatedAnime(
    node: json["node"] == null ? null : Node.fromJson(json["node"]),
    relationType: json["relation_type"],
    relationTypeFormatted: json["relation_type_formatted"],
  );

  Map<String, dynamic> toJson() => {
    "node": node?.toJson(),
    "relation_type": relationType,
    "relation_type_formatted": relationTypeFormatted,
  };
}

class StartSeason {
  int? year;
  String? season;

  StartSeason({
    this.year,
    this.season,
  });

  factory StartSeason.fromJson(Map<String, dynamic> json) => StartSeason(
    year: json["year"],
    season: json["season"],
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "season": season,
  };
}
