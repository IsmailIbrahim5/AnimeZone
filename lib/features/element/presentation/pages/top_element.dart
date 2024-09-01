import 'dart:async';

import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/background.dart';
import 'package:animezone/core/widgets/loading_widget.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/pages/collection_details.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:animezone/features/element/presentation/widgets/element_widget.dart';
import 'package:animezone/features/element/presentation/widgets/episode_widget.dart';
import 'package:animezone/features/element/presentation/widgets/genre_card.dart';
import 'package:animezone/core/widgets/indicator.dart';
import 'package:animezone/features/element/presentation/widgets/recommendation_widget.dart';
import 'package:animezone/features/element/presentation/widgets/review_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../config/styles/styles.dart';
import '../../../../core/widgets/error.dart';
import '../../domain/models/manga.dart';
import '../../domain/models/anime.dart';
import 'element_details.dart';

class TopElementPage extends ConsumerStatefulWidget {
  final ElementType elementType;
  const TopElementPage({super.key, required this.elementType});

  @override
  ConsumerState<TopElementPage> createState() => _TopElementPageState();
}

class _TopElementPageState extends ConsumerState<TopElementPage>  with AutomaticKeepAliveClientMixin<TopElementPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * (6 / 63)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: [
                const SizedBox(height: 16),
                TopAnime(
                  elementType: widget.elementType,
                ),
                if (widget.elementType == ElementType.anime) ...[
                  const SizedBox(height: 24),
                  const SeasonAnime(),
                ],
                if (widget.elementType == ElementType.manga) ...[
                  const SizedBox(height: 24),
                  const MangaCollection(collection: 'manga'),
                  const SizedBox(height: 24),
                  const MangaCollection(collection: 'manhwa'),
                  const SizedBox(height: 24),
                  const MangaCollection(collection: 'lightnovel'),
                ],
                const SizedBox(height: 32),
                GenreBox(
                  elementType: widget.elementType,
                ),
                if (widget.elementType == ElementType.anime) ...[
                  const SizedBox(height: 32),
                  const RecentEpisodes(),
                ],
                const SizedBox(height: 32),
                RecentReviews(
                  elementType: widget.elementType,
                ),
                const SizedBox(height: 32),
                RecentRecommendations(
                  elementType: widget.elementType,
                ),
              ],
            ),
          ),
          Positioned(
            top: - screenSize.height * (7 / 63),
            height:  screenSize.height * (7 / 63),
            left: - screenSize.width / 2,
            right:-  screenSize.width / 2,
            child: Container(
              color: theme.backgroundColor,
            ),
          ),

        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TopAnime extends ConsumerWidget {
  final ElementType elementType;
  const TopAnime({super.key, required this.elementType});

  double getVal(double page, int index) =>
      ((page - index).abs() * 2).clamp(0, 1);

  Future<bool> initializeController() {
    Completer<bool> completer = Completer<bool>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topAnime = ref.watch(topElementProvider(
        filter: elementType == ElementType.anime ? 'airing' : 'publishing',
        limit: 5,
        elementType: elementType));
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);

    final pageController =
        PageController(viewportFraction: .75, initialPage: 1000);
    return Column(
      children: [
        SizedBox(
          height: screenSize.height * .25,
          width: screenSize.width,
          child: topAnime.when(
            data: (data) => PageView.builder(
                controller: pageController,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  final wallpaper = ref.watch(elementWallpaperProvider(
                      title:
                      data.elements[index %  data.elements.length].titles.first['title'] ?? '',
                      id:  data.elements[index %  data.elements.length].malId,
                      elementType: ElementType.anime));
                  return FutureBuilder(
                    future: initializeController(),
                    builder: (context, snapshot) => snapshot.hasData
                        ? AnimatedBuilder(
                            key: ValueKey(
                                'image_${ data.elements[index %  data.elements.length].titles.first['title']}'),
                            animation: pageController,
                            builder: (context, child) => Transform.scale(
                              scale: 1 -
                                  (.15 *
                                      getVal(
                                          pageController.hasClients
                                              ? (pageController.page ?? 0.0)
                                              : 0.0,
                                          index)),
                              child: child,
                            ),
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ElementDetails(
                                  element:  data.elements[index %  data.elements.length],
                                  elementType: ElementType.anime,
                                ),
                              )),
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    color: theme.backgroundColor,
                                    borderRadius: BorderRadius.circular(12.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: accentColor.withOpacity(.2),
                                        blurRadius: 8.0,
                                        spreadRadius: 4.0,
                                      )
                                    ]),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    const Background(),
                                    wallpaper.when(
                                      data: (data) => CachedNetworkImage(
                                        imageUrl: data ?? '',
                                        imageBuilder:
                                            (context, imageProvider) => Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Image(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                            Container(
                                              color: Colors.black12,
                                            ),
                                          ],
                                        ),
                                        placeholder: (context, url) =>
                                            const LoadingWidget(
                                          color: Colors.white,
                                        ),
                                      ),
                                      error: (error, stackTrace) => const Error1(),
                                      loading: () => const LoadingWidget(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black87,
                                                borderRadius:
                                                    BorderRadius.circular(6.0)),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0, horizontal: 8.0),
                                            child: Text(
                                              List.generate(
                                                data.elements[index %  data.elements.length]
                                                    .genres
                                                    .length,
                                                (indexx) =>
                                                data.elements[index %  data.elements.length]
                                                        .genres[indexx]['name'],
                                              )
                                                  .toString()
                                                  .replaceAll('[', '')
                                                  .replaceAll(']', ''),
                                              style: montserratStyle.copyWith(
                                                  fontSize: 6.0,
                                                  color: Colors.white70),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4.0,
                                          ),
                                          Text(
                                            ( data.elements[index %  data.elements.length]
                                                        .titles
                                                        .first['title'] ??
                                                    '')
                                                .toUpperCase(),
                                            style: outfitStyle.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 16.0),
                                          ),
                                          const SizedBox(
                                            height: 4.0,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 1.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      ( data.elements[index %  data.elements.length]
                                                                  .score ??
                                                              '-')
                                                          .toString(),
                                                      style: outfitStyle.copyWith(
                                                          color: Colors.white,
                                                          fontSize: 8.0),
                                                    ),
                                                    const SizedBox(
                                                      width: 3.0,
                                                    ),
                                                    const Icon(
                                                      Icons.star_rounded,
                                                      color: Colors.white,
                                                      size: 10.0,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8.0,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.groups_outlined,
                                                        color: Colors.white60,
                                                        size: 10.0,
                                                      ),
                                                      const SizedBox(
                                                        width: 2.0,
                                                      ),
                                                      Text(
                                                        NumberFormat('#,##,000')
                                                            .format( data.elements[index %
                                                            data.elements.length]
                                                                    .members ??
                                                                '-')
                                                            .toString(),
                                                        style:
                                                            outfitStyle.copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .white60,
                                                                fontSize: 8.0),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 4.0,
                                                  ),
                                                  Container(
                                                    width: 1.0,
                                                    height: 6.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white60,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1.0)),
                                                  ),
                                                  const SizedBox(
                                                    width: 4.0,
                                                  ),
                                                  Text(
                                                    switch( data.elements[index %  data.elements.length]){
                                                      Anime anime => '${anime.episodes ?? '-'} Episodes',
                                                      Manga manga => '${manga.volumes ?? '-'} Volumes',
                                                      _ => ''
                                                    },
                                                    style: outfitStyle.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white60,
                                                        fontSize: 8.0),
                                                  ),
                                                  const SizedBox(
                                                    width: 4.0,
                                                  ),
                                                  Container(
                                                    width: 1.0,
                                                    height: 6.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white60,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1.0)),
                                                  ),
                                                  const SizedBox(
                                                    width: 4.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      if (elementType ==
                                                          ElementType
                                                              .anime) ...[
                                                        const Icon(
                                                          Icons
                                                              .access_time_outlined,
                                                          color: Colors.white60,
                                                          size: 10.0,
                                                        ),
                                                        const SizedBox(
                                                          width: 2.0,
                                                        ),
                                                      ],
                                                      Text(
                                                        switch ( data.elements[index %
                                                            data.elements.length]) {
                                                          Anime anime =>
                                                            (anime.duration ??
                                                                    '-')
                                                                .toString()
                                                                .replaceAll(
                                                                    ' per ep',
                                                                    ''),
                                                          Manga manga =>
                                                            '${manga.chapters ?? '-'} Chapters',
                                                          _ => ''
                                                        },
                                                        style:
                                                            outfitStyle.copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .white60,
                                                                fontSize: 8.0),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  );
                }),
            error: (error, stackTrace) => const Error1(),
            loading: () => const LoadingWidget(
              color: primaryColor,
            ),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        SizedBox(
          height: 8,
          width: screenSize.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => FutureBuilder(
                future: initializeController(),
                builder: (context, snapshot) => snapshot.hasData
                    ? AnimatedBuilder(
                        animation: pageController,
                        builder: (context, child) => GestureDetector(
                              onTap: () {
                                int currentIndex =
                                    pageController.page?.round() ?? 0;
                                int currentIndexInNumber = currentIndex % 5;
                                int newIndex = currentIndex +
                                    (index - currentIndexInNumber);
                                pageController.animateToPage(newIndex,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut);
                              },
                              child: AnimatedContainer(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                height: 8,
                                width: 8 +
                                    ((pageController.hasClients
                                                        ? (pageController
                                                                .page ??
                                                            0.0)
                                                        : 0.0)
                                                    .round() %
                                                5 ==
                                            index
                                        ? 20
                                        : 0),
                                duration: const Duration(milliseconds: 300),
                                curve: ((pageController.hasClients
                                                    ? (pageController.page ??
                                                        0.0)
                                                    : 0.0)
                                                .round() %
                                            5 ==
                                        index
                                    ? Curves.easeOutBack
                                    : Curves.easeOut),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: primaryColor.withOpacity(
                                              ((pageController.hasClients
                                                                  ? (pageController
                                                                          .page ??
                                                                      0.0)
                                                                  : 0.0)
                                                              .round() %
                                                          5 ==
                                                      index
                                                  ? 1.0
                                                  : 0.0)),
                                          blurRadius: ((pageController
                                                                  .hasClients
                                                              ? (pageController
                                                                      .page ??
                                                                  0.0)
                                                              : 0.0)
                                                          .round() %
                                                      5 ==
                                                  index
                                              ? 2.0
                                              : 0.0))
                                    ],
                                    color: primaryColor.withOpacity(
                                        ((pageController.hasClients
                                                            ? (pageController
                                                                    .page ??
                                                                0.0)
                                                            : 0.0)
                                                        .round() %
                                                    5 ==
                                                index
                                            ? 1.0
                                            : 0.5))),
                              ),
                            ))
                    : const SizedBox(),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SeasonAnime extends ConsumerWidget {
  const SeasonAnime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seasonAnime = ref.watch(seasonAnimeProvider());
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return SizedBox(
      height: screenSize.height * .45,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'This Season',
              style: outfitStyle.copyWith(
                  color: theme.titleTextColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800),
            ),
            InkWell(
              highlightColor: theme.primaryColor.withOpacity(.1),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CollectionDetails(
                  thisSeason: true, elementType: ElementType.anime,
                ),
              )),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'MORE',
                  style: montserratStyle.copyWith(
                    color: primaryColor.withOpacity(.6),
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ]),
        ),
        const SizedBox(height: 8.0),
        Expanded(
            child: seasonAnime.when(
          data: (data) => ListView.builder(
              itemCount:  data.elements.length,
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) =>
                  ElementWidget1(element:  data.elements[index] as Anime)),
          error: (error, stackTrace) => const Error1(),
          loading: () => const LoadingWidget(
            color: primaryColor,
          ),
        ))
      ]),
    );
  }
}

class MangaCollection extends ConsumerWidget {
  final String collection;
  const MangaCollection({super.key, required this.collection});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mangaCollection =
        ref.watch(mangaCollectionProvider(collection: collection));
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return SizedBox(
      height: screenSize.height * .45,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'New ${collection[0].toUpperCase()}${collection.substring(1)}',
              style: outfitStyle.copyWith(
                  color: theme.titleTextColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800),
            ),
            InkWell(
              highlightColor: theme.primaryColor.withOpacity(.1),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CollectionDetails(
                  thisSeason: true , genre: collection, elementType: ElementType.manga,
                ),
              )),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'MORE',
                  style: montserratStyle.copyWith(
                    color: primaryColor.withOpacity(.6),
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ]),
        ),
        const SizedBox(height: 8.0),
        Expanded(
            child: mangaCollection.when(
          data: (data) => ListView.builder(
              itemCount:  data.elements.length,
              physics: const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) =>
                  ElementWidget1(element:  data.elements[index])),
          error: (error, stackTrace) => const Error1(),
          loading: () => const LoadingWidget(
            color: primaryColor,
          ),
        ))
      ]),
    );
  }
}

class RecentEpisodes extends ConsumerWidget {
  const RecentEpisodes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentEpisodes = ref.watch(recentEpisodesProvider);
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return SizedBox(
      height: screenSize.height * .75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child:
              Text(
                'Recent Episodes',
                style: outfitStyle.copyWith(
                    color: theme.titleTextColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800),
              ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: recentEpisodes.when(
            data: (data) => Column(

              children: List.generate(
                data.length > 5 ? 5 : data.length,
                (index) => EpisodeWidget1(episode: data[index]),
              ),
            ),
            error: (error, stackTrace) => const Error1(),
            loading: () => const LoadingWidget(
              color: primaryColor,
            ),
          ),
        ),
      ]),
    );
  }
}

class RecentReviews extends ConsumerWidget {
  final ElementType elementType;

  const RecentReviews({super.key, required this.elementType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentReviews =
        ref.watch(recentReviewsProvider(elementType: elementType));
    final theme = ref.watch(applicationThemeProvider);
    final screenSize = MediaQuery.sizeOf(context);

    return SizedBox(
      height: 4 * screenSize.height * .167,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child:
              Text(
                'Recent Reviews',
                style: outfitStyle.copyWith(
                    color: theme.titleTextColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800),
              ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: recentReviews.when(
            data: (data) => Column(
              children: List.generate(
                3,
                (index) => ReviewWidget(review: data[index]),
              ),
            ),
            error: (error, stackTrace) => const Error1(),
            loading: () => const LoadingWidget(
              color: primaryColor,
            ),
          ),
        ),
      ]),
    );
  }
}

class RecentRecommendations extends ConsumerWidget {
  final ElementType elementType;

  const RecentRecommendations({super.key, required this.elementType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentRecommendations =
        ref.watch(recentRecommendationsProvider(elementType: elementType));
    final theme = ref.watch(applicationThemeProvider);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child:
            Text(
              'Recent Recommendations',
              style: outfitStyle.copyWith(
                  color: theme.titleTextColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800),
            ),
      ),
      const SizedBox(height: 8.0),
      recentRecommendations.when(
        data: (data) => Column(
          children: List.generate(
            3,
            (index) => RecommendationWidget(
              recommendation: data[index],
              elementType: elementType,
            ),
          ),
        ),
        error: (error, stackTrace) =>SizedBox(
            height: MediaQuery.sizeOf(context).height  * 4  * .167,
            child: const Error1()),
        loading: () => const LoadingWidget(
          color: primaryColor,
        ),
      ),
    ]);
  }
}

class GenreBox extends StatelessWidget {
  final ElementType elementType;

  const GenreBox({super.key, required this.elementType});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final genreController = PageController();

    return SizedBox(
      height: screenSize.height * .31,
      child: Column(
        children: [
          Expanded(
            child: PageView(
                controller: genreController,
                clipBehavior: Clip.none,
                key: const ValueKey('genres'),
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: GenreCard(
                            title: 'ACTION',
                            color: const Color(0xFF2E8568),
                            image: 'assets/images/deku.png',
                            type: elementType,
                          )),
                          Expanded(
                              child: GenreCard(
                            title: 'ROMANCE',
                            color: const Color(0xFFB42816),
                            image: 'assets/images/kaguya.png',
                            type: elementType,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: GenreCard(
                            title: 'ADVENTURE',
                            color: const Color(0xFFF69738),
                            image: 'assets/images/naruto.png',
                            type: elementType,
                          )),
                          Expanded(
                              child: GenreCard(
                            title: 'COMEDY',
                            color: const Color(0xFF418FD7),
                            image: 'assets/images/aqua.png',
                            type: elementType,
                          )),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: GenreCard(
                            title: 'FANTASY',
                            color: const Color(0xFFFE9F45),
                            image: 'assets/images/emma.png',
                            type: elementType,
                          )),
                          Expanded(
                              child: GenreCard(
                            title: 'SCI-FI',
                            color: const Color(0xffbb42816),
                            image: 'assets/images/zerotwo.png',
                            type: elementType,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: GenreCard(
                            title: 'DRAMA',
                            color: const Color(0xFF62D6E9),
                            image: 'assets/images/kaori.png',
                            type: elementType,
                          )),
                          Expanded(
                              child: GenreCard(
                            title: 'SLICE\nOF LIFE',
                            color: const Color(0xFFFFBBD0),
                            image: 'assets/images/kanna.png',
                            type: elementType,
                          )),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: GenreCard(
                            title: 'SUPER\nNATURAL',
                            color: const Color(0xFF362643),
                            image: 'assets/images/kira.png',
                            type: elementType,
                          )),
                          Expanded(
                              child: GenreCard(
                            title: 'AVANT\nGARDE',
                            color: const Color(0xFF0261CD),
                            image: 'assets/images/shinji.png',
                            type: elementType,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: GenreCard(
                            title: 'SPORTS',
                            color: const Color(0xFFF69738),
                            image: 'assets/images/hinata.png',
                            type: elementType,
                          )),
                          Expanded(
                              child: GenreCard(
                            title: 'HORROR',
                            color: const Color(0xFF762720),
                            image: 'assets/images/another.png',
                            type: elementType,
                          )),
                        ],
                      ),
                    ],
                  ),
                ]),
          ),
          SizedBox(
            width: screenSize.width * .17,
            height: 20,
            child: Indicator(
              controller: genreController,
            ),
          )
        ],
      ),
    );
  }
}
