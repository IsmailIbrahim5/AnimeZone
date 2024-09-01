import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/not_found.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/styles/styles.dart';
import '../../../../core/widgets/background.dart';
import '../../../../core/widgets/error.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../pages/element_details.dart';

class RelationsPage extends ConsumerStatefulWidget {
  final int id;
  final ElementType elementType;
  const RelationsPage({super.key, required this.id, required this.elementType});

  @override
  ConsumerState<RelationsPage> createState() => _RelationsPageState();
}

class _RelationsPageState extends ConsumerState<RelationsPage> {
  int relationIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(applicationThemeProvider);
    final screenSize = MediaQuery.sizeOf(context);
    final relations = ref.watch(elementRelationsProvider(id: widget.id , elementType: widget.elementType));
    return relations.when(data: (data) => data.isNotEmpty ? Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme.foregroundColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: DropdownButton(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              dropdownColor: theme.foregroundColor,
              borderRadius: BorderRadius.circular(12.0),
              value: data[relationIndex]['relation'],
              underline: const SizedBox(),
              items: List<String>.from(data
                  .map(
                    (e) => e['relation'],
              )
                  .toList())
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Center(
                    child: Text(
                      value,
                      style: outfitStyle.copyWith(
                          color: data[relationIndex]
                          ['relation'] ==
                              value
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
              onChanged: (value) {
                setState(() {
                  relationIndex =data.indexWhere(
                          (element) => element['relation'] == value);
                });
              },
            ),
          ),
         GridView.builder(
                itemCount: (data[relationIndex]['entry']
                as List<dynamic>)
                    .length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,
                    mainAxisExtent: screenSize.height * .375),

                itemBuilder: (BuildContext context, int index){
                  Map<String, dynamic> relationData = (data[relationIndex]['entry']
                  as List<dynamic>)
                      .elementAt(index) as Map<String, dynamic>;

                  final type = relationData ['type'] as String;

                  final image = ref.watch(elementPicturesProvider(id: relationData['mal_id'] as int ,elementType: widget.elementType));

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ElementDetails(id: relationData['mal_id'] as int,elementType: type == 'anime' ? ElementType.anime: ElementType.manga,),));
                    },

                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              width: double.infinity,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: theme.foregroundColor),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  const Background(),
                                  image.when(data: (data) => CachedNetworkImage(
                                    imageUrl: data.first.imageUrl!,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const LoadingWidget(),
                                  ), error: (error, stackTrace) => const Error1(), loading: () => const LoadingWidget(),),
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
                                        type.toUpperCase(),
                                        style: outfitStyle.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0,),
                          Expanded(
                            flex: 1,
                            child: Text(
                              relationData['name'] as String,
                              style: outfitStyle.copyWith(
                                  fontSize: 14.0,
                                  color: theme.titleTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            ),
        ],
      ),
    ) : const NotFound(), error: (error, stackTrace) => const SizedBox(), loading: () => SizedBox(
      height: screenSize.height * .4,
        child: const LoadingWidget(color: primaryColor,)),);
  }
}
