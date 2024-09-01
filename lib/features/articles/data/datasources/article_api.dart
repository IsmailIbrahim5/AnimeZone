import 'package:animezone/core/constants/constants.dart';

class ArticleApi{
  const ArticleApi();
  static Uri getRecentNews(
      {String filters = '' , int? page})=>Uri.https(
      APIBaseUrl,
      '/news/recent',
        {
        if(filters.isNotEmpty) 'filters': filters,
          if(page !=null) 'page' : '$page'
        },
    );

  static Uri getTagNews(
      {String filters = '',required String tag, int? page }) => Uri.https(
      APIBaseUrl,
      '/news/$tag',
    {
      if(filters.isNotEmpty) 'filters': filters,
      if(page !=null) 'page' : '$page'
    },
    );
  static Uri getForums(
      { bool? recent,
        int? id,
        bool? isSeries,
        int? page
      }) => Uri.https(
    APIBaseUrl,
    '/forums',
    <String,dynamic>{
      if(recent != null) 'action': 'recent',
      if(id != null) 'id' : '$id',
      if(isSeries != null) 'type' : 'series',
      if(page != null) 'page' : '$page'
    },
  );



  static Uri getDiscussion({required int id , int? page}) =>
      Uri.https(
          APIBaseUrl,
          '/discussions/anime',
          {
            'id': '$id',
            if(page!=null) 'page': '$page'

          }
      );
}
