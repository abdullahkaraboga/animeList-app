import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animeList_app/data/models/anime_item_model.dart';
import 'package:kraken_animeList_app/data/repositories/anime_respository.dart';

part 'anime_flutter_event.dart';
part 'anime_flutter_state.dart';

class AnimeFlutterBloc extends Bloc<AnimeFlutterEvent, AnimeFlutterState> {
  AnimeFlutterBloc({required this.repository}) : super(AnimeFlutterInitial()) {
    on<LoadAnimeItemEvent>(
      (event, emit) async{
        if (state is AnimeFlutterStateLoading) return;

        final currentState = state;

        var firstAnimeList = <AnimeItemModel>[];
        if (currentState is AnimeFlutterStateLoaded) {
          firstAnimeList = currentState.animeList;
        }

        emit(AnimeFlutterStateLoading(firstAnimeList, isFirstFetch: page == 1));

       await repository.fetchAnimeList(page).then((newAnimeList) {
          page++;

          final animeList = (state as AnimeFlutterStateLoading).oldAnimeList;
          animeList.addAll(newAnimeList);

          emit(AnimeFlutterStateLoaded(animeList));
        });
      },
    );
  }

  int page = 1;
  final AnimeRepository repository;
}
