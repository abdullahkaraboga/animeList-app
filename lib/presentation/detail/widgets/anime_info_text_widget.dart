import 'package:flutter/material.dart';

class AnimeInfoText extends StatelessWidget {
  const AnimeInfoText({
    super.key,
    required this.label,
    required this.info,
  });

  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: RichText(
          text: TextSpan(
            text: "$label ",
            style: const TextStyle(
              letterSpacing: 0.5,
                fontSize: 18, color: Colors.red, fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                text: info,
                style: TextStyle(
                    letterSpacing: 0.2,
                    fontSize: 18,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      );
    });
  }
}
