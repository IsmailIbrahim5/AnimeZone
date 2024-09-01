import 'package:animezone/core/data/repository/image_repository.dart';
import 'package:animezone/core/features/wallpaper/data/repository/wallpaper_repository.dart';
import 'package:animezone/core/models/app_theme.dart';
import 'package:animezone/core/models/rate_limit_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

part 'providers.g.dart';
final dioProvider = Provider<Dio>((ref){
  final Dio dio = Dio();
  dio.interceptors.add(RateLimitInterceptor(dio: dio));
  return dio;
});


final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);
final databaseProvider = Provider<Database>(
      (ref) => throw UnimplementedError(),
);
final imagesProvider = Provider<ImageRepository>(
    (ref) => ImageRepository(dioClient: ref.read(dioProvider)));

final wallpaperProvider = Provider<WallpaperRepository>(
  (ref) => WallpaperRepository(
    ref: ref,
  ),
);


@riverpod
class ApplicationTheme extends _$ApplicationTheme {

  @override
  AppTheme build() {
    return (ref.read(sharedPreferencesProvider).getBool('night_mode') ?? false) ? AppTheme.dark(): AppTheme.light();
  }

  void toggleTheme (){
      state = (state == AppTheme.light() ? AppTheme.dark() : AppTheme.light());
      ref.read(sharedPreferencesProvider).setBool(
          'night_mode', state == AppTheme.dark());
  }

  void changeTheme (AppTheme theme){
    state = theme;
    ref.read(sharedPreferencesProvider).setBool(
        'night_mode', state == AppTheme.dark());
  }
}


