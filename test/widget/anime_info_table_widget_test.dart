import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_animeList_app/data/models/anime_detail_model.dart';
import 'package:kraken_animeList_app/presentation/detail/widgets/anime_info_table_widget.dart';
import 'package:kraken_animeList_app/presentation/detail/widgets/anime_info_text_widget.dart';

void main() {
  testWidgets('AnimeInfoTable Test', (WidgetTester tester) async {
    // Create a sample AnimeDetailModel
    final animeDetailModel = AnimeDetailModel(
      title: 'Sample Title',
      genres: [Genre(name: 'Action'), Genre(name: 'Adventure')],
      numEpisodes: 12,
      averageEpisodeDuration: 25,
      synopsis: 'Sample Synopsis',
      rating: '8.5',
      alternativeTitles: AlternativeTitles(en: 'Sample Alternative Title'),
    );

    await tester.pumpWidget(MaterialApp(
      home: AnimeInfoTable(animeDetailModel: animeDetailModel),
    ));

    expect(find.text('Anime Info'), findsOneWidget);

    expect(find.byType(AnimeInfoText), findsNWidgets(8));
  });
}
