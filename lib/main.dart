import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animeList_app/bloc/anime_flutter_bloc.dart';
import 'package:kraken_animeList_app/cubit/anime_cubit.dart';
import 'package:kraken_animeList_app/data/repositories/anime_respository.dart';
import 'package:kraken_animeList_app/data/services/anime_home_service.dart';
import 'package:kraken_animeList_app/presentation/home/anime_bloc_home_screen.dart';

void main() {
  runApp(AnimeApp(
    repository: AnimeRepository(AnimeService()),
  ));
}

class AnimeApp extends StatelessWidget {
  final AnimeRepository repository;

  const AnimeApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AnimeCubit(repository),
          ),
          BlocProvider(
            create: (context) => AnimeFlutterBloc(repository: repository),
          ),
        ],
        child: AnimeBlocHomeScreen(),
      ),
    );
  }
}
