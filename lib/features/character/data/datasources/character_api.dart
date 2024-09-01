import 'package:animezone/core/constants/constants.dart';

class CharacterAPI {
  const CharacterAPI();

  static Uri getCharacterSearch(
      {String? q,
        int? page,
        int? limit,
        String? orderBy,
        bool asc = true,
        String? letter}){
    return Uri.https(
          JIKANAPIBaseUrl,
          '/v4/anime',
          {
            if(q != null) 'q': q,
            if (page != null) 'page': '$page',
            if (limit != null) 'limit': '$limit',
            if (orderBy != null) 'order_by': orderBy,
            'sort': asc ? 'asc' : 'desc',
            if (letter != null) 'letter': letter,
          },
        );
  }


  static Uri getCharacterFull(int id,) => Uri.https(JIKANAPIBaseUrl, '/v4/characters/$id/full',);


  static Uri getCharacterTop(
      {int? page,
        int? limit,}) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/top/characters',
        {
          if (page != null) 'page': '$page',
          if (limit != null) 'limit': '$limit',
        },
      );

  static Uri getCharacterPictures(int id) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/characters/$id/pictures',
      );

  static Uri getCharacterAnime(int id) =>
      Uri.https(
        JIKANAPIBaseUrl,
        '/v4/characters/$id/anime',
      );
}
