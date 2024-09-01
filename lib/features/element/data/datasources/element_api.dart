import 'package:animezone/core/constants/constants.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';

class ElementAPI {
  const ElementAPI();

  static Uri getElementSearch(
      {required String q,
        required ElementType elementType,
        bool sfw = true,
        String? status,
        bool? unapproved,
        int? page,
        int? limit,
        String? type,
        double? score,
        String? rating,
        String? ordering,
        String? genres,
      }) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/${elementType == ElementType.anime ? 'anime' : 'manga'}',
        {
          if(q.isNotEmpty) 'q': q,
          'sfw': '$sfw',
          if (unapproved != null) 'unapproved': '$unapproved',
          if (page != null) 'page': '$page',
          if (limit != null) 'limit': '$limit',
          if (type != null) 'type': type,
          if (score != null) 'score': '$score',
          if (status != null) 'status': status,
          if (rating != null) 'rating': rating,
          if (ordering != null) 'order_by': ordering,
          if(ordering != null) 'sort' : 'desc',
          if (genres != null && genres.isNotEmpty) 'genres': genres,
        },
      );


  static Uri getElement({required int id, required ElementType elementType,}) => Uri.https(JIKANAPIBaseUrl, '/v4/${elementType == ElementType.anime ? 'anime' : 'manga'}/$id',);

  static Uri getElementFull({required int id, required ElementType elementType,}) => Uri.https(JIKANAPIBaseUrl, '/v4/${elementType == ElementType.anime ? 'anime' : 'manga'}/$id/full',);
  static Uri getRandomElement({ required ElementType elementType,}) => Uri.https(JIKANAPIBaseUrl, '/v4/random/${elementType == ElementType.anime ? 'anime' : 'manga'}',);


  static Uri getElementTop(
      {
        required ElementType elementType,
        bool sfw = true,
        int? page,
        int? limit,
        String? type,
        String? rating,
        String? filter}) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/top/${elementType == ElementType.anime ? 'anime' : 'manga'}',
        {
          'sfw': '$sfw',
          if (page != null) 'page': '$page',
          if (limit != null) 'limit': '$limit',
          if (type != null) 'type': type,
          if (filter != null) 'filter': filter,
        },
      );

  static Uri getSeasonAnime({int? page}) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/seasons/now',
          {
            if(page!=null) 'page': '$page'
          }
      );

  static Uri getElementPictures({required int id , required ElementType elementType}) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/${elementType == ElementType.anime ? 'anime' : 'manga'}/$id/pictures',
      );

  static Uri getAnimeVideos(int id) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/anime/$id/videos',
      );
  static Uri getElementCharacters({required int id, required ElementType elementType }) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/${elementType == ElementType.anime ? 'anime' : 'manga'}/$id/characters',
      );
  static Uri getElementReviews({required int id, required ElementType elementType}) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/${elementType == ElementType.anime ? 'anime' : 'manga'}/$id/reviews',
      );
  static Uri getAnimeStreaming(int id) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/anime/$id/streaming',
      );
  static Uri getElementExternal({required int id , required ElementType elementType }) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/${elementType == ElementType.anime ? 'anime' : 'manga'}/$id/streaming',
      );
  static Uri getElementRecommendations({required int id , required ElementType elementType }) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/${elementType == ElementType.anime ? 'anime' : 'manga'}/$id/recommendations',
      );
  static Uri getElementRelations({required int id , required ElementType elementType }) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/${elementType == ElementType.anime ? 'anime' : 'manga'}/$id/relations',
      );
  static Uri getElementNews({required int id , required ElementType elementType }) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/${elementType == ElementType.anime ? 'anime' : 'manga'}/$id/news',
      );
  static Uri getElementForum({required int id,required ElementType elementType }) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/${elementType == ElementType.anime ? 'anime' : 'manga'}/$id/forum',
      );

  static Uri getRecentRecommendations({ required ElementType elementType}) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/recommendations/${elementType == ElementType.anime ? 'anime' : 'manga'}',
      );

  static Uri getRecentReviews({ required ElementType elementType}) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/reviews/${elementType == ElementType.anime ? 'anime' : 'manga'}',
      );

  static Uri getRecentEpisodes() =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/watch/episodes',
      );
  static Uri getAnimeEpisodes(int id) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/anime/$id/episodes',
      );
  static Uri getAnimeThemes(int id) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/anime/$id/themes',
      );
  static Uri getAnimeEpisodeById(int animeId , int episodeId) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/anime/$animeId/episodes/$episodeId',
      );
  static Uri getAnimeEpisodesImages(int animeId) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/anime/$animeId/videos/episodes',
      );

  static Uri getElementGenres({required ElementType elementType}) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/genres/${elementType == ElementType.anime ? 'anime' : 'manga'}',
      );


}
