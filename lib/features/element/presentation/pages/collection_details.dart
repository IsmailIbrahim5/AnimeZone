import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/pagination_widget.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/error.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../widgets/element_widget.dart';

class CollectionDetails extends ConsumerStatefulWidget {
  final String? genre;
  final bool thisSeason;
  final ElementType elementType;
  const CollectionDetails(
      {super.key,
      this.genre,
      this.thisSeason = false,
      required this.elementType});

  @override
  ConsumerState<CollectionDetails> createState() => _CollectionDetailsState();
}

class _CollectionDetailsState extends ConsumerState<CollectionDetails> {
  bool grid = false;

  String? sortBy;
  final listOfOrdering = [
    'Title',
    'Date',
    'Score',
    'Rank',
    'Popularity',
    'Members',
    'Favorites',
  ];
  int page =1;
  int? cachedPage;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    final elements = widget.thisSeason
        ? widget.elementType == ElementType.anime
            ? ref.watch(
                seasonAnimeProvider(page: page),
              )
            : ref.watch(mangaCollectionProvider(collection: widget.genre! ,ordering:( sortBy == 'Date' ? 'start_date' : sortBy?.toLowerCase() ),page: page))
        : ref.watch(genreElementProvider(
            elementType: widget.elementType, genre: widget.genre! ,ordering: sortBy == 'Date' ? 'start_date' : sortBy?.toLowerCase() , page: page));
    return Material(
      color: theme.backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * (7 / 63),
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
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
                  Center(
                    child: Text(
                      '${widget.thisSeason ?(widget.elementType == ElementType.anime ? 'THIS SEASON' : 'NEW RELEASES') : widget.genre!.toUpperCase()} ${widget.elementType == ElementType.anime ? 'ANIME' : 'MANGA'}',
                      style: outfitStyle.copyWith(
                        color: theme.titleTextColor,
                        fontWeight: FontWeight.w900,
                        wordSpacing: 4.0,
                        fontSize: 14.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              const Spacer(),
              if (!(widget.thisSeason &&
                  widget.elementType == ElementType.anime))
                Container(
                  decoration: BoxDecoration(
                    color: theme.foregroundColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: DropdownButton(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    dropdownColor: theme.foregroundColor,
                    borderRadius: BorderRadius.circular(12.0),
                    hint: Center(
                      child: Text(
                        'Sort By',
                        style: outfitStyle.copyWith(color: primaryColor),
                      ),
                    ),
                    value: sortBy,
                    underline: const SizedBox(),
                    items: listOfOrdering
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Center(
                              child: Text(
                                value,
                                style: outfitStyle.copyWith(
                                    color: sortBy == value
                                        ? primaryColor
                                        : theme.hintTextColor),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    style: outfitStyle.copyWith(
                        color: primaryColor, fontWeight: FontWeight.w700),
                    elevation: 0,
                    icon: const Icon(
                      Icons.arrow_drop_down_rounded,
                      color: primaryColor,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        if (sortBy == value) {
                          sortBy = null;
                        } else {
                          sortBy = value;
                        }
                      });
                    },
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: IconButton(
                  icon: Icon(
                    grid ? Icons.list_rounded : Icons.grid_view_rounded,
                    color: primaryColor,
                    size: 22.0,
                  ),
                  onPressed: () => setState(() {
                    grid = !grid;
                  }),
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                elements.when(
                  data: (data) {
                     cachedPage ??= data.lastVisiblePage;
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: grid
                          ? GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: screenSize.height * .435),
                        scrollDirection: Axis.vertical,
                        itemCount: data.elements.length,
                        itemBuilder: (context, index) =>
                            ElementWidget1(element: data.elements[index]),
                      )
                          : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        itemCount: data.elements.length,
                        itemBuilder: (context, index) =>
                            ElementWidget2(element: data.elements[index]),
                      ),
                    );
                  },
                  error: (error, stackTrace) =>const Error1(),
                  loading: () => const LoadingWidget(
                    color: primaryColor,
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 0,
                  right: 0,
                  child:  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: FadeTransition(opacity: animation, child: child,),),
                    switchInCurve:Curves.easeOutBack,
                    child:  cachedPage != null ? Pagination(length: cachedPage!, callback: (index) => setState(() {
                      page = index;
                    }),): const SizedBox(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
