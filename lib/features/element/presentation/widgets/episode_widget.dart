import 'dart:ui';

import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/error.dart';
import 'package:animezone/core/widgets/safe_cached_image.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/presentation/pages/element_details.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config/styles/styles.dart';
import '../../../../core/widgets/background.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/sequence_animation_builder.dart';
import '../../domain/models/anime.dart';
import '../../domain/models/episode.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/providers.dart';

class EpisodeWidget1 extends ConsumerWidget {
  final Episode episode;
  const EpisodeWidget1({super.key, required this.episode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => ElementDetails(id: episode.animeData!['mal_id'] as int, elementType: ElementType.anime,),));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        height: screenSize.height * .115,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: theme.foregroundColor,
                    boxShadow: [
                      BoxShadow(
                          color: primaryColor.withOpacity(.2), blurRadius: 4.0)
                    ]),
                child: SafeCachedImage(
                  imageUrl: episode.image?.imageUrl,
                  fit: BoxFit.fill,
                  placeholder: const LoadingWidget(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          episode.animeData!['title'].toString(),
                          maxLines: 3,
                          style: montserratStyle.copyWith(
                              fontSize: 14.0,
                              color: theme.titleTextColor,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        AutoSizeText(
                          'Episode ${episode.malId}, ${episode.title}',
                          maxLines: 2,
                          style: outfitStyle.copyWith(
                              fontSize: 10.0, color: theme.textColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (episode.duration != null)
                          Row(children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: theme.hintTextColor,
                              size: 12.0,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              episode.duration == null
                                  ? '-'
                                  : '${((episode.duration ?? 0) / 60).ceil()} Minutes',
                              style: outfitStyle.copyWith(
                                color: theme.hintTextColor,
                                fontSize: 10.0,
                              ),
                            ),
                          ]),
                        Row(
                          children: [
                            if (episode.filler ?? false) ...[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2.0),
                                child: Text(
                                  'FILLER',
                                  style: montserratStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 8.0),
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                            ],
                            if (episode.recap ?? false)
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2.0),
                                child: Text(
                                  'RECAP',
                                  style: montserratStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 10.0),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String covertDuration(int duration) =>
      '${(duration / 60).ceil()}:${duration % 60}';
}

class EpisodeWidget2 extends ConsumerWidget {
  final Episode episode;
  final Anime anime;
  const EpisodeWidget2({super.key, required this.episode, required this.anime});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);

    return GestureDetector(
      onTap: () {
        _showContactUs(context, ref);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        width: screenSize.width,
        child: Row(
          children: [
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  episode.malId.toString(),
                  style: reggaeStyle.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 14.0),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              flex: 5,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: theme.foregroundColor,
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 4.0)
                    ]),
                child: episode.image == null
                    ? Container(
                        color: primaryColor,
                        child: AspectRatio(
                          aspectRatio: 1.6,
                          child: Center(
                            child: Transform.scale(
                              scale: .5,
                              child: Image.asset(
                                'assets/icons/anime.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    : AspectRatio(
                        aspectRatio: 1.6,
                        child: SafeCachedImage(
                          imageUrl: episode.image?.imageUrl ?? '',
                          fit: BoxFit.fill,
                          placeholder:  const LoadingWidget(
                            color: primaryColor,
                          ),
                        ),
                      ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episode.title,
                      style: outfitStyle.copyWith(
                          fontSize: 10.0,
                          color: theme.titleTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                    if (episode.romanjiTitle != null)
                      Text(
                        '${episode.romanjiTitle}',
                        style: outfitStyle.copyWith(
                            fontSize: 10.0, color: theme.textColor,),
                      ),
                    if (episode.japaneseTitle != null)
                      Text(
                        '(${episode.japaneseTitle})',
                        style: reggaeStyle.copyWith(
                            fontSize: 10.0, color: theme.textColor,),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              // child: AutoSizeText(
              //
              //   DateFormat.yMMMEd().format(DateTime.tryParse(episode.aired??'')!).toString(),
              //   style: outfitStyle.copyWith(
              //     color: Colors.black38
              //   ),
              // ),
              child: Center(
                child: AutoSizeText(
                  (episode.score ?? 0).toString(),
                  style: outfitStyle.copyWith(
                    color:
                        (episode.score ?? 0) > 2.0 && (episode.score ?? 0) < 3.0
                            ? Colors.amber
                            : (episode.score ?? 0) > 3.0
                                ? Colors.green
                                : Colors.redAccent,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
          ],
        ),
      ),
    );
  }

  void _showContactUs(BuildContext context, WidgetRef ref){
    final theme = ref.watch(applicationThemeProvider);
    final SequenceAnimationController controller = SequenceAnimationController();
    showDialog(context: context, builder: (context) => SequenceAnimationBuilder(
      controller: controller,
      animations: 6,
      repeat: false,
      endCallback: (){
        if(controller.completed) {
          Navigator.pop(context);
        }
      },
      builder: (values, [child]) =>  GestureDetector(
        onTap: () {
          controller.reverse?.call();
        },
        child: Material(
          color: primaryColor.withOpacity(values[0] * .5),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: values[0].clamp(0.00001, 1) * 3 , sigmaY: values[0].clamp(0.00001, 1) * 3),
            child: FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: Curves.easeOutBack.transform(values[1])*.75,
              heightFactor: values[1] ,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: theme.foregroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(.25),
                          blurRadius: 24.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(24.0)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 12.0,
                    children: [
                      Image.asset(
                        'assets/images/yay.png',
                        width: Curves.easeOutBack.transform(values[2]) * 50.0,
                        height: Curves.easeOutBack.transform(values[2]) * 50.0,
                      ),
                      Transform.scale(
                        scale:Curves.easeOutBack.transform(values[3]),
                        child: Text(
                          AppLocalizations.of(context)!.tip2,
                          style: outfitStyle.copyWith(
                              color: theme.titleTextColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 18.0
                          ),
                        ),
                      ),
                      Transform.scale(
                        scale:Curves.easeOutBack.transform(values[3]),
                        child: ref.watch(animeStreamingProvider(id: anime.malId)).when(data: (data) => GridView.builder(
                            itemCount: data.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.78,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 12.0),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  if (!await launchUrl(Uri.parse(
                                      data[index]['url'] as String))) {
                                    throw Exception('Could not launch url');
                                  }
                                },
                                child: Builder(
                                    builder: (context) {
                                      final List<String> knownStreaming = [
                                        'Netflix',
                                        'Crunchyroll',
                                        'Funimation',
                                        'Shahid',
                                        'HIDIVE',
                                        'Akiba Pass TV',
                                        'Ani-One Asia',
                                        'Anime Digital Network',
                                        'Aniplus TV',
                                        'Bilibili Global',
                                        'iQIYI'
                                      ];
                                      return Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16.0),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: data[index]['name'] == '' || !knownStreaming.contains(data[index]['name']) ? Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              const Background(),
                                              Text(
                                                data[index]['name'] as String,
                                                style: outfitStyle.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ):Image.asset(
                                            switch (data[index]['name']) {
                                              'Netflix' => 'assets/images/netflix.jpg',
                                              'Crunchyroll' =>
                                              'assets/images/crunchyroll.jpg',
                                              'Funimation' =>
                                              'assets/images/funimation.jpg',
                                              'Shahid' => 'assets/images/shahid.jpg',
                                              'HIDIVE' => 'assets/images/hidive.jpg',
                                              'Akiba Pass TV' =>
                                              'assets/images/akiba_pass.jpg',
                                              'Ani-One Asia' => 'assets/images/anione.jpg',
                                              'Anime Digital Network' =>
                                              'assets/images/adn.jpg',
                                              'Aniplus TV' => 'assets/images/aniplus.jpg',
                                              'Bilibili Global' =>
                                              'assets/images/bilibili.jpg',
                                              'iQIYI' => 'assets/images/iqiyi.jpg',
                                              _ => '',
                                            },

                                          ));
                                    }
                                ),
                              );
                            }), error: (error, stackTrace) => const Error1(), loading: () => const LoadingWidget(),),
                      )


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  String covertDuration(int duration) =>
      '${(duration / 60).ceil()}:${duration % 60}';
}
