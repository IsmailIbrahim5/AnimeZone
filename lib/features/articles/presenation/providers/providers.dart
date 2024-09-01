import 'package:animezone/features/articles/domain/models/forum.dart';
import 'package:animezone/features/articles/domain/models/news.dart';
import 'package:animezone/features/articles/data/repository/article_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/discussion.dart';

part 'providers.g.dart';

final articleRepositoryProvider = Provider<ArticleRepository>(
      (ref) => ArticleRepository(
    ref: ref,
  ),
);


@Riverpod(keepAlive: true)
Future<NewsContainer> recentNews(
    RecentNewsRef ref, {
      String filters = '',
      int? page,
    }) {
  return ref.read(articleRepositoryProvider).getRecentNews(filters: filters , page:page);
}

@Riverpod(keepAlive: true)
Future<NewsContainer> tagNews(
    TagNewsRef ref, {
      String filters = '',
      required String tag,
      int? page,
    }) {
  return ref.read(articleRepositoryProvider).getTagNews(filters: filters ,tag: tag , page:page);
}


@Riverpod(keepAlive: true)
Future<ForumContainer> forums(
    ForumsRef ref, {
      bool? recent,
      int? id,
      bool? isSeries,
      int? page
    }) {

  return ref.read(articleRepositoryProvider).getForums(recent: recent , id:  id ,isSeries: isSeries, page: page);
}


@Riverpod(keepAlive: true)
Future<Discussion> discussion(
    DiscussionRef ref, {
      required int id,
      int? page
    }) {
  return ref.read(articleRepositoryProvider).getDiscussion(id: id, page: page);
}