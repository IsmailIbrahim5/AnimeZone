import 'dart:convert';

import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/cross_fade_switcher.dart';
import 'package:animezone/core/widgets/loading_widget.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:animezone/features/element/presentation/widgets/element_widget.dart';
import 'package:animezone/features/library/presentation/pages/collection_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/error.dart';
import '../../../../core/widgets/not_found.dart';
import '../widgets/collection_widget.dart';


class LibraryPage extends ConsumerStatefulWidget {
  final int page;
  const LibraryPage({super.key, required this.page});

  @override
  ConsumerState<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends ConsumerState<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    final animeFavoritesList =
        ref.read(sharedPreferencesProvider).getStringList('anime_favorites') ?? [];
    final mangaFavoritesList =
        ref.read(sharedPreferencesProvider).getStringList('manga_favorites') ?? [];
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: screenSize.height * (6 / 63)),
      child: CrossFadeSwitcher(
          next: widget.page == 0,
          child: widget.page == 0
              ? Column(
            key: const ValueKey('favorites_data'),
            mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenSize.height * .45,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                          child:
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Text(
                              'Anime',
                              style: outfitStyle.copyWith(
                                  color: theme.titleTextColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800),
                            ),
                            InkWell(
                              highlightColor: theme.primaryColor.withOpacity(.1),
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CollectionDetails(
                                    title: 'FAVORITE ANIME',
                                    elementIds: animeFavoritesList.map((e) => int.parse(e),).toList(),
                                  elementType: ElementType.anime,
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
                          child: animeFavoritesList.isEmpty ?const NotFound()  :ListView.builder(
                            itemCount: animeFavoritesList.length.clamp(0, 9),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            clipBehavior: Clip.none,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            itemBuilder: (context, index) {
                              final element = ref.watch(elementProvider(id: int.parse(
                                  animeFavoritesList[index]) , elementType: ElementType.anime));
                              return element.when(data: (data) =>ElementWidget1(element: data) ,  error: (error, stackTrace) => const Error1(),
                                  loading: () => SizedBox(
                                      width: screenSize.width * .4+ (16.0),
                                      child: const LoadingWidget(color: primaryColor,)));
                            },),
                        )
                      ]),
                    ),

                    const SizedBox(height: 24.0,),
                          SizedBox(
                            height: screenSize.height * .45,
                            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(
                    'Manga',
                    style: outfitStyle.copyWith(
                        color: theme.titleTextColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800),
                  ),
                  InkWell(
                    highlightColor: theme.primaryColor.withOpacity(.1),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CollectionDetails(
                        title: 'FAVORITE MANGA',
                        elementIds: mangaFavoritesList.map((e) => int.parse(e),).toList(),
                      elementType: ElementType.manga,
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
                  child:mangaFavoritesList.isEmpty ? const NotFound() : ListView.builder(
                    itemCount: mangaFavoritesList.length.clamp(0, 9),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (context, index) {
                      final manga =ref.watch(elementProvider(id: int.parse(
                          mangaFavoritesList[index]) , elementType: ElementType.manga));
                      return manga.when(data: (data) =>ElementWidget1(element: data) ,  error: (error, stackTrace) =>
                      const Error1(),
                          loading: () =>  SizedBox(
                      width: screenSize.width * .4 + (16.0),
                      child: const LoadingWidget(color: primaryColor,)));
                    },),
              )
                            ]),
                          )
                  ],
                )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0 , vertical: 12.0),
                child: FutureBuilder(
                  future: ref.read(databaseProvider).query('collection'),

                  builder: (context, snapshot) => snapshot.hasData && snapshot.data != null && snapshot.data!.isNotEmpty? Column(
                    children: List.generate((snapshot.data!.length / 3 ).ceil(), (row) => Row(
                      children: List.generate(3, (column) => Expanded(
                        child: Builder(builder: (context) {
                          int index = row * 3 + column;
                          if(snapshot.data!.length -1 <index) return const SizedBox();
                          final list = List<int>.from(jsonDecode(snapshot.data![index]['list'] as String) as List);
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CollectionWidget(animeIds: list , name: snapshot.data![index]['name'] as String, elementType: snapshot.data![index]['type'] as String == 'anime' ? ElementType.anime: ElementType.manga, ),
                          );
                        },),
                      ),),
                    ),),
                  ) : const NotFound(),
                ),
              ),
      )
    );
  }
}


