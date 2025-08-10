import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SafeCachedImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? placeholder;
  final Widget Function(BuildContext context, ImageProvider imageProivder)? imageBuilder;
  final Widget? errorWidget;

  const SafeCachedImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.imageBuilder,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return errorWidget ?? const SizedBox();
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: fit,
      width: width,
      height: height,
      imageBuilder: imageBuilder,
      placeholder: (_, __) => placeholder ?? const CircularProgressIndicator(),
      errorWidget: (_, __, ___) => errorWidget ?? const SizedBox(),
    );
  }
}