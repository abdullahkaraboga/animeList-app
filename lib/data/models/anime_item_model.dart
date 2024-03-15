class AnimeItemModel {
  final int id;
  final String title;
  final String mediumPictureUrl;
  final String largePictureUrl;
  final int rank;

  AnimeItemModel({
    required this.id,
    required this.title,
    required this.mediumPictureUrl,
    required this.largePictureUrl,
    required this.rank,
  });

  factory AnimeItemModel.fromJson(Map<String, dynamic> json) {
    return AnimeItemModel(
      id: json['node']['id'],
      title: json['node']['title'],
      mediumPictureUrl: json['node']['main_picture']['medium'],
      largePictureUrl: json['node']['main_picture']['large'],
      rank: json['ranking']['rank'],
    );
  }
}

class AnimeRankingResponse {
  final List<AnimeItemModel> animeList;
  final String? previousPageUrl;
  final String? nextPageUrl;

  AnimeRankingResponse({
    required this.animeList,
    this.previousPageUrl,
    this.nextPageUrl,
  });

  factory AnimeRankingResponse.fromJson(Map<String, dynamic> json) {
    List<AnimeItemModel> animeList = (json['data'] as List)
        .map((animeData) => AnimeItemModel.fromJson(animeData))
        .toList();

    return AnimeRankingResponse(
      animeList: animeList,
      previousPageUrl: json['paging']['previous'],
      nextPageUrl: json['paging']['next'],
    );
  }
}
