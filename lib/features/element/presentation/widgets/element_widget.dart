import 'package:animezone/core/models/app_theme.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/background.dart';
import 'package:animezone/core/widgets/error.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/pages/element_details.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/manga.dart';
import '../../domain/models/anime.dart';
import '../../domain/models/element.dart' as elem;

import '../../../../config/styles/styles.dart';
import '../../../../core/widgets/loading_widget.dart';

class ElementWidget1 extends ConsumerStatefulWidget {
  final elem.Element? element;
  final int? id;
  final ElementType? elementType;
  const ElementWidget1({super.key, this.element, this.id, this.elementType});

  @override
  ConsumerState<ElementWidget1> createState() => _ElementWidget1State();
}

class _ElementWidget1State extends ConsumerState<ElementWidget1> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);

    return Container(
      margin: const EdgeInsets.all(8.0),
      width: screenSize.width * .4,
      child: widget.element == null
          ? ref
              .watch(elementProvider(
                  id: widget.id!, elementType: widget.elementType!))
              .when(
                data: (data) =>
                    _buildContent(data, screenSize: screenSize, theme: theme),
                error: (error, stackTrace) => const Error1(),
                loading: () => const LoadingWidget(
                  color: primaryColor,
                ),
              )
          : _buildContent(widget.element!, screenSize: screenSize, theme: theme),
    );
  }

  Widget _buildContent(elem.Element element,
          {required Size screenSize, required AppTheme theme}) =>
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ElementDetails(
              element: element,
              elementType: element is Anime
                  ? ElementType.anime
                  : ElementType.manga,
            ),
          ));
        },
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: theme.foregroundColor),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const Background(),
                    CachedNetworkImage(
                      imageUrl: element.image.largeImageUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const LoadingWidget(),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [primaryColor, accentColor])),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          element.type!.toUpperCase(),
                          style: outfitStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        child: AutoSizeText(
                      element.titles.first['title'] ?? '',
                      maxLines: 2,
                      style: outfitStyle.copyWith(
                          fontSize: 14.0,
                          color: theme.titleTextColor,
                          fontWeight: FontWeight.w500),
                    )),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Score',
                          style: outfitStyle.copyWith(
                              color: theme.textColor,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: primaryColor,
                          ),
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 8.0),
                          child: Row(
                            children: [
                              Text(
                                (element.score ?? '-').toString(),
                                style:outfitStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0),
                              ),
                              const SizedBox(
                                width: 3.0,
                              ),
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.white,
                                size: 14.0,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      switch (element) {
                        Anime anime =>
                          '${anime.episodes != null ? '${anime.episodes} Eps • ' : ''}${anime.status}',
                        Manga manga =>
                          '${manga.volumes != null ? '${manga.volumes} Volumes • ' : ''}${manga.status}',
                        _ => ''
                      },
                      style: outfitStyle.copyWith(
                          color: theme.textColor,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}

class ElementWidget2 extends ConsumerStatefulWidget {
  final elem.Element? element;
  final int? id;
  final ElementType? elementType;
  const ElementWidget2({super.key, this.element, this.id, this.elementType});

  @override
  ConsumerState<ElementWidget2> createState() => _ElementWidget2State();
}

class _ElementWidget2State extends ConsumerState<ElementWidget2> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: screenSize.height * .2,
      child:widget.element == null
          ? ref
          .watch(elementProvider(
          id: widget.id!, elementType: widget.elementType!))
          .when(
        data: (data) =>
            _buildContent(data, screenSize: screenSize, theme: theme),
        error: (error, stackTrace) =>const Error1(),
        loading: () => const LoadingWidget(
          color: primaryColor,
        ),
      )
          : _buildContent(widget.element!, screenSize: screenSize, theme: theme),
    );
  }

  Widget _buildContent(elem.Element element, {required Size screenSize , required AppTheme theme }) =>  GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ElementDetails(
          element: element,
          elementType:
          element is Anime ? ElementType.anime : ElementType.manga,
        ),
      ));
    },
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: theme.foregroundColor),
            child: Stack(
              fit: StackFit.expand,
              children: [
                const Background(),
                CachedNetworkImage(
                  imageUrl: element.image.largeImageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const LoadingWidget(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: AutoSizeText(
                      element.titles.first['title'] ?? '',
                      maxLines: 2,
                      style: outfitStyle.copyWith(
                          fontSize: 16.0,
                          color: theme.titleTextColor,
                          fontWeight: FontWeight.w800),
                    )),
                const SizedBox(
                  height: 2.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Score',
                      style: outfitStyle.copyWith(
                          color: primaryColor, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: primaryColor,
                      ),
                      padding:
                      const EdgeInsets.only(left: 12.0, right: 8.0),
                      child: Row(
                        children: [
                          Text(
                            (element.score ?? '-').toString(),
                            style: outfitStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                          ),
                          const SizedBox(
                            width: 3.0,
                          ),
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.white,
                            size: 14.0,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: [
                    Text(
                      'Genres',
                      style: outfitStyle.copyWith(
                          color: primaryColor, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Expanded(
                      child: AutoSizeText(
                        element.genres
                            .take(2)
                            .map(
                              (e) => e['name'],
                        )
                            .toList()
                            .join(', '),
                        maxLines: 1,
                        textAlign: TextAlign.right,
                        style: outfitStyle.copyWith(
                            color: theme.textColor,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Members',
                      style: outfitStyle.copyWith(
                          color: primaryColor, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '${element.members}',
                      style: outfitStyle.copyWith(
                          color: theme.textColor,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  switch (widget.element) {
                    Anime anime =>
                    '${anime.episodes != null ? '${anime.episodes} Eps • ' : ''}${anime.status}',
                    Manga manga =>
                    '${manga.volumes != null ? '${manga.volumes} Volumes • ' : ''}${manga.status}',
                    _ => ''
                  },
                  style: outfitStyle.copyWith(
                      color: theme.textColor, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
