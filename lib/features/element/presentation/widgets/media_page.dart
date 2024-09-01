import 'package:animezone/core/models/video.dart';
import 'package:animezone/core/widgets/error.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:animezone/features/element/presentation/widgets/trailer_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/styles/styles.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/widgets/background.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/full_image_view.dart';

class MediaPage extends ConsumerWidget {
  final int id;
  final ElementType elementType;
  const MediaPage({super.key, required this.id,required this.elementType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(applicationThemeProvider);
    final screenSize = MediaQuery.sizeOf(context);
    final pictures = ref.watch(elementPicturesProvider(id: id , elementType: elementType));
    final videos = elementType == ElementType.anime ?ref.watch(animeVideosProvider(id: id)): null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PICTURES',
            style: oswaldStyle.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          pictures.when(
            data: (data) => data.isEmpty?
            Center(
              child: Column(
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
            )
                :Column(
              children: List.generate(
                  (data.length / 2).round(),
                  (row) => Row(
                        children: List.generate(
                          data.length - (row * 2) > 2 ? 2 : 1,
                          (column) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, top: 8.0, bottom: 8.0),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) => FullImageView(
                                      imageUrl: data[(row * 2) + column]
                                          .largeImageUrl!),
                                )),
                                child: Hero(
                                  tag:
                                      'image_${data[(row * 2) + column].largeImageUrl!}',
                                  child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: theme.foregroundColor),
                                      child: CachedNetworkImage(
                                        imageUrl: data[(row * 2) + column]
                                            .largeImageUrl!,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const AspectRatio(
                                          aspectRatio: 0.7,
                                          child: Stack(
                                            children: [
                                              Background(),
                                              Center(child: LoadingWidget())
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
            ),
            error: (error, stackTrace) => const Error1(),
            loading: () => SizedBox(
              height: screenSize.height * .125,
              child: const LoadingWidget(
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          if(videos!=null)
          ...[
          Text(
            'PROMOS',
            style: oswaldStyle.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
          ),
          videos.when(
            data: (data) {
              final List<Video> list = data['promos']!;
              return list.isEmpty ?Center(
                child: Column(
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
              ):GridView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: screenSize.height * .17,
                    crossAxisSpacing: 8.0),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SlideTransition(
                          position: animation.drive(Tween<Offset>(
                            begin: const Offset(0.0, 1.0),
                            end: Offset.zero,
                          )),
                          child:
                          TrailerPage(id: list[index].trailer?.id ?? '9bZkp7q19f0'),
                        ),
                  )),
                  child: Hero(
                    tag: 'image_${list[index].title}',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              list[index].trailer?.images?.largeImageUrl ?? '',
                          imageBuilder: (context, imageProvider) => Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              Opacity(
                                opacity: .75,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: primaryColor, width: 3.0)),
                                  child: Image.asset(
                                    'assets/icons/play.png',
                                    color: primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          placeholder: (context, url) => const AspectRatio(
                            aspectRatio: 1.5,
                            child: Stack(
                              children: [
                                Background(),
                                Center(child: LoadingWidget())
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        AutoSizeText(
                          list[index].title ?? '',
                          maxLines: 2,
                          style: outfitStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.textColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            error: (error, stackTrace) => const Error1(),
            loading: () => SizedBox(
              height: screenSize.height * .125,
              child: const LoadingWidget(
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'MUSIC VIDEOS',
            style: oswaldStyle.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
          ),
          videos.when(
            data: (data) {
              final List<Video> list = data['music_videos']!;
              return list.isEmpty ? Center(
                child: Column(
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
              ):GridView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: screenSize.height * .17,
                    crossAxisSpacing: 8.0),
                itemBuilder: (context, index) => GestureDetector(
                  // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FullImageView(imageUrl :data[(row * 2 )+ column].largeImageUrl! ),)),
                  child: Hero(
                    tag: 'image_${list[index].title}',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                          list[index].trailer?.images?.largeImageUrl ?? '',
                          imageBuilder: (context, imageProvider) => Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              Opacity(
                                opacity: .75,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: primaryColor, width: 3.0)),
                                  child: Image.asset(
                                    'assets/icons/play.png',
                                    color: primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          placeholder: (context, url) => const AspectRatio(
                            aspectRatio: 1.5,
                            child: Stack(
                              children: [
                                Background(),
                                Center(child: LoadingWidget())
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        AutoSizeText(
                          list[index].title ?? '',
                          maxLines: 2,
                          style: outfitStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.textColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            error: (error, stackTrace) => const SizedBox(),
            loading: () => SizedBox(
              height: screenSize.height * .125,
              child: const LoadingWidget(
                color: primaryColor,
              ),
            ),
          ),
            ],
        ],
      ),
    );
  }
}
