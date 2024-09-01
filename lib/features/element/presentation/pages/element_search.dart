import 'dart:async';

import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/widgets/error.dart';
import 'package:animezone/core/widgets/icon_switcher.dart';
import 'package:animezone/core/widgets/loading_widget.dart';
import 'package:animezone/core/widgets/not_found.dart';
import 'package:animezone/core/widgets/pagination_widget.dart';
import 'package:animezone/core/widgets/selector.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/widgets/element_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/providers.dart';
import '../../domain/models/element.dart' as elem;
import '../providers/providers.dart';
import 'element_details.dart';

class ElementSearch extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final bool controlsOn;
  final ElementType elementType;
  const ElementSearch(
      {super.key,
      required this.controller,
      this.controlsOn = false,
      required this.elementType});

  @override
  ConsumerState<ElementSearch> createState() => _ElementSearchState();
}

class _ElementSearchState extends ConsumerState<ElementSearch> {
  String q = '';

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(
      () {
        if (request != null && request!.isActive) request!.cancel();

        request = Timer(
          const Duration(seconds: 1),
          () {
            setState(() {
              if (widget.controller.text.isNotEmpty) {
                q = widget.controller.text;
              } else {
                q = '';
              }
              cachedPage = null;
              page = 1;
            });
          },
        );
      },
    );
    searchControls = widget.elementType == ElementType.anime
        ? SearchControls.anime()
        : SearchControls.manga();
  }

  Timer? request;
  late final SearchControls searchControls;
  bool searchForRandom = false;
  bool grid = false;
  int page = 1;
  int? cachedPage;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);

    return Material(
      color: theme.backgroundColor,
      child: Builder(
        builder: (context) {
          AsyncValue<elem.ElementCollection>? results;
          if (q.isNotEmpty) {
            List<String> genres = [];
            for (int i = 0; i < searchControls.genres.length; i++) {
              if (searchControls.genres.values.elementAt(i)) {
                genres.add(searchControls.genres.keys.elementAt(i));
              }
            }
            results = ref.watch(elementSearchProvider(
                q: q,
                sfw: searchControls.sfw,
                status: searchControls.status?.toLowerCase(),
                page: page,
                type: searchControls.type == 'All'
                    ? null
                    : searchControls.type.toLowerCase(),
                rating: searchControls.rating == 'Any'
                    ? null
                    : searchControls.rating.toLowerCase().replaceAll('-', ''),
                ordering: searchControls.ordering == 'Date'
                    ? 'start_date'
                    : searchControls.ordering?.toLowerCase(),
                genres: genres.isEmpty ? null : genres.join(','),
                elementType: widget.elementType));
          }
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: widget.controlsOn
                  ? searchControlsWidget()
                  : (q.isEmpty
                      ? (searchForRandom
                          ? const LoadingWidget(
                              color: primaryColor,
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TweenAnimationBuilder(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeOutBack,
                                    tween: Tween<double>(begin: 0.0, end: 1.0),
                                    builder: (context, value, child) =>
                                        Transform.scale(
                                            scale: value, child: child),
                                    child: SizedBox(
                                      width: screenSize.width * .45,
                                      child: Image.asset(
                                        'assets/images/question.png',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  TweenAnimationBuilder(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeOutBack,
                                    tween: Tween<double>(begin: 0.0, end: 1.0),
                                    builder: (context, value, child) =>
                                        FractionalTranslation(
                                      translation: Offset(0.0, 1 - value),
                                      child: child,
                                    ),
                                    child: Text(
                                      "Don't know what you are looking for?",
                                      style: outfitStyle.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: theme.titleTextColor,
                                          fontSize: 18.0),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TweenAnimationBuilder(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeOutBack,
                                        tween:
                                            Tween<double>(begin: 0.0, end: 1.0),
                                        builder: (context, value, child) =>
                                            Transform.scale(
                                          scale: value,
                                          child: child,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.circular(
                                              8.0,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0, vertical: 8.0),
                                          child: Text(
                                            "Recommend me",
                                            style: outfitStyle.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      TweenAnimationBuilder(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeOutBack,
                                        tween:
                                            Tween<double>(begin: 0.0, end: 1.0),
                                        builder: (context, value, child) =>
                                            Transform.scale(
                                          scale: value,
                                          child: child,
                                        ),
                                        child: GestureDetector(
                                          onTap: () async {
                                            setState(() {
                                              searchForRandom = true;
                                            });
                                            final randomElement = await ref
                                                .read(elementRepositoryProvider)
                                                .getRandomElement(
                                                    elementType:
                                                        widget.elementType);
                                            setState(() {
                                              searchForRandom = false;
                                            });
                                            Navigator.of(context)
                                                .push(PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  SlideTransition(
                                                position: animation
                                                    .drive(Tween<Offset>(
                                                  begin: const Offset(0.0, 1.0),
                                                  end: Offset.zero,
                                                )),
                                                child: ElementDetails(
                                                  element: randomElement,
                                                  elementType:
                                                      widget.elementType,
                                                ),
                                              ),
                                            ));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: theme.foregroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8.0,
                                              ),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24.0,
                                                vertical: 8.0),
                                            child: Text(
                                              "Random ${widget.elementType == ElementType.anime ? 'Anime' : 'Manga'}",
                                              style: outfitStyle.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: primaryColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                      : Column(
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: IconButton(
                                    highlightColor: accentColor.withOpacity(.2),
                                    icon: IconSwitcher(
                                      icon:  Icon(
                                        key: Key('grid_icon_$grid'),
                                        grid ? Icons.list_rounded : Icons.grid_view_rounded,
                                        color: primaryColor,
                                        size: 22.0,
                                      ),
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
                                  results!.when(
                                    data: (data) {
                                      if(data.elements.isEmpty){
                                        return const NotFound();
                                      }
                                      if(cachedPage != data.lastVisiblePage) {
                                          cachedPage = data.lastVisiblePage;
                                      }
                                      return AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 400),
                                        child: grid
                                            ? GridView.builder(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisExtent:
                                            screenSize.height * .435,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: data.elements.length,
                                          itemBuilder: (context, index) =>
                                              ElementWidget1(
                                                  element: data.elements[index]),
                                        )
                                            : ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          itemCount: data.elements.length,
                                          itemBuilder: (context, index) =>
                                              ElementWidget2(
                                                element: data.elements[index],
                                              ),
                                        ),
                                      );
                                    },
                                    error: (error, stackTrace) => const Error1(),
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
                            ),
                          ],
                        )),
          );
        },
      ),
    );
  }

  Widget searchControlsWidget() {
    final theme = ref.watch(applicationThemeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Column(
            children: List.generate(
              5,
              (row) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    row == 4 ? 2 : 4,
                    (column) => GestureDetector(
                      onTap: () => setState(() {
                        searchControls.genres[searchControls.genres.keys
                                .elementAt((row * 4) + column)] =
                            !searchControls.genres.values
                                .elementAt((row * 4) + column);
                      }),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                                color: searchControls.genres.values
                                        .elementAt((row * 4) + column)
                                    ? primaryColor
                                    : theme.hintTextColor),
                            color: primaryColor.withOpacity(searchControls
                                    .genres.values
                                    .elementAt((row * 4) + column)
                                ? 1.0
                                : 0.0)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        child: AnimatedDefaultTextStyle(
                          style: outfitStyle.copyWith(
                              color: searchControls.genres.values
                                      .elementAt((row * 4) + column)
                                  ? Colors.white
                                  : theme.hintTextColor,
                              fontWeight: FontWeight.w400),
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut,
                          child: Text(
                            searchControls.genres.keys
                                .elementAt((row * 4) + column),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SFW',
                style: outfitStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                    color: theme.titleTextColor),
              ),
              SizedBox(
                child: Switch(
                  value: searchControls.sfw,
                  onChanged: (value) => setState(() {
                    searchControls.sfw = value;
                  }),
                  activeColor: primaryColor,
                  inactiveTrackColor: Colors.transparent,
                  inactiveThumbColor: Colors.black.withOpacity(.18),
                  trackOutlineColor: WidgetStateProperty.resolveWith(
                    (states) {
                      if (states.contains(WidgetState.selected)) {
                        return primaryColor;
                      }
                      return theme.hintTextColor;
                    },
                  ),
                  trackColor: WidgetStateProperty.resolveWith(
                    (states) {
                      if (states.contains(WidgetState.selected)) {
                        return primaryColor;
                      }
                      return null;
                    },
                  ),
                  thumbColor: WidgetStateProperty.resolveWith(
                    (states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.white;
                      }
                      return theme.hintTextColor;
                    },
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status',
                style: outfitStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: theme.titleTextColor,
                ),
              ),
              const SizedBox(
                width: 24.0,
              ),
              widget.elementType == ElementType.anime
                  ? Expanded(
                      child: Selector(
                      values: searchControls.listOfStatus,
                      initialValue: searchControls.status,
                      callback: (index) => searchControls.status = index == -1
                          ? null
                          : searchControls.listOfStatus[index],
                    ))
                  : Container(
                      decoration: BoxDecoration(
                        color: theme.foregroundColor,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: DropdownButton(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        dropdownColor: theme.foregroundColor,
                        borderRadius: BorderRadius.circular(12.0),
                        value: searchControls.status,
                        underline: const SizedBox(),
                        items: searchControls.listOfStatus
                            .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Center(
                                  child: Text(
                                    value,
                                    style: outfitStyle.copyWith(
                                        color:searchControls.status == value
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
                            searchControls.status = value;
                          });
                        },
                      ),
                    )
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Type',
                style: outfitStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: theme.titleTextColor),
              ),
              Container(
                decoration: BoxDecoration(
                  color: theme.foregroundColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: DropdownButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  dropdownColor: theme.foregroundColor,
                  borderRadius: BorderRadius.circular(12.0),
                  value: searchControls.type,
                  underline: const SizedBox(),
                  items: searchControls.listOfTypes
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: Text(
                              value,
                              style: outfitStyle.copyWith(
                                  color: searchControls.type == value
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
                      if (value != null) {
                        searchControls.type = value;
                      } else {
                        searchControls.type = 'All';
                      }
                    });
                  },
                ),
              )
            ],
          ),
          if (widget.elementType == ElementType.anime) ...[
            const SizedBox(
              height: 12.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rating',
                  style: outfitStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                      color: theme.titleTextColor),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: theme.foregroundColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: DropdownButton(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    dropdownColor: theme.foregroundColor,
                    borderRadius: BorderRadius.circular(12.0),
                    value: searchControls.rating,
                    underline: const SizedBox(),
                    items: searchControls.listOfRatings
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Center(
                              child: Text(
                                value,
                                style: outfitStyle.copyWith(
                                    color: searchControls.rating == value
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
                        if (value != null) {
                          searchControls.rating = value;
                        } else {
                          searchControls.rating = 'Any';
                        }
                      });
                    },
                  ),
                )
              ],
            ),
          ],
          const SizedBox(
            height: 12.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ordering',
                style: outfitStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: theme.titleTextColor,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Selector2(
                values: searchControls.listOfOrdering,
                initialValue: searchControls.ordering,
                callback: (index) => searchControls.ordering =
                    index == -1 ? null : searchControls.listOfOrdering[index],
              )
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }
}

class SearchControls {
  bool sfw;
  String? status;
  late final List<String> listOfStatus;
  String type = 'All';
  late final List<String> listOfTypes;
  String rating = 'Any';
  final listOfRatings = [
    'Any',
    'G',
    'PG',
    'PG-13',
    'R-17',
    'R',
    'RX',
  ];
  String? ordering;
  final listOfOrdering = [
    'Title',
    'Date',
    'Score',
    'Rank',
    'Popularity',
    'Members',
    'Favorites',
  ];
  Map<String, bool> genres = {
    'Action': false,
    'Adventure': false,
    'Avant Garde': false,
    'Boys Love': false,
    'Comedy': false,
    'Drama': false,
    'Fantasy': false,
    'Girls Love': false,
    'Gourmet': false,
    'Horror': false,
    'Mystery': false,
    'Romance': false,
    'Sci-Fi': false,
    'Slice of Life': false,
    'Sports': false,
    'Supernatural': false,
    'Suspense': false,
    'Award Winning': false,
  };
  SearchControls.anime({this.sfw = true}) {
    listOfStatus = ['Airing', 'Upcoming', 'Complete'];
    listOfTypes = [
      'All',
      'Tv',
      'Movie',
      'Ova',
      'Special',
      'Ona',
      'Music',
      'Cm',
      'Pv',
      'Tv Special'
    ];
  }
  SearchControls.manga({this.sfw = true}) {
    listOfStatus = [
      'Publishing',
      'Upcoming',
      'Complete',
      'Discontinued',
      'Hiatus'
    ];
    listOfTypes = [
      'All',
      'Manga',
      'Novel',
      'Light Novel',
      'One Shot',
      'Doujin',
      'Manhwa',
      'Manhua',
    ];
    status = 'Publishing';
  }
}
