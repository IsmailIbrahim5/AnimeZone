import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/background.dart';
import 'package:animezone/core/widgets/error.dart';
import 'package:animezone/core/widgets/loading_widget.dart';
import 'package:animezone/features/element/domain/models/review.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ReviewPage extends ConsumerWidget {
  final Review review;
  const ReviewPage({super.key, required this.review});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final  animation = ModalRoute.of(context)?.animation;
    final theme = ref.watch(applicationThemeProvider);
    return  Material(
      type: MaterialType.transparency,
      child: Stack(

        children: [
          Positioned.fill(
            child: FadeTransition(
              opacity: animation!,
              child: SlideTransition(
                position: animation.drive(Tween<Offset>(begin: const Offset(0.0 , -1.0) , end: Offset.zero).chain(CurveTween(curve: Curves.easeOut))),
                child: CachedNetworkImage(
                  imageUrl: review.entry?['images']['jpg']['large_image_url'] as String? ?? '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Background(),
                  errorWidget: (context, url, error) => const Error1(),
                ),
              ),
            ),
          ),
          FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: animation.drive(Tween<Offset>(begin: const Offset(0.0 , 1.0) , end: Offset.zero).chain(CurveTween(curve: Curves.easeOut))),
              child: Container(
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(36.0)),
                    color: theme.foregroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(.2),
                        spreadRadius: 4,
                        blurRadius: 8.0,
                      )
                    ]
                  ),
                margin:  EdgeInsets.only(top: screenSize.height * .3 , left: 16.0 , right: 16.0 , bottom: 16.0),
                  padding: const EdgeInsets.symmetric(horizontal: 24.0 ),
                  clipBehavior: Clip.antiAlias,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 24.0 ),
                    child: Column(
                      children: [

                        const SizedBox(
                          height: 66.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat.yMMMd().format(DateTime.parse(review.date)),
                              style: outfitStyle.copyWith(
                                color: theme.textColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                review.entry?['title'] as String,
                                style: outfitStyle.copyWith(
                                  color:theme.titleTextColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                            Text(
                              review.review,
                              style: outfitStyle.copyWith(
                                color: theme.titleTextColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0,
                              ),
                            ),
                            const SizedBox(height: 12.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                if(review.score != null)
                                  Column(
                                  children: [
                                    Text(
                                      'Score',
                                      style: reggaeStyle.copyWith(
                                        color:theme.titleTextColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0,),
                                    Text(
                                      '${review.score} / 10',
                                      style: reggaeStyle.copyWith(
                                        color:review.score! > 5 ? Colors.green : (review.score == 5 ?  primaryColor : Colors.redAccent),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 28.0,
                                      ),
                                    ),
                                  ],
                                ),
                                if(review.episodesWatched != null)
                                  Column(
                                    children: [
                                      Text(
                                        'Episodes Watched',
                                        style: outfitStyle.copyWith(
                                          color: Colors.black.withOpacity(.75),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      const SizedBox(height: 4.0,),
                                      Text(
                                        review.episodesWatched.toString(),
                                        style: outfitStyle.copyWith(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 28.0,
                                        ),
                                      ),
                                    ],
                                  )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
            ),
          ),
          Positioned(
            top: screenSize.height * .25,
            height: screenSize.height * .15,
            right: screenSize.width * .1,
            left: screenSize.width * .1,
            child: FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: Container(
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(36.0),
                      boxShadow: const [
                        BoxShadow(
                          color: primaryColor,
                          blurRadius: 8.0
                        )
                      ],
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            accentColor,
                            primaryColor
                          ]
                      )
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child:  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                          imageUrl: review.user['images']['jpg']['image_url'] as String? ??'',
                          placeholder: (context, url) => const LoadingWidget(color: primaryColor,),
                          errorWidget: (context, url, error) => Center(child: Image.asset('assets/images/fail.png'),),
                          fit: BoxFit.cover,
                          width: screenSize.width * .1,
                          height: screenSize.width * .1,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Text(review.user['username'] as String? ??'',
                        overflow: TextOverflow.ellipsis,
                        style: outfitStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0
                        ),),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: switch(review.tags.first){
                              'Recommended' => Colors.white,
                              'Mixed Feelings' => Colors.deepPurple,
                              'Not Recommended' => Colors.redAccent,
                              _ => primaryColor,
                            }
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12.0 , vertical: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                                switch(review.tags.first){
                                  'Recommended' => Icons.star_rounded,
                                  'Mixed Feelings' => Icons.question_mark_rounded,
                                  'Not Recommended' => Icons.mood_bad,
                                  _ => Icons.star_rounded,
                                },
                                color:switch(review.tags.first){
                                  'Recommended' => primaryColor,
                                  _ => Colors.white,
                                }
                            ),
                            const SizedBox(width: 8.0,),
                            AutoSizeText(
                              review.tags.first.replaceAll(' ', '\n'),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: outfitStyle.copyWith(
                                  color: switch(review.tags.first){
                                    'Recommended' => primaryColor,
                                    _ => Colors.white,
                                  },
                                  fontWeight: FontWeight.w700,
                                fontSize: 10.0
                              ),
                            ),
                            const SizedBox(width: 8.0,),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(

            left: 0,
            top: screenSize.height * .05,
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


        ],
      ),
    );
  }
}
