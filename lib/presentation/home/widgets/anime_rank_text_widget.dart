import 'package:flutter/material.dart';

class AnimeRankTextWidget extends StatelessWidget {
  const AnimeRankTextWidget({
    super.key, required this.rankValue,
  });

  final int rankValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text("Rank : $rankValue",
          style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.w500)),
    );
  }
}