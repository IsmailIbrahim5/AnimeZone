
import 'package:animezone/core/features/wallpaper/data/datasources/wallpaper_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../providers/providers.dart';

class WallpaperRepository{
  final ProviderRef<WallpaperRepository> ref;

  WallpaperRepository({required this.ref});

  Map<String, String?> cachedImages = {};

  Future<String> getWallpaper({required String title, required int malId , required String type}) async{

    final dioClient = ref.read(dioProvider);
    final db = ref.read(databaseProvider);
      try {
        if (cachedImages.containsKey(title) && cachedImages[title] != null) return Future.value(cachedImages[title]);
        print(WallpaperAPI.getWallpaper(q: '$title $type'));
        final response = await dioClient.getUri(WallpaperAPI.getWallpaper(q: '$title $type'));
          final wallpapersData = List<Map<String,dynamic>>.from((response.data as Map<String,dynamic>)['items'] as List<dynamic>);
          String qualifiedImage = '';

          for (var wallpaperData in wallpapersData) {
            var data = wallpaperData['image'] as Map<String, dynamic>;
            int height = data['height'] as int;
            int width = data['width'] as int;
            if (width / height > 1.0) {
              qualifiedImage = wallpaperData['link'] as String;
              cachedImages.addAll({title: qualifiedImage});
              break;
            }
          }
          db.update(type, {'wallpaper' : qualifiedImage}, where: 'mal_id = ?' , whereArgs: [malId] , conflictAlgorithm: ConflictAlgorithm.replace);
          return qualifiedImage;
      }
      on DioException catch(e){
        if(e.type == DioExceptionType.connectionError){
          final results = await db.query(type , columns: ['wallpaper'] , where: 'mal_id = ?' , whereArgs: [malId]);
          if(results.isNotEmpty){
            return results.first['wallpaper'] as String;
          }

        }
        print(e);
        rethrow;
      }
      catch(e){
        print(e);
        rethrow;
      }
  }
}