import 'dart:async';

import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/background.dart';
import 'package:animezone/core/widgets/loading_widget.dart';
import 'package:animezone/features/element/presentation/pages/element_details.dart';
import 'package:animezone/core/widgets/full_image_view.dart';
import 'package:animezone/features/character/presentation/providers/providers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../config/routes/app_route.dart';
import '../../../../config/styles/styles.dart';
import '../../../../core/widgets/error.dart';
import '../../../element/data/repository/element_repository.dart';
import '../../../element/domain/models/anime.dart';
import '../../domain/models/character.dart';

class CharacterDetails extends ConsumerStatefulWidget {
  final int characterId;
  final Character? character;

  const CharacterDetails(
      {super.key, required this.characterId, this.character});

  @override
  ConsumerState<CharacterDetails> createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends ConsumerState<CharacterDetails> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(applicationThemeProvider);
    final screenSize = MediaQuery.sizeOf(context);
    return Material(
      child: Stack(
        children: [
          const Background(),
          Positioned.fill(
            child: widget.character == null
                ? Builder(
                    builder: (context) {
                      final character =
                          ref.watch(characterProvider(id: widget.characterId));
                      return character.when(
                        data: (data) => _characterView(data),
                        error: (error, stackTrace) => const Error1(),
                        loading: () => const LoadingWidget(),
                      );
                    },
                  )
                : _characterView(widget.character!),
          ),
          Positioned(
            top: 32.0,
            child: GestureDetector(
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

  final controller = ScrollController();
  final imageController =
      PageController(viewportFraction: .4, initialPage: 1000);

  double getVal(double page, int index) =>
      ((page - index).abs() * 2).clamp(0, 1);

  Future<bool> initializeController() {
    Completer<bool> completer = Completer<bool>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });
    return completer.future;
  }

  Widget _characterView(Character character) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);

    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(top: screenSize.height * .25),
          controller: controller,
          child: Container(
            decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24.0))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenSize.height * .2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              character.nameKanji ?? '',
                              style: reggaeStyle.copyWith(
                                color: primaryColor,
                                fontSize: 30.0,
                              ),
                            ),
                            Text(
                              character.name,
                              style: outfitStyle.copyWith(
                                  color: theme.titleTextColor,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width * .1,),
                      Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                                    colors: [red, redAccent],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)
                                .createShader(bounds),
                            child: Image.asset(
                              'assets/icons/heart_fill.png',
                              height: screenSize.height * .05,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            NumberFormat('###,###,###')
                                .format(character.favorites ?? '-').toString(),
                            style: outfitStyle.copyWith(
                                fontSize: 18.0,
                                color: Color.lerp(red, redAccent, .5),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    character.about ?? '',
                    style: outfitStyle.copyWith(
                        color: theme.textColor, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  if (character.anime != null &&
                      character.anime!.isNotEmpty) ...[
                    Text(
                      'Animeography',
                      style: outfitStyle.copyWith(
                          color: theme.titleTextColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      height: screenSize.height * .3,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: character.anime!.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ElementDetails(id: character.anime![index]['anime']['mal_id'] as int, elementType: ElementType.anime,),)),
                          child: Container(
                            margin: const EdgeInsets.only(right: 12.0),
                            width: screenSize.width * .3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: screenSize.height * .2,
                                  width: screenSize.width * .3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0)),
                                  clipBehavior: Clip.antiAlias,
                                  child: CachedNetworkImage(
                                    imageUrl: character.anime![index]['anime']
                                                ['images']['jpg']['image_url']
                                            as String? ??
                                        '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                AutoSizeText(
                                  character.anime![index]['anime']['title']
                                          as String? ??
                                      '',
                                  maxLines: 2,
                                  style: outfitStyle.copyWith(
                                      color: theme.titleTextColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  character.anime![index]['role'] as String? ??
                                      '',
                                  style: outfitStyle.copyWith(
                                      color: primaryColor,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                  if (character.manga != null &&
                      character.manga!.isNotEmpty) ...[
                    Text(
                      'Mangaography',
                      style: outfitStyle.copyWith(
                          color: theme.titleTextColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      height: screenSize.height * .3,
                      child: ListView.builder(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemCount: character.manga!.length,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(right: 12.0),
                          width: screenSize.width * .3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: screenSize.height * .2,
                                width: screenSize.width * .3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0)),
                                clipBehavior: Clip.antiAlias,
                                child: CachedNetworkImage(
                                  imageUrl: character.manga![index]['manga']
                                              ['images']['jpg']['image_url']
                                          as String? ??
                                      '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              AutoSizeText(
                                character.manga![index]['manga']['title']
                                        as String? ??
                                    '',
                                maxLines: 2,
                                style: outfitStyle.copyWith(
                                    color: theme.titleTextColor,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                character.manga![index]['role'] as String? ??
                                    '',
                                style: outfitStyle.copyWith(
                                    color: primaryColor,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                  if (character.voices != null &&
                      character.manga!.isNotEmpty) ...[
                    Text(
                      'Voice Actors',
                      style: outfitStyle.copyWith(
                          color: theme.titleTextColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),

                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 8.0,
                            mainAxisExtent: screenSize.height * .175),
                        itemCount: character.voices!.length,
                        itemBuilder: (context, index) =>  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                    aspectRatio: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: CachedNetworkImage(
                                        imageUrl: character.voices![index]['person']['images']['jpg']['image_url'] as String? ?? '',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => const Stack(
                                          children: [
                                            Background(),
                                            LoadingWidget()
                                          ],
                                        ),
                                      ),
                                    ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                                  child: Text(
                                    character.voices![index]['person']['name'] as String? ?? '',
                                    style: outfitStyle.copyWith(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700,
                                      color: theme.titleTextColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  character.voices![index]['language'] as String? ?? '',
                                  style: outfitStyle.copyWith(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),

                        ),
                  ]
                ],
              ),
            ),
          ),
        ),
        AnimatedBuilder(
            animation: controller,
            builder: (context, child) => Positioned(
                  top: screenSize.height * .1 - controller.offset,
                  height: screenSize.height * .3,
                  width: screenSize.width,
                  child: child!,
                ),
            child: ref
                .watch(characterPicturesProvider(id: widget.characterId))
                .when(
                  data: (data) =>data.isNotEmpty? PageView.builder(
                    controller: imageController,
                    itemBuilder: (context, index) => FutureBuilder(
                      future: initializeController(),
                      builder: (context, snapshot) => snapshot.hasData
                          ? AnimatedBuilder(
                              key: ValueKey(
                                  'image_${data[index % data.length].imageUrl}'),
                              animation: imageController,
                              builder: (context, child) => Transform.scale(
                                scale: 1 -
                                    (.25 *
                                        getVal(
                                            imageController.hasClients
                                                ? (imageController.page ?? 0.0)
                                                : 0.0,
                                            index)),
                                child: child,
                              ),
                              child: GestureDetector(
                                onTap: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context) => FullImageView(imageUrl: data[index % data.length].imageUrl??''),)),
                                child: Hero(
                                  tag: 'image_${data[index % data.length].imageUrl}',
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: primaryColor.withOpacity(.5),
                                            blurRadius: 12.0,
                                          )
                                        ]),
                                    clipBehavior: Clip.antiAlias,
                                    child: CachedNetworkImage(
                                      imageUrl: data[index % data.length].imageUrl ?? '',
                                      placeholder:(context, url) => const  Stack(
                                        alignment: Alignment.center,
                                        children: [
                                           Background(),
                                          LoadingWidget()
                                        ],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const LoadingWidget(),
                    ),
                  ): const SizedBox(),
                  error: (error, stackTrace) => const Error1(),
                  loading: () => const LoadingWidget(
                    color: primaryColor,
                  ),
                )),
      ],
    );
  }

  Widget _animeList(List<Map<String, dynamic>> animeList, Size screenSize) {
    return ListView.builder(
      itemCount: animeList.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        Anime anime =
            Anime.fromEntry(animeList[index]['anime'] as Map<String, dynamic>);
        return GestureDetector(
          onTap: () => Router.of(context)
              .routerDelegate
              .setNewRoutePath(AppRoute.animeDetails(animeId: anime.malId)),
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
                  imageUrl: anime.image.imageUrl ?? '',
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      anime.titles[0]['title'] as String,
                      style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    Text(
                      animeList[index]['role'] as String,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.75)),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
