import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animeList_app/bloc/anime_flutter_bloc.dart';
import 'package:kraken_animeList_app/data/models/anime_item_model.dart';
import 'package:kraken_animeList_app/presentation/home/widgets/animeListItemWidget.dart';

class AnimeBlocHomeScreen extends StatelessWidget {
  final scrollController = ScrollController();

  AnimeBlocHomeScreen({super.key});

  void scrollControllerListener(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<AnimeFlutterBloc>(context).add(LoadAnimeItemEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    scrollControllerListener(context);
    BlocProvider.of<AnimeFlutterBloc>(context).add(LoadAnimeItemEvent());
    List<AnimeItemModel> animeItems = [];
    bool isLoading = false;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kraken AnimeList App"),
          centerTitle: true,
        ),
        body: BlocBuilder<AnimeFlutterBloc, AnimeFlutterState>(
          builder: (context, state) {
            if (state is AnimeFlutterStateLoading && state.isFirstFetch) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AnimeFlutterStateLoading) {
              animeItems = state.oldAnimeList;
              isLoading = true;
            } else if (state is AnimeFlutterStateLoaded) {
              animeItems = state.animeList;
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      if (index < animeItems.length) {
                        return AnimeListItem(
                            itemIndex: index, animeList: animeItems);
                      } else {
                        Timer(const Duration(milliseconds: 30), () {
                          scrollController.jumpTo(
                              scrollController.position.maxScrollExtent);
                        });
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey[400],
                        thickness: .5,
                      );
                    },
                    itemCount: animeItems.length + (isLoading ? 1 : 0),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
