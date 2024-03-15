// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kraken_animeList_app/presentation/home/widgets/anime_id_text_widget.dart';

void main() {
  testWidgets('AnimeIDTextWidget Test', (WidgetTester tester) async {
    const int animeID = 12345;

    await tester.pumpWidget(MaterialApp(
      home: AnimeIDTextWidget(animeID: animeID),
    ));

    expect(find.text('ID : $animeID'), findsOneWidget);

    final textWidget = tester.widget<Text>(find.text('ID : $animeID'));
    expect(textWidget.style!.fontSize, 16.0);
    expect(textWidget.style!.color, Colors.black);
    expect(textWidget.style!.fontWeight, FontWeight.w500);
  });
}
