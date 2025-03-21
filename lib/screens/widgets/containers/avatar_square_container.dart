import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sound_mp3/configs/colors.dart';

class AvatarSquareContainer extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;
  final bool hasShadow;
  final double borderRadius;
  final Color color;
  const AvatarSquareContainer({
    super.key,
    this.width = 150,
    this.height = 150,
    required this.imageUrl,
    this.hasShadow = false,
    this.borderRadius = 12,
    this.color = AppColors.neutralWhite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 4,
                ),
              ]
            : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          // placeholder: (context, url) => const LoadingContainer(),
          errorWidget: (context, url, error) =>
              Image.asset("assets/music_note_image.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
