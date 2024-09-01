import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/error.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/models/anime.dart';
import '../../domain/models/review.dart';
import '../../domain/models/element.dart' as elem;

class ReviewsPage extends ConsumerWidget {
  final elem.Element element;
  const ReviewsPage({super.key, required this.element});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    final reviews = ref.watch(elementReviewsProvider(id: element.malId , elementType: element is Anime? ElementType.anime : ElementType.manga));
    return reviews.when(
      data: (data) => data.isNotEmpty ?Column(
        children: List.generate(data.length, (index) => ReviewWidget(review: data[index],)),
      ):SizedBox(
        height: screenSize.height * .4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: screenSize.height * .125,
                child: Image.asset(
                    'assets/images/not_found.png'
                )
            ),
            const SizedBox(height: 8.0,),
            Text(
              "Couldn't find anything",
              style: outfitStyle.copyWith(
                  color: theme.textColor,
                  fontWeight: FontWeight.w300
              ),
            ),
          ],
        ),
      ) ,
      error: (error, stackTrace) =>  const Error1(),
      loading: () => SizedBox(
          height: screenSize.height * .4,
          child: const LoadingWidget(color: primaryColor,)),
    );
  }

}

class ReviewWidget extends ConsumerStatefulWidget {
  const ReviewWidget({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  ConsumerState<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends ConsumerState<ReviewWidget> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return Container(
      width: screenSize.width,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenSize.width * .15,
            decoration: const BoxDecoration(
            ),

            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              imageUrl: widget.review.user['images']['jpg']['image_url'] as String? ?? '',
              placeholder: (context, url) =>  const LoadingWidget(color: primaryColor,),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(widget.review.user['username'] as String? ??'' , style: montserratStyle.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,

                    )),
                    const Spacer(),
                    Text(DateFormat.yMMMd().format(DateTime.parse(widget.review.date)), style: montserratStyle.copyWith(
                        color: Colors.black38,
                        fontSize: 10.0
                    )),
                    const SizedBox(width: 8.0),
                  ],
                ),
                const SizedBox(height: 8.0),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(screenSize.width),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.white,
                        size: 14.0,
                      ),
                      const SizedBox(width: 4.0,),
                      Text(
                        widget.review.tags.first,
                        style: montserratStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 10.0
                        ),

                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      expanded = !expanded;
                    }),
                    child: Stack(
                      children: [
                        Text(
                          widget.review.review,
                          maxLines: expanded ? null : 15,
                          style: montserratStyle.copyWith(
                              color: theme.titleTextColor,
                              fontSize: 10.0,
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                          opacity: expanded ?0.0 : 1.0,
                          child: Container(
                            decoration:  BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  theme.backgroundColor.withOpacity(0),
                                  theme.backgroundColor.withOpacity(0),
                                  theme.backgroundColor,
                                  theme.backgroundColor,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [
                                  0.0,
                                  0.5,
                                  0.95,
                                  1.0,
                                ]
                              )
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Text(
                                  widget.review.review,
                                  maxLines: expanded ? null : 15,
                                  style: montserratStyle.copyWith(
                                    color: Colors.black.withOpacity(0),
                                    fontSize: 10.0,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.keyboard_arrow_down_rounded, color: primaryColor,),
                                    Text(
                                      'Read More',
                                      style: montserratStyle.copyWith(
                                        color: primaryColor,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),

    );
  }
}
