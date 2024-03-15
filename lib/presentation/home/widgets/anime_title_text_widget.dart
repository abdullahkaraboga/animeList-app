import 'package:flutter/material.dart';

class AnimeTitleTextWidget extends StatelessWidget {
  const AnimeTitleTextWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}