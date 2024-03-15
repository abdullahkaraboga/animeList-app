import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kraken_animeList_app/data/models/anime_detail_model.dart';
import 'package:kraken_animeList_app/presentation/detail/widgets/recommended_anime_widget.dart';

void main() {
  testWidgets('RecommendedAnimeWidget Test', (WidgetTester tester) async {
    final animeDetailModel = AnimeDetailModel(
      recommendations: [
        Recommendation(node: Node(title: 'Anime Title', mainPicture: Picture(medium: 'image_url_here')))
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: RecommendedAnimeWidget(animeDetailModel: animeDetailModel),
    ));

    expect(find.text('Recommendations'), findsOneWidget);

    expect(find.byType(ListView), findsOneWidget);

    expect(find.byType(CachedNetworkImage), findsOneWidget);

  });
}
