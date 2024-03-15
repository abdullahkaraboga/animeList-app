import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_animeList_app/presentation/home/widgets/anime_rank_text_widget.dart';

void main() {
  testWidgets('AnimeRankTextWidget Test', (WidgetTester tester) async {
    // Mock rank value
    const int rankValue = 5;

    await tester.pumpWidget(const MaterialApp(
      home: AnimeRankTextWidget(rankValue: rankValue),
    ));

    expect(find.text('Rank : $rankValue'), findsOneWidget);

    final textWidget = tester.widget<Text>(find.text('Rank : $rankValue'));
    expect(textWidget.style!.fontSize, 16.0);
    expect(textWidget.style!.color, Colors.black);
    expect(textWidget.style!.fontWeight, FontWeight.w500);
  });
}
