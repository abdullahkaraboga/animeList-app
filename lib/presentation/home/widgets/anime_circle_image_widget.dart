import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class AnimeCircleImageWidget extends StatelessWidget {
  const AnimeCircleImageWidget({
    super.key, required this.imagePath,

  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.cover,
        width: 100.0,
        height: 100.0,
      ),
    );
  }
}