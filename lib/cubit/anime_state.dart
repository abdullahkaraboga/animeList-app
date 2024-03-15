part of 'anime_cubit.dart';

@immutable
abstract class AnimeListState {}

class AnimeListInitial extends AnimeListState {}

class AnimeListLoaded extends AnimeListState {
  final List<AnimeItemModel> animeList;

  AnimeListLoaded(this.animeList);
}

class AnimeListLoading extends AnimeListState {
  final List<AnimeItemModel> oldAnimeList;
  final bool isFirstFetch;

  AnimeListLoading(this.oldAnimeList, {this.isFirstFetch = false});
}
