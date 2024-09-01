import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/styles/styles.dart';
import '../providers/providers.dart';
import 'background.dart';
import 'loading_widget.dart';

class FullImageView extends ConsumerWidget {
  final String imageUrl;
  const FullImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(applicationThemeProvider);
    final animation = ModalRoute.of(context)!.animation!;
    return Material(
      child: Stack(
        children: [
          const Background(),
          InteractiveViewer(
            child: Center(
              child: Hero(
                tag: 'image_$imageUrl',
                child:  AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) => Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((1 - animation.value) * 16.0),
                      ),
                    child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>const AspectRatio(
                          aspectRatio: 0.7,
                          child: Stack(
                            children: [
                              Background(),
                              Center(child: LoadingWidget())
                            ],
                          ),
                        ),
                      ),
                  ),
                ),
              )
            ),
          ),
          Positioned(
            top: 32.0,
            child:                GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.foregroundColor,
                  borderRadius: BorderRadius.circular(18.0),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withOpacity(.25),
                      blurRadius: 8.0,
                    )
                  ],
                ),
                margin: const EdgeInsets.only(left: 16.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: primaryColor,
                    size: 22.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }
}
