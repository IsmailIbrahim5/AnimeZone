import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/features/element/presentation/pages/review_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/providers/providers.dart';
import '../../domain/models/review.dart';

class ReviewWidget extends ConsumerWidget {
  final Review review;
  const ReviewWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);

    return GestureDetector(
      onTap: () =>  Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => ReviewPage(review: review),)),
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Stack(
            children: [
              Container(
                height: screenSize.height * .167,
                decoration: BoxDecoration(
                  color: theme.bgColor,
                  borderRadius: BorderRadius.circular(14.0),

                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: screenSize.height * .167,
                      width: screenSize.width * .223,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 16.0,
                                              height: 16.0,
                                              decoration: const BoxDecoration(shape: BoxShape.circle),
                                              clipBehavior: Clip.antiAlias,
                                              child: CachedNetworkImage(
                                                  imageUrl: review.user['images']['jpg']['image_url'] as String? ?? '',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(width: 8.0,),
                                            Text( review.user['username'] as String? ?? '', style: outfitStyle.copyWith(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 8.0
                                            ),),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            review.entry?['title'] as String? ?? '',
                                            style: outfitStyle.copyWith(
                                                color: theme.titleTextColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12.0
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                          DateFormat.yMMMd().format(DateTime.parse(review.date)),
                                          style: outfitStyle.copyWith(
                                            color: theme.textColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 6.0,
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                                Expanded(
                                  flex: 1,
                                  child:Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: switch(review.tags.first){
                                          'Recommended' => primaryColor,
                                        'Mixed Feelings' => Colors.deepPurple,
                                        'Not Recommended' => Colors.redAccent,
                                        _ => primaryColor,
                                        }
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                                      child: Icon(
                                        switch(review.tags.first){
                                          'Recommended' => Icons.star_rounded,
                                          'Mixed Feelings' => Icons.question_mark_rounded,
                                          'Not Recommended' => Icons.mood_bad,
                                          _ => Icons.star_rounded,
                                        },
                                        color: Colors.white,
                                        size: 10.0,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  review.review,
                                  maxLines: 5,
                                  style: outfitStyle.copyWith(
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w400,
                                      color: theme.titleTextColor,
                                      overflow: TextOverflow.ellipsis
                                  ),
                                ),
                              )
                            )

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                height: screenSize.height * .167,
                width: screenSize.width * .223,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    imageUrl: review.entry?['images']['jpg']['image_url'] as String? ??'',

                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
