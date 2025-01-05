import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/core/widgets/loading_widget.dart';
import 'package:animezone/features/articles/presenation/pages/collection_details.dart';
import 'package:animezone/features/element/presentation/providers/providers.dart';
import 'package:animezone/features/element/presentation/widgets/forum_page.dart';
import 'package:animezone/features/element/presentation/widgets/news_page.dart';
import 'package:animezone/features/articles/presenation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/error.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArticlePage extends ConsumerWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final currentSeason = ref.watch(currentSeasonProvider);
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * (6 / 63)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const RecentNews(),
            const SizedBox(height: 32),
            TagNews(
              tag: 'new_anime',
              title: AppLocalizations.of(context)!.newAnimeNews,
            ),
            const SizedBox(height: 32),
            currentSeason.when(
              data: (data) => TagNews(
                tag: data.toLowerCase().replaceAll(' ', '_'),
                title: data,
              ),
              error: (error, stackTrace) => const SizedBox(),
              loading: () => const LoadingWidget(color: primaryColor,),
            ),
            const SizedBox(height: 32),
            const RecentForums(),
            const SizedBox(height: 32),
            const NewForums(
              type: 'anime',
            ),
            const SizedBox(height: 32),
            const NewForums(
              type: 'manga',
            ),
          ],
        ),
      ),
    );
  }
}

class RecentNews extends ConsumerWidget {
  const RecentNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(applicationThemeProvider);
    final screenSize = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.recentNews,
                style: outfitStyle.copyWith(
                    color: theme.titleTextColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 22.0),
              ),
              InkWell(
                highlightColor: theme.primaryColor.withOpacity(.1),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CollectionDetails(
                    type: 'news',
                    tag: 'recent',
                  ),
                )),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    AppLocalizations.of(context)!.more,
                    style: montserratStyle.copyWith(
                      color: primaryColor.withOpacity(.6),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        SizedBox(
          height: screenSize.height * .2 * 3 + (8 * 3),
          child: ref.watch(recentNewsProvider()).when(
                data: (data) => Column(
                    children: List.generate(
                  data.data.length > 3 ? 3 : data.data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 4.0),
                    child: NewsWidget(
                      news: data.data[index],
                      mini: true,
                    ),
                  ),
                )),
                error: (error, stackTrace) => const Error1(),
                loading: () => const LoadingWidget(
                  color: primaryColor,
                ),
              ),
        )
      ],
    );
  }
}

class TagNews extends ConsumerWidget {
  final String tag;
  final String title;
  const TagNews({super.key, required this.tag, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(applicationThemeProvider);
    final screenSize = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: outfitStyle.copyWith(
                    color: theme.titleTextColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 22.0),
              ),
              InkWell(
                highlightColor: theme.primaryColor.withOpacity(.1),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CollectionDetails(
                    type: 'news',
                    tag: tag,
                  ),
                )),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    AppLocalizations.of(context)!.more,
                    style: montserratStyle.copyWith(
                      color: primaryColor.withOpacity(.6),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        SizedBox(
          height: screenSize.height * .2 * 3 + (8 * 3),
          child: ref.watch(tagNewsProvider(tag: tag)).when(
                data: (data) => Column(
                    children: List.generate(
                  data.data.length > 3 ? 3 : data.data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 4.0),
                    child: NewsWidget(
                      news: data.data[index],
                      mini: true,
                    ),
                  ),
                )),
                error: (error, stackTrace) => const Error1(),
                loading: () => const LoadingWidget(
                  color: primaryColor,
                ),
              ),
        )
      ],
    );
  }
}

class RecentForums extends ConsumerWidget {
  const RecentForums({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(applicationThemeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.recentForums,
                style: outfitStyle.copyWith(
                    color: theme.titleTextColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 22.0),
              ),
              InkWell(
                highlightColor: theme.primaryColor.withOpacity(.1),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CollectionDetails(
                    type: 'forums',
                    tag: 'recent',
                  ),
                )),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    AppLocalizations.of(context)!.more,
                    style: montserratStyle.copyWith(
                      color: primaryColor.withOpacity(.6),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ref.watch(forumsProvider(recent: true)).when(
              data: (data) => Column(
                  children: List.generate(
                      ((data.data.length > 5 ? 5 : data.data.length) * 2) - 1,
                      (index) => index % 2 == 0
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 4.0),
                              child: ForumWidget(forum: data.data[index ~/ 2]),
                            )
                          : Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 48.0),
                              height: .5,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  accentColor,
                                  Colors.transparent,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )),
                            ))),
              error: (error, stackTrace) => const Error1(),
              loading: () => const LoadingWidget(
                color: primaryColor,
              ),
            )
      ],
    );
  }
}

class NewForums extends ConsumerWidget {
  final String type;
  const NewForums({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(applicationThemeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${type == 'anime' ? AppLocalizations.of(context)!.newAnimeForums : AppLocalizations.of(context)!.newMangaForums}',
                style: outfitStyle.copyWith(
                    color: theme.titleTextColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 22.0),
              ),
              InkWell(
                highlightColor: theme.primaryColor.withOpacity(.1),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CollectionDetails(
                    type: 'forums',
                    tag: type,
                  ),
                )),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
    AppLocalizations.of(context)!.more,
                    style: montserratStyle.copyWith(
                      color: primaryColor.withOpacity(.6),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ref
            .watch(forumsProvider(isSeries: true, id: type == 'anime' ? 1 : 4))
            .when(
              data: (data) => Column(
                  children: List.generate(
                      ((data.data.length > 5 ? 5 : data.data.length) * 2) - 1,
                      (index) => index % 2 == 0
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 4.0),
                              child: ForumWidget(forum: data.data[index ~/ 2]),
                            )
                          : Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 48.0),
                              height: .5,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  accentColor,
                                  Colors.transparent,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )),
                            ))),
              error: (error, stackTrace) => const Error1(),
              loading: () => const LoadingWidget(
                color: primaryColor,
              ),
            )
      ],
    );
  }
}
