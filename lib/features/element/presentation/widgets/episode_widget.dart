import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/pages/element_details.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/styles/styles.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/models/episode.dart';

class EpisodeWidget1 extends ConsumerWidget {
  final Episode episode;
  const EpisodeWidget1({super.key, required this.episode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => ElementDetails(id: episode.animeData!['mal_id'] as int, elementType: ElementType.anime,),));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        height: screenSize.height * .115,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: theme.foregroundColor,
                    boxShadow: [
                      BoxShadow(
                          color: primaryColor.withOpacity(.2), blurRadius: 4.0)
                    ]),
                child: CachedNetworkImage(
                  imageUrl: episode.image!.imageUrl!,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const LoadingWidget(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          episode.animeData!['title'].toString(),
                          maxLines: 3,
                          style: montserratStyle.copyWith(
                              fontSize: 14.0,
                              color: theme.titleTextColor,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        AutoSizeText(
                          'Episode ${episode.malId}, ${episode.title}',
                          maxLines: 2,
                          style: outfitStyle.copyWith(
                              fontSize: 10.0, color: theme.textColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (episode.duration != null)
                          Row(children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: theme.hintTextColor,
                              size: 12.0,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              episode.duration == null
                                  ? '-'
                                  : '${((episode.duration ?? 0) / 60).ceil()} Minutes',
                              style: outfitStyle.copyWith(
                                color: theme.hintTextColor,
                                fontSize: 10.0,
                              ),
                            ),
                          ]),
                        Row(
                          children: [
                            if (episode.filler ?? false) ...[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2.0),
                                child: Text(
                                  'FILLER',
                                  style: montserratStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 8.0),
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                            ],
                            if (episode.recap ?? false)
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2.0),
                                child: Text(
                                  'RECAP',
                                  style: montserratStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 10.0),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String covertDuration(int duration) =>
      '${(duration / 60).ceil()}:${duration % 60}';
}

class EpisodeWidget2 extends ConsumerWidget {
  final Episode episode;
  const EpisodeWidget2({super.key, required this.episode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: screenSize.width,
      child: Row(
        children: [
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                episode.malId.toString(),
                style: reggaeStyle.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.0),
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            flex: 5,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: theme.foregroundColor,
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 4.0)
                  ]),
              child: episode.image == null
                  ? Container(
                      color: primaryColor,
                      child: AspectRatio(
                        aspectRatio: 1.6,
                        child: Center(
                          child: Transform.scale(
                            scale: .5,
                            child: Image.asset(
                              'assets/icons/anime.png',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  : AspectRatio(
                      aspectRatio: 1.6,
                      child: CachedNetworkImage(
                        imageUrl: episode.image?.imageUrl ?? '',
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const LoadingWidget(
                          color: primaryColor,
                        ),
                      ),
                    ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    episode.title,
                    style: outfitStyle.copyWith(
                        fontSize: 10.0,
                        color: theme.titleTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                  if (episode.romanjiTitle != null)
                    Text(
                      '${episode.romanjiTitle}',
                      style: outfitStyle.copyWith(
                          fontSize: 10.0, color: theme.textColor,),
                    ),
                  if (episode.japaneseTitle != null)
                    Text(
                      '(${episode.japaneseTitle})',
                      style: reggaeStyle.copyWith(
                          fontSize: 10.0, color: theme.textColor,),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            // child: AutoSizeText(
            //
            //   DateFormat.yMMMEd().format(DateTime.tryParse(episode.aired??'')!).toString(),
            //   style: outfitStyle.copyWith(
            //     color: Colors.black38
            //   ),
            // ),
            child: Center(
              child: AutoSizeText(
                (episode.score ?? 0).toString(),
                style: outfitStyle.copyWith(
                  color:
                      (episode.score ?? 0) > 2.0 && (episode.score ?? 0) < 3.0
                          ? Colors.amber
                          : (episode.score ?? 0) > 3.0
                              ? Colors.green
                              : Colors.redAccent,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
        ],
      ),
    );
  }

  String covertDuration(int duration) =>
      '${(duration / 60).ceil()}:${duration % 60}';
}
