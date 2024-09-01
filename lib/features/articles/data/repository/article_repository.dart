import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/features/articles/domain/models/news.dart';
import 'package:animezone/features/articles/data/datasources/article_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/forum.dart';
import '../../domain/models/discussion.dart';

class ArticleRepository{
  final ProviderRef<ArticleRepository> ref;

  const ArticleRepository({required this.ref});

  Future<NewsContainer> getRecentNews ({String filters = '' , int?page})=> getNews(ArticleApi.getRecentNews(filters: filters,page: page));
  Future<NewsContainer> getTagNews ({String filters = '' , required String tag , int? page})=> getNews(ArticleApi.getTagNews(filters: filters , tag: tag,page: page));

  Future<NewsContainer> getNews(Uri url)async{
    final dio = ref.read(dioProvider);

    try {
      final response = await dio.requestUri(url);
      Map<String, dynamic> forumData = response.data as Map<String, dynamic>;

      return NewsContainer.fromJson(forumData);
    }catch (e){
      print(e);
      rethrow;
    }
  }

  Future<ForumContainer> getForums ({ bool? recent,
    int? id,
    bool? isSeries,
    int? page
  }) async{

    final dio = ref.read(dioProvider);

    try {
      final response = await dio.requestUri(ArticleApi.getForums(id: id ,isSeries: isSeries ,  recent: recent , page: page));
      List<Map<String, dynamic>> forumData = List<
          Map<String, dynamic>>.from(response.data as List<dynamic>);

      return ForumContainer.fromJson(
        {
          'last_visible_page': 100,
          'data': forumData
        }
      );
    }catch (e){
      print(e);
      rethrow;
    }
  }


  Future<Discussion> getDiscussion({required int id , int? page}) async{
    final dioClient = ref.read(dioProvider);
    try {
      final response = await dioClient.getUri(ArticleApi.getDiscussion(id: id, page: page));
      Map<String, dynamic> reviewsData = response.data as Map<String, dynamic>;

      return Discussion.fromJson(reviewsData);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}