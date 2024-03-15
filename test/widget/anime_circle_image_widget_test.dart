import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kraken_animeList_app/presentation/home/widgets/anime_circle_image_widget.dart';


void main() {
  testWidgets('AnimeCircleImageWidget Test', (WidgetTester tester) async {
    // Mock image path
    final String imagePath = 'https://example.com/image.jpg';

    // Build our widget and trigger a frame
    await tester.pumpWidget(MaterialApp(
      home: AnimeCircleImageWidget(imagePath: imagePath),
    ));

    // Expect to find ClipOval widget
    expect(find.byType(ClipOval), findsOneWidget);

    // Expect to find CachedNetworkImage widget
    expect(find.byType(CachedNetworkImage), findsOneWidget);

    // Expect to find correct image URL
    final cachedNetworkImage = tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
    expect(cachedNetworkImage.imageUrl, imagePath);

    // Expect to find BoxFit.cover
    expect(cachedNetworkImage.fit, BoxFit.cover);

    // Expect to find width and height as 100.0
    expect(cachedNetworkImage.width, 100.0);
    expect(cachedNetworkImage.height, 100.0);
  });
}
