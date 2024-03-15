import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animeList_app/data/models/anime_item_model.dart';
import 'package:kraken_animeList_app/data/repositories/anime_respository.dart';

part 'anime_state.dart';

class AnimeCubit extends Cubit<AnimeListState> {
  AnimeCubit(this.repository) : super(AnimeListInitial());

  int page = 1;
  final AnimeRepository repository;

  void loadAnimeList() {
    if (state is AnimeListLoading) return;

    final currentState = state;

    var oldAnimeList = <AnimeItemModel>[];
    if (currentState is AnimeListLoaded) {
      oldAnimeList = currentState.animeList;
    }

    emit(AnimeListLoading(oldAnimeList, isFirstFetch: page == 1));

    repository.fetchAnimeList(page).then((newAnimeList) {
      page++;

      final animeList = (state as AnimeListLoading).oldAnimeList;
      animeList.addAll(newAnimeList);

      emit(AnimeListLoaded(animeList));
    });
  }
}
