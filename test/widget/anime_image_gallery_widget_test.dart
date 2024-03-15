import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kraken_animeList_app/data/models/anime_detail_model.dart';
import 'package:kraken_animeList_app/presentation/detail/widgets/anime_image_galery_widget.dart';

void main() {
  testWidgets('AnimeImageGalleryWidget Test', (WidgetTester tester) async {
    // Create a sample AnimeDetailModel
    final animeDetailModel = AnimeDetailModel(
      pictures: [
        Picture(large: 'image_url_here'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: AnimeImageGalleryWidget(animeDetailModel: animeDetailModel),
    ));

    expect(find.text('Image Gallery'), findsOneWidget);

    expect(find.byType(GridView), findsOneWidget);

    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}
