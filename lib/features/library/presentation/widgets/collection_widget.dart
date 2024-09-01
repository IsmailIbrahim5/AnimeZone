import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/styles/styles.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/widgets/background.dart';
import '../../../../core/widgets/error.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../element/data/repository/element_repository.dart';
import '../../../element/presentation/providers/providers.dart';
import '../pages/collection_details.dart';

class CollectionWidget extends ConsumerWidget {
  final List<int> animeIds;
  final String name;
  final ElementType elementType;
  const CollectionWidget({super.key, required this.animeIds , required this.name , required this.elementType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CollectionDetails(title: name, elementIds: animeIds,
        elementType: elementType,
      ),)),
      child: Column(
        children: [
          Container(
              height: screenSize.height * .2,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(14.0),
                // border: Border.all(color: primaryColor,width: 1.0)
              ),
              clipBehavior: Clip.antiAlias,
              child: Row(
                children: [
                  Expanded(
                      child: loadImage(animeIds[0], ref)),
                  const SizedBox(
                    width: 2.0,
                  ),
                  Expanded(
                      child: Column(
                        children: [
                          Expanded(
                              child:loadImage(animeIds.length > 1 ?animeIds[1] : null, ref)),
                          const SizedBox(
                            height: 2.0,
                          ),
                          Expanded(
                              child: loadImage(animeIds.length > 2 ?animeIds[2] : null, ref)),
                        ],
                      ))
                ],
              )),
          const SizedBox(height: 8.0,),
          Text(
            name,
            style: outfitStyle.copyWith(
                color: theme.textColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w700
            ),
          )
        ],
      ),
    );
  }

  Widget loadImage (int? animeId , WidgetRef ref){
    return Stack(
      fit: StackFit.expand,
      children: [
        const Background(),
        ref.watch(elementPicturesProvider(id: animeId??0 , elementType: elementType)).when(data: (data) => CachedNetworkImage(imageUrl: data.first.largeImageUrl ?? '' , fit: BoxFit.cover,), error: (error, stackTrace) =>const Error1(),loading: () => const LoadingWidget(),),
      ],
    );
  }
}
