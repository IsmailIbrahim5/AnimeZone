import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/error.dart';
import 'package:animezone/core/widgets/not_found.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/background.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/models/anime.dart';
import '../../domain/models/element.dart' as elem;
import '../pages/element_details.dart';

class RecommendationsPage extends ConsumerWidget {
  final elem.Element element;
  const RecommendationsPage({super.key, required this.element});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    final reviews = ref.watch(elementRecommendationsProvider(id: element.malId , elementType: element is Anime? ElementType.anime : ElementType.manga));
    return reviews.when(
      data: (data) => data.isNotEmpty ?Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(

          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,
              mainAxisExtent: screenSize.height * .375 , crossAxisSpacing: 16.0),

          itemCount: data.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ElementDetails(id: data[index]['entry']['mal_id']as int, elementType: element is Anime ?ElementType.anime: ElementType.manga,),)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: .75,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        const Background(),
                        CachedNetworkImage(
                          imageUrl: data[index]['entry']['images']['jpg']['image_url'] as String? ?? '',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const LoadingWidget(),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration:const BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      primaryColor,
                                      accentColor
                                    ]
                                )
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            child: Text(
                              '${data[index]['votes']} VOTES',
                              style: outfitStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12.0,),
                AutoSizeText(
                  data[index]['entry']['title'] as String? ?? '',
                  maxLines: 2,
                  style: outfitStyle.copyWith(
                    color: theme.titleTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ),
      ):const NotFound(),
      error: (error, stackTrace) => const Error1(),
      loading: () => SizedBox(
          height: screenSize.height * .4,
          child: const LoadingWidget(color: primaryColor,)),
    );
  }

}
