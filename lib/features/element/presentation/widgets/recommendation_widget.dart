import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/pages/element_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/providers/providers.dart';

class RecommendationWidget extends ConsumerWidget {
  final Map<String,dynamic> recommendation;
  final ElementType elementType;
  const RecommendationWidget({super.key, required this.recommendation, required this.elementType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
   final list = List<Map<String,dynamic>>.from(recommendation['entry'] as List);

    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
              color: theme.bgColor,
              borderRadius: BorderRadius.circular(14.0),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: GestureDetector(
                    onTap: () => Navigator.push(context , MaterialPageRoute(builder: (context) => ElementDetails(id:list.first['mal_id'] as int, elementType: elementType,),)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height * .1,
                          child: AspectRatio(
                            aspectRatio: .75,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: CachedNetworkImage(
                                imageUrl: list.first['images']['jpg']['image_url'] as String? ??'',

                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0,),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('If you liked...', style: outfitStyle.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0
                            ),),
                            const SizedBox(height: 4.0,),
                            Text(list.first['title'] as String, style: outfitStyle.copyWith(
                                color: theme.textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 10.0
                            ),),
                          ],
                        ))
                      ],
                    ),
                  )),
                  Expanded(child: GestureDetector(
                    onTap: () => Navigator.push(context , MaterialPageRoute(builder: (context) => ElementDetails(id:list.last['mal_id'] as int,elementType: elementType,),)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height * .1,
                          child: AspectRatio(
                            aspectRatio: .75,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: CachedNetworkImage(
                                imageUrl: list.last['images']['jpg']['image_url'] as String? ??'',

                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0,),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Then you might like...', style: outfitStyle.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0
                            ),),
                            const SizedBox(height: 4.0,),
                            Text(list.last['title'] as String, style: outfitStyle.copyWith(
                                color: theme.textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 10.0
                            ),),
                          ],
                        ))
                      ],
                    ),
                  )),

                ],
              ),
              const SizedBox(height: 12.0,),
              Text( recommendation['content'] as String? ?? '', style: outfitStyle.copyWith(
                  color: theme.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0
              ),),
              Container(
                width: screenSize.width * .75,
                height: 1.0,
                margin: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      primaryColor.withOpacity(.4),
                      Colors.transparent
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                  )
                ),
              ),
              Row(
                children: [
                  Text( recommendation['user']['username'] as String? ?? '', style: outfitStyle.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.0
                  ),),
                  Container(
                    width: 1.0,
                    height: 4.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    color: primaryColor.withOpacity(.25),
                  ),
                  Text(DateFormat.yMMMd().format( DateTime.parse(recommendation['date']as String? ?? '')) , style: outfitStyle.copyWith(
                      color: theme.hintTextColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 8.0
                  ),),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
