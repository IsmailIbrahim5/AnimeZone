import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:animezone/features/element/domain/models/element.dart' as elem;
import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/models/app_theme.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/animated_value.dart';
import 'package:animezone/core/widgets/background.dart';
import 'package:animezone/core/widgets/cross_fade_switcher.dart';
import 'package:animezone/core/widgets/icon_switcher.dart';
import 'package:animezone/core/widgets/loading_widget.dart';
import 'package:animezone/core/widgets/tab_bar.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:animezone/features/element/presentation/widgets/episodes_page.dart';
import 'package:animezone/features/element/presentation/widgets/news_page.dart';
import 'package:animezone/features/element/presentation/widgets/overview_page.dart';
import 'package:animezone/features/element/presentation/widgets/recommendations_page.dart';
import 'package:animezone/features/element/presentation/widgets/relations_page.dart';
import 'package:animezone/features/element/presentation/widgets/reviews_page.dart';
import 'package:animezone/features/element/presentation/widgets/trailer_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/models/manga.dart';
import '../../domain/models/anime.dart';
import '../widgets/characters_page.dart';
import '../widgets/forum_page.dart';
import '../widgets/media_page.dart';

class ElementDetails extends ConsumerStatefulWidget {
  final elem.Element? element;
  final int? id;
  final ElementType elementType;
  const ElementDetails(
      {super.key, this.element, this.id, required this.elementType});

  @override
  ConsumerState<ElementDetails> createState() => _ElementDetailsState();
}

class _ElementDetailsState extends ConsumerState<ElementDetails>
    with SingleTickerProviderStateMixin {
  int page = 0;
  bool next = false;
  final ScrollController _mainController = ScrollController();
  late final AnimationController _drawerController;

  late final Animation<double> _drawerAnimation;
  late AppTheme theme;
  late Size screenSize;

  bool createCollection = false;
  final collectionTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _drawerAnimation = CurvedAnimation(
      parent: _drawerController,
      curve: Curves.easeOutQuad,
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.sizeOf(context);
    theme = ref.watch(applicationThemeProvider);
    return Material(
      color: theme.backgroundColor,
      child: widget.element == null
          ? ref
              .watch(elementProvider(
                  id: widget.id!, elementType: widget.elementType))
              .when(
                data: (data) => _buildContent(data),
                error: (error, stackTrace) => const SizedBox(),
                loading: () => const Stack(
                  children: [
                    Background(),
                    LoadingWidget(),
                  ],
                ),
              )
          : _buildContent(widget.element!),
    );
  }

  Widget _buildContent(elem.Element element) => AnimatedBuilder(
        animation: _drawerController,
        builder: (context, child) => PopScope(
            canPop: _drawerController.isDismissed,
            onPopInvoked: (didPop) => _drawerController.isCompleted
                ? _drawerController.reverse()
                : null,
            child: child!),
        child: Stack(
          children: [
            _buildWallpaper(element),
            Positioned.fill(
              child: SingleChildScrollView(
                controller: _mainController,
                padding: EdgeInsets.only(bottom: screenSize.height * .1),
                child: Column(
                  children: [
                    _buildInfo(element),
                    Container(
                      color: theme.backgroundColor,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: [
                          TabBar2(
                            callback: (page) => setState(() {
                              next = page < this.page;
                              this.page = page;
                            }),
                            tabs: [
                              'Overview',
                              'Reviews',
                              if (element is Anime) 'Episodes',
                              'Media',
                              'Characters',
                              'Recommendations',
                              'Relations',
                              'News',
                              'Forums',
                            ],
                          ),
                          CrossFadeSwitcher(
                            next: next,
                            factor: .5,
                            child: element is Anime
                                ? switch (page) {
                                    0 => OverviewPage(element: element),
                                    1 => ReviewsPage(
                                        element: element,
                                      ),
                                    2 => EpisodesPage(
                                        animeId: element.malId,
                                      ),
                                    3 => MediaPage(
                                        id: element.malId,
                                        elementType: ElementType.anime,
                                      ),
                                    4 => CharactersPage(
                                        id: element.malId,
                                        elementType: ElementType.anime,
                                      ),
                                    5 => RecommendationsPage(element: element,),
                                    6 => RelationsPage(
                                        id: element.malId,
                                        elementType: ElementType.anime,
                                      ),
                                    7 => NewsPage(
                                        id: element.malId,
                                        elementType: ElementType.anime,
                                      ),
                                    8 => ForumsPage(
                                        id: element.malId,
                                        elementType: ElementType.anime,
                                      ),
                                    _ => const SizedBox(),
                                  }
                                : switch (page) {
                                    0 => OverviewPage(element: element),
                                    1 => ReviewsPage(
                                        element: element,
                                      ),
                                    2 => MediaPage(
                                        id: element.malId,
                                        elementType: ElementType.manga,
                                      ),
                                    3 => CharactersPage(
                                        id: element.malId,
                                        elementType: ElementType.manga,
                                      ),
                              4 => RecommendationsPage(element: element,),

                              5 => RelationsPage(
                                        id: element.malId,
                                        elementType: ElementType.manga,
                                      ),
                                    6 => NewsPage(
                                        id: element.malId,
                                        elementType: ElementType.manga,
                                      ),
                                    7 => ForumsPage(
                                        id: element.malId,
                                        elementType: ElementType.manga,
                                      ),
                                    _ => const SizedBox(),
                                  },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (element is Anime) _buildFloatingActionButton(element),
            _buildAppBar(element),
            _buildBottomBar(element)
          ],
        ),
      );

  Widget _buildWallpaper(elem.Element element) => Builder(builder: (context) {
        final wallpaper = ref.watch(elementWallpaperProvider(
            title: element.titles.first['title'] ?? '',
            id: element.malId,
            elementType: widget.elementType));

        return Positioned(
          width: screenSize.width,
          height: screenSize.height * .45,
          child: Stack(
            children: [
              const Background(),
              wallpaper.when(
                data: (data) => CachedNetworkImage(
                  key: ValueKey('image_$data'),
                  imageUrl: data,
                  imageBuilder: (context, imageProvider) => Stack(
                    children: [
                      Positioned.fill(
                        child: Image(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        color: primaryColor.withOpacity(.75),
                      )
                    ],
                  ),
                  placeholder: (context, url) => const LoadingWidget(),
                ),
                error: (error, stackTrace) => const SizedBox(),
                loading: () => const LoadingWidget(),
              ),
            ],
          ),
        );
      });

  Widget _buildInfo(elem.Element element) => SizedBox(
        height: screenSize.height * .45,
        child: Align(
          alignment: const Alignment(0.0, 0.4),
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenSize.width * .4,
                  height: screenSize.height * .275,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: theme.backgroundColor,
                      borderRadius: BorderRadius.circular(24.0),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 8.0)
                      ]),
                  child: CachedNetworkImage(
                    imageUrl: element.image.largeImageUrl ?? '',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const LoadingWidget(
                      color: primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: screenSize.height * .3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                element.titles
                                        .where(
                                          (element) =>
                                              element['type'] == 'Japanese',
                                        )
                                        .firstOrNull?['title'] ??
                                    '',
                                style: reggaeStyle.copyWith(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                              AutoSizeText(
                                element.titles
                                        .where(
                                          (element) =>
                                              element['type'] == 'English' ||
                                              element['type'] == 'Default',
                                        )
                                        .firstOrNull?['title'] ??
                                    '',
                                maxLines: 4,
                                style: montserratStyle.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'MEMBERS',
                                    style: montserratStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                        color: Colors.white70),
                                  ),
                                  Text(
                                      NumberFormat('###,###,###')
                                          .format( element.members ?? '0').toString(),
                                    style: montserratStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                        color: Colors.white.withOpacity(.85)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'TYPE',
                                    style: montserratStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                        color: Colors.white70),
                                  ),
                                  Text(
                                    element.type ?? '-',
                                    style: montserratStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                        color: Colors.white.withOpacity(.85)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'STATUS',
                                      style: montserratStyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Colors.white70),
                                    ),
                                  ),
                                  Expanded(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        (element.status ?? '-').trim(),
                                        style: montserratStyle.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.0,
                                            color:
                                                Colors.white.withOpacity(.85)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      element is Anime ? 'EPISODES' : 'VOLUMES',
                                      style: montserratStyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Colors.white70),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          switch (element) {
                                            Anime anime =>
                                              '${anime.episodes ?? '-'} ${anime.duration != null ? ' • ${anime.duration}' : ''}',
                                            Manga manga =>
                                              (manga.volumes ?? '-').toString(),
                                            _ => ''
                                          },
                                          style: montserratStyle.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.0,
                                              color: Colors.white
                                                  .withOpacity(.85)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildAppBar(elem.Element element) => Positioned(
        left: 16.0,
        right: 16.0,
        top: 32.0,
        child: AnimatedBuilder(
          animation: _mainController,
          builder: (context, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  decoration: BoxDecoration(
                      color: theme.foregroundColor.withOpacity(
                          _mainController.offset > screenSize.height * .375
                              ? 1.0
                              : 0.0),
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: [
                        BoxShadow(
                            color: primaryColor.withOpacity(
                                _mainController.offset >
                                        screenSize.height * .375
                                    ? .25
                                    : 0.0),
                            blurRadius: _mainController.offset >
                                    screenSize.height * .375
                                ? 8.0
                                : 0.0)
                      ]),
                  child: AnimatedValue<Color>(
                    val: _mainController.offset > screenSize.height * .375
                        ? primaryColor
                        : Colors.white70,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                    builder: (val) => IconButton(
                      highlightColor:
                          _mainController.offset > screenSize.height * .375
                              ? theme.accentColor.withOpacity(.2)
                              : Colors.white24,
                      icon: Image.asset(
                        'assets/icons/back.png',
                        color: val,
                        width: 22.0,
                        height: 22.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(8.0, 0.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    decoration: BoxDecoration(
                        color: theme.foregroundColor.withOpacity(
                            _mainController.offset > screenSize.height * .375
                                ? 1.0
                                : 0.0),
                        borderRadius: BorderRadius.circular(18.0),
                        boxShadow: [
                          BoxShadow(
                              color: primaryColor.withOpacity(
                                  _mainController.offset >
                                          screenSize.height * .375
                                      ? .25
                                      : 0.0),
                              blurRadius: _mainController.offset >
                                      screenSize.height * .375
                                  ? 8.0
                                  : 0.0)
                        ]),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Builder(builder: (context) {
                          List<String> list = ref
                                  .read(sharedPreferencesProvider)
                                  .getStringList('${element is Anime ? 'anime': 'manga'}_favorites') ??
                              [];
                          return IconButton(
                            highlightColor: _mainController.offset >
                                    screenSize.height * .375
                                ? theme.accentColor.withOpacity(.2)
                                : Colors.white24,
                            icon: IconSwitcher(
                              icon: list.contains(element.malId.toString())
                                  ? ShaderMask(
                                      key: const ValueKey('heart_fill'),
                                      shaderCallback: (bounds) =>
                                          const LinearGradient(
                                                  colors: [red, redAccent],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter)
                                              .createShader(bounds),
                                      child: Image.asset(
                                        'assets/icons/heart_fill.png',
                                        height: 22.0,
                                        width: 22.0,
                                        color: Colors.white,
                                      ),
                                    )
                                  : AnimatedValue(
                                      key: const ValueKey('heart_outlined'),
                                      val: _mainController.offset >
                                              screenSize.height * .375
                                          ? primaryColor
                                          : Colors.white70,
                                      curve: Curves.easeOut,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      builder: (val) => Image.asset(
                                        'assets/icons/heart.png',
                                        color: val,
                                        height: 22.0,
                                        width: 22.0,
                                      ),
                                    ),
                            ),
                            onPressed: () async {
                              list.contains(element.malId.toString())
                                  ? list.remove(element.malId.toString())
                                  : list.add(element.malId.toString());
                              await ref
                                  .read(sharedPreferencesProvider)
                                  .setStringList('${element is Anime ? 'anime': 'manga'}_favorites', list);
                              setState(() {});
                            },
                          );
                        }),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          width: 1.0,
                          height: 12.0,
                          color: Colors.black.withOpacity(
                              _mainController.offset > screenSize.height * .375
                                  ? .1
                                  : 0.0),
                        ),
                        AnimatedValue(
                          val: _mainController.offset > screenSize.height * .375
                              ? primaryColor
                              : Colors.white70,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                          builder: (val) => IconButton(
                            highlightColor: _mainController.offset >
                                    screenSize.height * .375
                                ? theme.accentColor.withOpacity(.2)
                                : Colors.white24,
                            icon: Image.asset(
                              'assets/icons/bookmark.png',
                              color: val,
                              width: 22.0,
                              height: 22.0,
                            ),
                            onPressed: _drawerController.forward,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );

  Widget _buildFloatingActionButton(Anime anime) => Positioned(
        bottom: 16.0,
        right: 16.0,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  SlideTransition(
                position: animation.drive(Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                )),
                child: TrailerPage(id: anime.trailer ?? '9bZkp7q19f0'),
              ),
            ));
          },
          child: Container(
            height: screenSize.height * .075,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(18.0),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(.25),
                    blurRadius: 12.0,
                  ),
                ]),
            clipBehavior: Clip.antiAlias,
            child: AnimatedBuilder(
              animation: _mainController,
              builder: (context, child) => Row(
                children: [
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    turns: _mainController.offset > screenSize.height * .375
                        ? 1.0
                        : 0.0,
                    child: Image.asset(
                      'assets/icons/play.png',
                      color: Colors.white,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    widthFactor:
                        _mainController.offset > screenSize.height * .375
                            ? 1
                            : 0.0,
                    alignment: Alignment.center,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      opacity: _mainController.offset > screenSize.height * .375
                          ? 1
                          : 0.0,
                      child: Text(
                        'WATCH TRAILER',
                        style: outfitStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildBottomBar(elem.Element element) => AnimatedBuilder(
        animation: _drawerAnimation,
        builder: (context, child) => _drawerController.isDismissed
            ? const SizedBox()
            : BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: _drawerAnimation.value * 5,
                    sigmaY: _drawerAnimation.value * 5),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: _drawerController.reverse,
                        child: Container(
                          color: theme.primaryColor
                              .withOpacity(.2 * _drawerAnimation.value),
                        ),
                      ),
                    ),
                    Positioned(
                      top: (screenSize.height *
                              (1 - (.5 * _drawerAnimation.value))) -
                          MediaQuery.of(context).viewInsets.bottom,
                      width: screenSize.width,
                      height: screenSize.height * .5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(32.0)),
                          color: theme.foregroundColor,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenSize.height * .1,
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  IconButton(
                                    onPressed: () => createCollection
                                        ? setState(() {
                                            createCollection = false;
                                            collectionTextController.clear();
                                          })
                                        : _drawerController.reverse(),
                                    icon: IconSwitcher(
                                      icon: Icon(
                                        key: ValueKey('icon_$createCollection'),
                                        createCollection
                                            ? Icons.keyboard_arrow_left_rounded
                                            : Icons.close_rounded,
                                        color: primaryColor,
                                      ),
                                    ),
                                    highlightColor: accentColor.withOpacity(.2),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: CrossFadeSwitcher(
                                      next: createCollection,
                                      child: Text(
                                        'Add To Collection',
                                        key: ValueKey(
                                            'add_collection_$createCollection'),
                                        style: outfitStyle.copyWith(
                                            color: theme.titleTextColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: CrossFadeSwitcher(
                                next: !createCollection,
                                child: createCollection
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        key: const ValueKey(
                                            'create_collection_widget'),
                                        children: [
                                          Container(
                                              width: screenSize.width * .3,
                                              height: screenSize.height * .12,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                                // border: Border.all(color: primaryColor,width: 1.0)
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: CachedNetworkImage(
                                                    imageUrl: element.image
                                                            .largeImageUrl ??
                                                        '',
                                                    fit: BoxFit.cover,
                                                    placeholder:
                                                        (context, url) =>
                                                            const LoadingWidget(
                                                      color: primaryColor,
                                                    ),
                                                  )),
                                                  const SizedBox(
                                                    width: 1.0,
                                                  ),
                                                  const Expanded(
                                                      child: Column(
                                                    children: [
                                                      Expanded(
                                                          child: Background()),
                                                      SizedBox(
                                                        height: 1.0,
                                                      ),
                                                      Expanded(
                                                          child: Background()),
                                                    ],
                                                  ))
                                                ],
                                              )),
                                          const SizedBox(
                                            height: 24.0,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                color: theme.backgroundColor,
                                                border: Border.all(
                                                    color: accentColor
                                                        .withOpacity(.5),
                                                    width: 1.0)),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24.0,
                                                vertical: 2.0),
                                            child: TextFormField(
                                              cursorOpacityAnimates: true,
                                              controller:
                                                  collectionTextController,
                                              onEditingComplete: () async {
                                                // Create
                                                await ref
                                                    .read(databaseProvider)
                                                    .insert('collection', {
                                                  'name':
                                                      collectionTextController
                                                          .text,
                                                  'list': jsonEncode(
                                                      [element.malId]),
                                                  'type' : element is Anime?'anime' : 'manga'
                                                });
                                                setState(() {
                                                  createCollection = false;
                                                });
                                                collectionTextController
                                                    .clear();
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  fillColor: primaryColor
                                                      .withOpacity(.25),
                                                  labelText:
                                                      'Enter Collection Title',
                                                  labelStyle:
                                                      outfitStyle.copyWith(
                                                    color: primaryColor
                                                        .withOpacity(.75),
                                                  )),
                                              style: outfitStyle.copyWith(
                                                color: primaryColor,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          AnimatedBuilder(
                                            animation: collectionTextController,
                                            builder: (context, child) =>
                                                AnimatedOpacity(
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    opacity:
                                                        collectionTextController
                                                                .text.isNotEmpty
                                                            ? 1.0
                                                            : .5,
                                                    child: child),
                                            child: GestureDetector(
                                              onTap: () async {
                                                if (collectionTextController
                                                    .text.isNotEmpty) {
                                                  await ref
                                                      .read(databaseProvider)
                                                      .insert('collection', {
                                                    'name':
                                                        collectionTextController
                                                            .text,
                                                    'list': jsonEncode(
                                                        [element.malId]),
                                                    'type' : element is Anime?'anime' : 'manga'
                                                  });
                                                  setState(() {
                                                    createCollection = false;
                                                  });
                                                  collectionTextController
                                                      .clear();
                                                }
                                              },
                                              child: Container(
                                                  width: screenSize.width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    color: primaryColor,
                                                  ),
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 16.0),
                                                  margin: const EdgeInsets.only(
                                                      bottom: 24.0),
                                                  child: Text(
                                                    'Create',
                                                    style: outfitStyle.copyWith(
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )),
                                            ),
                                          )
                                        ],
                                      )
                                    : Column(
                                        key: const ValueKey(
                                            'collections_widget'),
                                        children: [
                                          Expanded(
                                            child: FutureBuilder(
                                              future: ref
                                                  .read(databaseProvider)
                                                  .query('collection', where: 'type = ?' , whereArgs: [element is Anime ? 'anime' : 'manga']),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData &&
                                                    snapshot.data != null) {
                                                  return ListView.builder(
                                                      itemCount:
                                                          snapshot.data!.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        final list = List<
                                                            int>.from(jsonDecode(
                                                                snapshot.data![
                                                                            index]
                                                                        ['list']
                                                                    as String)
                                                            as List);
                                                        final name = snapshot
                                                                .data![index]
                                                            ['name'] as String;
                                                        return Container(
                                                          height: screenSize
                                                                  .height *
                                                              .12,
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 12.0),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  width: screenSize
                                                                          .width *
                                                                      .25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            14.0),
                                                                    // border: Border.all(color: primaryColor,width: 1.0)
                                                                  ),
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  child: Builder(
                                                                      builder:
                                                                          (context) {
                                                                    final image =
                                                                        ref.watch(
                                                                            elementPicturesProvider(id: list.last , elementType: widget.elementType));

                                                                    return image
                                                                        .when(
                                                                      data: (data) =>
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            data.first.largeImageUrl ??
                                                                                '',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        placeholder:
                                                                            (context, url) =>
                                                                                const LoadingWidget(
                                                                          color:
                                                                              primaryColor,
                                                                        ),
                                                                      ),
                                                                      error: (error,
                                                                              stackTrace) =>
                                                                          const SizedBox(),
                                                                      loading: () =>
                                                                          const LoadingWidget(),
                                                                    );
                                                                  }),
                                                                ),
                                                                Text(
                                                                  name,
                                                                  style: outfitStyle.copyWith(
                                                                      color: theme
                                                                          .titleTextColor,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                    list.contains(element.malId)
                                                                        ? list.remove(element
                                                                            .malId)
                                                                        : list.add(
                                                                            element.malId);
                                                                    if (list
                                                                        .isNotEmpty) {
                                                                      await ref.read(databaseProvider).update(
                                                                          'collection',
                                                                          {
                                                                            'list':
                                                                                jsonEncode(list)
                                                                          },
                                                                          where:
                                                                              'name = ?',
                                                                          whereArgs: [
                                                                            name
                                                                          ]);
                                                                    } else {
                                                                      await ref
                                                                          .read(
                                                                              databaseProvider)
                                                                          .delete(
                                                                              'collection',
                                                                              where: 'name = ?',
                                                                              whereArgs: [
                                                                            name
                                                                          ]);
                                                                    }
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      AnimatedContainer(
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            400),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .redAccent
                                                                          .withOpacity(list.contains(element.malId)
                                                                              ? 1.0
                                                                              : 0.0),
                                                                      border: Border.all(
                                                                          color: list.contains(element.malId)
                                                                              ? Colors
                                                                                  .redAccent
                                                                              : accentColor,
                                                                          width:
                                                                              3.0),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        IconSwitcher(
                                                                      icon:
                                                                          Icon(
                                                                        key: ValueKey(
                                                                            'list_${name}_${list.contains(element.malId)}'),
                                                                        list.contains(element.malId)
                                                                            ? Icons.remove_rounded
                                                                            : Icons.add_rounded,
                                                                        color: list.contains(element.malId)
                                                                            ? Colors.white
                                                                            : primaryColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ]),
                                                        );
                                                      });
                                                }
                                                return const LoadingWidget();
                                              },
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () => setState(() {
                                              createCollection = true;
                                            }),
                                            behavior:
                                                HitTestBehavior.translucent,
                                            child: SizedBox(
                                              height: screenSize.height * .1,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.add_rounded,
                                                      key: ValueKey(
                                                          'button_$createCollection'),
                                                      color: primaryColor,
                                                      size: 30.0,
                                                    ),
                                                    const SizedBox(
                                                      width: 4.0,
                                                    ),
                                                    Text(
                                                      'Create New Collection',
                                                      key: const ValueKey(
                                                          'new_collection_text'),
                                                      style:
                                                          outfitStyle.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  primaryColor,
                                                              fontSize: 16.0),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      );

  Future<bool> initializeController() {
    Completer<bool> completer = Completer<bool>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });
    return completer.future;
  }

/*

  Widget _animeView(
      Anime anime, Size screenSize, BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Stack(fit: StackFit.expand, children: [
        CachedNetworkImage(
          imageUrl: anime.image.largeImageUrl ?? '',
          fit: BoxFit.cover,
        ),
        GestureDetector(
          onTap: () {
            // context.pop(true);
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black26,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      anime.titles[0]['title'] ?? '',
                      style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                      bottom: screenSize.height * .25,
                      height: screenSize.height * .2,
                      width: screenSize.width,
                      child: ref
                          .watch(animeCharactersProvider(id: anime.malId))
                          .when(
                            data: (data) => ListView.builder(
                              itemCount: data.length,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => Router.of(context)
                                      .routerDelegate
                                      .setNewRoutePath(
                                          AppRoute.characterDetails(
                                              characterId: data[index].malId)),
                                  child: Container(
                                    width: screenSize.width * .2,
                                    height: screenSize.width * .1,
                                    margin: const EdgeInsets.only(
                                      left: 2,
                                    ),
                                    color: Colors.lightBlue,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              data[index].image.imageUrl ?? '',
                                          fit: BoxFit.cover,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              data[index].name,
                                              style: const TextStyle(
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              '${data[index].anime?.where((element) => (element['anime'] as Map<String, dynamic>)['mal_id'] == anime.malId).firstOrNull?['role']}',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                                      .withOpacity(0.75)),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            error: (error, stackTrace) => const Center(
                              child: Icon(Icons.error),
                            ),
                            loading: () => const CircularProgressIndicator(),
                          )),
                  Positioned(
                    bottom: 0,
                    height: screenSize.height * .2,
                    width: screenSize.width,
                    child:
                        ref.watch(animePicturesProvider(id: anime.malId)).when(
                              data: (data) => ListView.builder(
                                itemCount: data.length,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: screenSize.width * .2,
                                    height: screenSize.width * .1,
                                    margin: const EdgeInsets.only(
                                      left: 2,
                                    ),
                                    color: Colors.lightBlue,
                                    child: CachedNetworkImage(
                                      imageUrl: data[index].imageUrl ?? '',
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                              error: (error, stackTrace) => const Center(
                                child: Icon(Icons.error),
                              ),
                              loading: () => const CircularProgressIndicator(),
                            ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }*/
}
