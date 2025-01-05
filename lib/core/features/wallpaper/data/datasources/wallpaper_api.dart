
import 'package:animezone/core/constants/constants.dart';

class WallpaperAPI{
  // static Uri getWallpaper({required String q})=> Uri.https(
  //   CSAPIBaseUrl,
  //   '/customsearch/v1',
  //   {
  //     'q': q,
  //     'key': CSAPIKey,
  //     'cx': CSId,
  //     'searchType' :  'image',
  //     'imgSize': 'xxlarge'
  //   },
  // );

  static Uri getWallpaper({required String q})=> Uri.https(
    WALLHAVENAPIBaseUrl,
    '/api/v1/search',
    {
      'q': q,
      'categories': '010',
      'purity': '100',
      'sorting': 'relevance',
      'order': 'desc',
    },
  );

}