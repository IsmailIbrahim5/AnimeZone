import 'package:animezone/core/models/app_theme.dart';
import 'package:animezone/core/widgets/background.dart';
import 'package:animezone/core/widgets/error.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:animezone/features/character/presentation/pages/character_details.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/styles/styles.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/widgets/loading_widget.dart';

class CharactersPage extends ConsumerWidget {
  final int id;
  final ElementType elementType;
  const CharactersPage({super.key, required this.id, required this.elementType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characters = ref.watch(elementCharactersProvider(id: id ,elementType: elementType));
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return characters.when(
      data: (data) => data.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategory(
                        data
                            .where(
                              (element) => element['role'] == 'Main',
                            )
                            .toList(),
                        theme: theme,
                        screenSize: screenSize,
                        title: 'MAIN'),
                    const SizedBox(
                      height: 32.0,
                    ),
                    _buildCategory(
                        data
                            .where(
                              (element) => element['role'] == 'Supporting',
                            )
                            .toList(),
                        theme: theme,
                        screenSize: screenSize,
                        title: 'SUPPORTING'),
                  ]),
            )
          : SizedBox(
              height: screenSize.height * .4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: screenSize.height * .125,
                      child: Image.asset('assets/images/not_found.png')),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Couldn't find anything",
                    style: outfitStyle.copyWith(
                        color: theme.textColor, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
      error: (error, stackTrace) => const Error1(),
      loading: () => SizedBox(
          height: screenSize.height * .4,
          child: const LoadingWidget(
            color: primaryColor,
          )),
    );
  }

   final _loading =   const Stack(
    fit: StackFit.expand,
    children: [
      Background(),
      LoadingWidget(),
    ],
  );

  Widget _buildCategory(List<Map<String, dynamic>> characters,
          {required AppTheme theme,
          required Size screenSize,
          required String title}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: oswaldStyle.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 8.0,
                  mainAxisExtent: screenSize.height * .25),
              itemCount: characters.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CharacterDetails(
                          characterId:
                              characters[index]['character']['mal_id'] as int),
                    )),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),

                                child: CachedNetworkImage(
                                  imageUrl: characters[index]['character']
                                              ['images']['jpg']['image_url']
                                          as String? ??
                                      '',
                                  placeholder: (context, url) =>
                                     _loading,
                                  fit: BoxFit.cover,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        AutoSizeText(
                          characters[index]['character']['name'] as String,
                          maxLines: 1,
                          style: outfitStyle.copyWith(
                              color: theme.textColor,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )),
        ],
      );
}
