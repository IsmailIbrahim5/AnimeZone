import 'package:animezone/core/widgets/background.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/element/domain/models/anime.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/models/manga.dart';
import '../../domain/models/element.dart' as elem;
import '../../../../config/styles/styles.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/widgets/cross_fade_switcher.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/selector.dart';

class OverviewPage extends ConsumerStatefulWidget {
  final elem.Element element;
  const OverviewPage({super.key, required this.element});

  @override
  ConsumerState<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends ConsumerState<OverviewPage> {
  int themesIndex = 0;
  int relationIndex = 0;
  @override
  Widget build(BuildContext context) {
    var element = widget.element;

    final theme = ref.watch(applicationThemeProvider);
    final fullElement = ref.watch(fullElementProvider(
        id: widget.element.malId,
        elementType:
            widget.element is Anime ? ElementType.anime : ElementType.manga));

    final screenSize = MediaQuery.sizeOf(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'INFO',
              style: oswaldStyle.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Column(
              children: [
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    SizedBox(
                      width: screenSize.width * .225,
                      child: Text(
                        'AIRED',
                        style: montserratStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.textColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Builder(builder: (context) {
                      Map<String, dynamic> dates = {};
                      if (element is Anime) dates = element.aired;
                      if (element is Manga) dates = element.published;
                      return Text(
                        switch (widget.element) {
                          Anime anime =>
                            '${formatDate(anime.aired['from'] as String? ?? '')} -> ${(anime.aired['to']) == null ? 'Current' : formatDate(anime.aired['to'] as String? ?? '')}',
                          Manga manga =>
                            '${formatDate(manga.published['from'] as String? ?? '')} -> ${(manga.published['to']) == null ? 'Current' : formatDate(manga.published['to'] as String? ?? '')}',
                          _ => ''
                        },
                        style: montserratStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          color: theme.textColor,
                          fontSize: 12.0,
                        ),
                      );
                    }),
                  ],
                ),
                if (element is Anime && element.season != null) ...[
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      SizedBox(
                        width: screenSize.width * .225,
                        child: Text(
                          'SEASON',
                          style: montserratStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.textColor,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Text(
                        (element.season ?? '')[0].toUpperCase() +
                            (element.season ?? '').substring(1),
                        style: montserratStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          color: theme.textColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
                if (widget.element.genres.isNotEmpty) ...[
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      SizedBox(
                        width: screenSize.width * .225,
                        child: Text(
                          'GENRES',
                          style: montserratStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.textColor,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.element.genres
                              .map(
                                (e) => e['name'],
                              )
                              .toList()
                              .join(', '),
                          style: montserratStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: theme.textColor,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    SizedBox(
                      width: screenSize.width * .225,
                      child: Text(
                        'RATING',
                        style: montserratStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.textColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Text(
                      switch (widget.element) {
                        Anime anime => anime.rating ?? '-',
                        Manga manga => (manga.chapters ?? '-').toString(),
                        _ => ''
                      },
                      style: montserratStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        color: theme.textColor,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    SizedBox(
                      width: screenSize.width * .225,
                      child: Text(
                        widget.element is Anime ? 'SOURCE' : 'CHAPTERS',
                        style: montserratStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.textColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Text(
                      switch (widget.element) {
                        Anime anime => anime.source ?? '-',
                        Manga manga => (manga.chapters ?? '-').toString(),
                        _ => ''
                      },
                      style: montserratStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        color: theme.textColor,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                if (widget.element.demographics.isNotEmpty) ...[
                  const SizedBox(height: 8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenSize.width * .225,
                        child: Text(
                          'DEMO',
                          style: montserratStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.textColor,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Text(
                        widget.element.demographics
                            .map(
                              (e) => e['name'],
                            )
                            .toList()
                            .join(', '),
                        style: montserratStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          color: theme.textColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width * .225,
                      child: Text(
                        widget.element is Anime ? 'STUDIOS' : 'AUTHORS',
                        style: montserratStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.textColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        (switch (widget.element) {
                          Anime anime => anime.studios,
                          Manga manga => manga.authors,
                          _ => [],
                        })!
                            .map(
                              (e) => e['name'],
                            )
                            .toList()
                            .join(', '),
                        style: montserratStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          color: theme.textColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      Container(
          height: screenSize.height * .15,
          margin: const EdgeInsets.all(16.0),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(24.0),
          //   color: Colors.white,
          //   boxShadow:  [
          //     BoxShadow(
          //       color: primaryColor.withOpacity(.15),
          //       blurRadius: 16.0,
          //     )
          //   ]
          // ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.green,
                            size: 40.0,
                          ),
                          Column(
                            children: [
                              Text(
                                (widget.element.score ?? '-').toString(),
                                style: montserratStyle.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20.0,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.groups_2_outlined,
                                    size: 12.0,
                                    color: theme.titleTextColor,
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    NumberFormat('###,###,###')
                                        .format(widget.element.scoredBy ?? 0)
                                        .toString(),
                                    style: montserratStyle.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 8.0,
                                      color: theme.titleTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                    Container(
                      width: 1,
                      height: screenSize.height * .05,
                      color: primaryColor.withOpacity(.1),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                                    colors: [red, redAccent],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)
                                .createShader(bounds),
                            child: Image.asset(
                              'assets/icons/heart_fill.png',
                              height: 40.0,
                              width: 40.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            NumberFormat('###,###,###')
                                .format(widget.element.favorites ?? '0')
                                .toString(),
                            style: montserratStyle.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 20.0,
                              color: Color.lerp(red, redAccent, .5),
                            ),
                          ),
                        ],
                      ),
                    )),
                    Container(
                      width: 1,
                      height: screenSize.height * .05,
                      color: primaryColor.withOpacity(.1),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.local_fire_department_rounded,
                            color: Colors.orangeAccent,
                            size: 40.0,
                          ),
                          Text(
                            '#${NumberFormat('###,##,###').format(widget.element.popularity ?? 0).toString()}',
                            style: montserratStyle.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 20.0,
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ],
          )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SYNOPSIS',
              style: oswaldStyle.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              widget.element.synopsis ?? '',
              style: montserratStyle.copyWith(
                color: theme.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              ),
            )
          ],
        ),
      ),
      if (widget.element.background != null &&
          widget.element.background!.isNotEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BACKGROUND',
                style: oswaldStyle.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                widget.element.background!,
                style: montserratStyle.copyWith(
                  color: theme.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                ),
              )
            ],
          ),
        ),
      fullElement.when(
        data: (data) => Column(children: [
          if (data is Anime  && data.theme != null && data.theme!.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'THEMES',
                    style: oswaldStyle.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Selector(
                    initialValue: 'OPENINGS',
                    dismissible: false,
                    values: const ['OPENINGS', 'ENDINGS'],
                    callback: (index) {
                      setState(() {
                        themesIndex = index;
                      });
                    },
                  ),
                  const SizedBox(height: 12.0),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: screenSize.width,
                      maxWidth: screenSize.width,
                      minHeight: 10,
                      maxHeight: screenSize.height * .5,
                    ),
                    child: CrossFadeSwitcher(
                      next: themesIndex == 0,
                      child: themesIndex == 0
                          ? ListView.separated(
                              shrinkWrap: true,
                              key: const ValueKey('themes_0'),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final String name =
                                    ((data.theme!.values.elementAt(0) as List)
                                            .elementAt(index) as String)
                                        .substring(3);
                                final firstSplit = name.split(' by ');
                                final themeName = firstSplit[0];
                                final secondSplit =
                                    firstSplit[1].split(' (eps ');
                                final artist = secondSplit[0];

                                final eps = secondSplit.length > 1
                                    ? secondSplit[1].replaceAll(')', '')
                                    : null;

                                return Row(
                                  children: [
                                    Text(
                                      '${(index + 1) >= 10 ? index + 1 : ' ${index + 1} '}',
                                      style: reggaeStyle.copyWith(
                                          fontSize: 20.0, color: primaryColor),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              themeName,
                                              style: outfitStyle.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: theme.textColor),
                                            ),
                                            Text(
                                              artist,
                                              style: outfitStyle.copyWith(
                                                  fontWeight: FontWeight.w300,
                                                  color: primaryColor,
                                                  fontSize: 12.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (eps != null)
                                      Text(
                                        eps
                                            .replaceAll(',', '\n')
                                            .replaceAll('-', ' -> '),
                                        textAlign: TextAlign.center,
                                        style: outfitStyle.copyWith(
                                          color: theme.textColor,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Container(
                                  color: primaryColor.withOpacity(.2),
                                  height: 1.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 32.0, vertical: 8.0),
                                );
                              },
                              itemCount:
                                  (data.theme!.values.elementAt(0) as List)
                                      .length,
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        key: const ValueKey('themes_1'),
                              itemBuilder: (context, index) {
                                final String name =
                                    ((data.theme!.values.elementAt(1) as List)
                                            .elementAt(index) as String)
                                        .substring(3);
                                final firstSplit = name.split(' by ');
                                final themeName = firstSplit[0];
                                final secondSplit =
                                    firstSplit[1].split(' (eps ');
                                final artist = secondSplit[0];

                                final eps = secondSplit.length > 1
                                    ? secondSplit[1].replaceAll(')', '')
                                    : null;

                                return Row(
                                  children: [
                                    Text(
                                      '${(index + 1) >= 10 ? index + 1 : ' ${index + 1} '}',
                                      style: reggaeStyle.copyWith(
                                          fontSize: 20.0, color: primaryColor),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              themeName,
                                              style: outfitStyle.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: theme.textColor),
                                            ),
                                            Text(
                                              artist,
                                              style: outfitStyle.copyWith(
                                                  fontWeight: FontWeight.w300,
                                                  color: primaryColor,
                                                  fontSize: 12.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (eps != null)
                                      Text(
                                        eps
                                            .replaceAll(',', '\n')
                                            .replaceAll('-', ' -> '),
                                        textAlign: TextAlign.center,
                                        style: outfitStyle.copyWith(
                                          color: theme.textColor,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Container(
                                  color: primaryColor.withOpacity(.2),
                                  height: 1.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 32.0, vertical: 8.0),
                                );
                              },
                              itemCount:
                                  (data.theme!.values.elementAt(1) as List)
                                      .length,
                            ),
                    ),
                  )
                ],
              ),
            ),
          if (data is Anime && data.streaming != null && data.streaming!.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WATCH ON',
                    style: oswaldStyle.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  GridView.builder(
                      itemCount: data.streaming!.length,
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
                                data.streaming![index]['url'] as String))) {
                              throw Exception('Could not launch url');
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(
                                switch (data.streaming![index]['name']) {
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
                                errorBuilder: (context, error, stackTrace) =>
                                    Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const Background(),
                                    Text(
                                      data.streaming![index]['name'] as String,
                                      style: outfitStyle.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              )),
                        );
                      })
                ],
              ),
            ),
          if (data.external != null && data.external!.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AVAILABLE AT',
                    style: oswaldStyle.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: data.external!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        mainAxisExtent: screenSize.height * .05),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          if (!await launchUrl(Uri.parse(
                              data.external![index]['url'] as String))) {
                            throw Exception('Could not launch url');
                          }
                        },
                        child: Row(
                          children: [
                            Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  (data.external![index]['name']
                                              as String)[0] ==
                                          '@'
                                      ? 'assets/images/x.jpg'
                                      : switch (data.external![index]['name']) {
                                          'YouTube' =>
                                            'assets/images/youtube.jpg',
                                          'Wikipedia' =>
                                            'assets/images/wikipedia.jpg',
                                          'AniDB' => 'assets/images/anidb.jpg',
                                          'ANN' => 'assets/images/ann.jpg',
                                          'Bangumi' =>
                                            'assets/images/bangumi.jpg',
                                          'Baidu Baike' =>
                                            'assets/images/baidu baike.jpg',
                                          'Douban' =>
                                            'assets/images/douban.jpg',
                                          _ => 'assets/images/webite.jpg'
                                        },
                                )),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: AutoSizeText(
                                data.external![index]['name'] as String,
                                maxLines: 1,
                                style: outfitStyle.copyWith(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    color: theme.textColor),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
        ]),
        error: (error, stackTrace) => const SizedBox(),
        loading: () => const LoadingWidget(color: primaryColor),
      ),
    ]);
  }

  String formatDate(String date) =>
      DateFormat.yMMMd().format(DateTime.tryParse(date) ?? DateTime(2005));
}
