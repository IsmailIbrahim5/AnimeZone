
import 'package:animezone/core/constants/constants.dart';

class WallpaperAPI{
  static Uri getWallpaper({required String q})=> Uri.https(
    CSAPIBaseUrl,
    '/customsearch/v1',
    {
      'q': q,
      'key': CSAPIKey,
      'cx': CSId,
      'searchType' :  'image',
      'imgSize': 'xxlarge'
    },
  );

}