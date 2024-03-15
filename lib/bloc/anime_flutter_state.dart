part of 'anime_flutter_bloc.dart';

@immutable
abstract class AnimeFlutterState {}

class AnimeFlutterInitial extends AnimeFlutterState {}

class AnimeFlutterStateLoaded extends AnimeFlutterState {
  final List<AnimeItemModel> animeList;

  AnimeFlutterStateLoaded(this.animeList);
}

class AnimeFlutterStateLoading extends AnimeFlutterState {
  final List<AnimeItemModel> oldAnimeList;
  final bool isFirstFetch;

  AnimeFlutterStateLoading(this.oldAnimeList, {this.isFirstFetch = false});
}
