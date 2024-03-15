import 'package:flutter/material.dart';

class AnimeIDTextWidget extends StatelessWidget {
  const AnimeIDTextWidget({
    super.key,
    required this.animeID,
  });

  final int animeID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        "ID : $animeID",
        style: const TextStyle(
            fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}