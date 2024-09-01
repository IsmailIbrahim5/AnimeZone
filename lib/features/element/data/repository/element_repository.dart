import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:animezone/core/models/video.dart';
import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/features/element/domain/models/review.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/models/images.dart';
import '../../domain/models/episode.dart';
import '../../domain/models/manga.dart';
import '../../domain/models/anime.dart';
import '../../domain/models/element.dart';
import '../../../articles/domain/models/forum.dart';
import '../../../articles/domain/models/news.dart';
import '../datasources/element_api.dart';

enum ElementType{
  anime, manga
}

class ElementRepository{

  final ProviderRef<ElementRepository> ref;
  ElementRepository({required this.ref});




  Future<ElementCollection> getElementSearch({required String q,
    required ElementType elementType,
    String? status,
    bool sfw = true,
    bool? unapproved,
    int? page,
    int? limit,
    String? type,
    double? score,
    String? ordering,
    String? rating,
    String? genres,
  }) async{
    try {
        final dioClient = ref.read(dioProvider);

        if (genres != null) {
          List<Map<String, dynamic>> genresData = List<
              Map<String, dynamic>>.from(await getElementGenres(elementType: elementType));
          List<int> genresId = [];
          for (String genre in genres.split(',')) {
            Map? genreData = genresData
                .where((element) => element['name'] == genre,)
                .firstOrNull;
            genresId.add(genreData?['mal_id'] as int? ?? 0);
          }
          genres = genresId.join(',');
        }
        final uri = ElementAPI.getElementSearch(q: q,
            elementType: elementType,
            type: type,
            limit: limit,
            page: page,
            score: score,
            sfw: sfw,
            unapproved: unapproved,
            status: status,
            rating: rating,
            ordering: ordering,
            genres: genres
        );

        final response = await dioClient.getUri(uri);
        if (response.statusCode == HttpStatus.ok) {
          ElementCollection elementCollection = ElementCollection.fromJson(json: response.data as Map<String, dynamic>, elementType: elementType);
          for (var e in elementCollection.elements) {
            await cacheObject(object: e , table: elementType == ElementType.anime? 'anime' : 'manga');
          }
          return elementCollection;
        } else {
          throw HttpException(response.statusMessage ?? '');
        }
      } catch(e){
        rethrow;

      }
  }

  Future<Element> getElement({required int id,  required ElementType elementType,}) async{
    final dioClient = ref.read(dioProvider);
    // Element? anime = cachedElement.where((element) => element.malId == id).firstOrNull;
    // if(anime != null) return anime;
  try {
        final uri = ElementAPI.getElementFull(id: id, elementType: elementType);
        final response = await dioClient.getUri(uri);
        if (response.statusCode == HttpStatus.ok) {
          var elementData = (response.data as Map<String,
              dynamic>)['data'] as Map<
              String,
              dynamic>;
          Element element;
          if(elementType == ElementType.anime) {
            element = Anime.fromJson(elementData);
          } else {
            element = Manga.fromJson(elementData);
          }
          await cacheObject(object: element , table: elementType == ElementType.anime? 'anime' : 'manga');

          return element;
        } else {
          throw HttpException(response.statusMessage ?? '');
        }
      }  catch (e) {
        rethrow;
      }
  }


  Future<Element> getElementFull({required int id, required ElementType elementType}) async{
    final dioClient = ref.read(dioProvider);
    // Element? anime = cachedElement.where((element) => element.malId == id).firstOrNull;
    // if(anime != null) return anime;
   try {
        final uri = ElementAPI.getElementFull(id:id , elementType: elementType);
        final response = await dioClient.getUri(uri);
        if (response.statusCode == HttpStatus.ok) {
          var elementData = (response.data as Map<String,
              dynamic>)['data'] as Map<
              String,
              dynamic>;

          Element element;
          if(elementType == ElementType.anime) {
            element = Anime.fromJson(elementData);
          } else {
            element = Manga.fromJson(elementData);
          }
          await cacheObject(object: element , table: elementType == ElementType.anime? 'anime' : 'manga');

          return element;
        } else {
          throw HttpException(response.statusMessage ?? '');
        }
      }  catch (e) {
        rethrow;
    }
  }

  Future<Element> getRandomElement({required ElementType elementType}) async{
    final dioClient = ref.read(dioProvider);
    final uri = ElementAPI.getRandomElement(elementType: elementType);
    try {
      final response = await dioClient.getUri(uri);
      if (response.statusCode == HttpStatus.ok) {
        var elementData = (response.data as Map<String, dynamic>)['data'] as Map<
            String,
            dynamic>;
        return elementType == ElementType.anime?Anime.fromJson(elementData):Manga.fromJson(elementData);
      } else {
        throw HttpException(response.statusMessage ?? '');
      }
    }catch(e){
      print(e);
      rethrow;
    }
  }



  Future<ElementCollection> getTopElement({
    bool sfw = true,
    required ElementType elementType,
    int? page,
    int? limit,
    String? type,
    String? rating,
    String? filter}) => getElementList(uri: ElementAPI.getElementTop(type: type , elementType: elementType,limit: limit, page: page ,filter: filter , sfw: sfw), cacheKey: 'top_${elementType == ElementType.anime? 'anime' : 'manga'}' , elementType: elementType);


  Future<ElementCollection> getSeasonAnime({int? page})  => getElementList(uri: ElementAPI.getSeasonAnime(page: page), cacheKey: 'season_anime', elementType: ElementType.anime);

  Future<ElementCollection> getGenreElement({required String genre, required ElementType elementType, String? ordering , int? page}) async{
    try {
        List<Map<String, dynamic>> genresData = List<Map<String, dynamic>>.from(
            await getElementGenres(elementType: elementType));

        Map? genreData = genresData
            .where((element) =>
        element['name'].toString().replaceAll(' ', '').toLowerCase() == genre.replaceAll(' ', '').toLowerCase(),)
            .firstOrNull;
        int genreId = genreData?['mal_id'] as int? ?? 0;
        final uri = ElementAPI.getElementSearch(
          elementType: elementType,
            q: '', genres: '$genreId', ordering: ordering??'members' , page: page);
        print(uri);

        return getElementList(uri: uri, cacheKey: '${genre}_${elementType == ElementType.anime? 'anime' : 'manga'}', elementType: elementType);
      } catch (e) {
        print(e);
        rethrow;
    }
  }
/*
  Future<Map<String, dynamic>> addExtraImages(Map<String , dynamic> map)async {
    final extraImages = await ref.read(imagesProvider).getExtraImages(uri: Uri.https(APIBaseUrl ,'/v4/anime/${map['mal_id']}/pictures'));
    map['images'] = {map['images'] as Map<String,dynamic>,...List.generate(
        extraImages.length, (index) => { 'jpg' : extraImages[index].toJson()})};
    return map;
  }*/


  Future<List<Image>> getElementPictures({required int id , required ElementType elementType}) async{
    return await ref.read(imagesProvider).getExtraImages(uri: ElementAPI.getElementPictures(id:id , elementType: elementType));
  }

  Future<Map<String,List<Video>>> getAnimeVideos(int id) async{
    return await ref.read(imagesProvider).getAnimeVideos(uri: ElementAPI.getAnimeVideos(id));
  }

  Future<List<dynamic>> getElementGenres({required ElementType elementType}) async{
    final dioClient = ref.read(dioProvider);
    final uri = ElementAPI.getElementGenres(elementType: elementType);
    final response = await dioClient.getUri(uri);
    if(response.statusCode == HttpStatus.ok){
      var genresData = (response.data as Map<String ,dynamic>)['data'] as List<dynamic>;
      return genresData;
    }else{
      throw HttpException(response.statusMessage??'');
    }
  }

  Future<Episode> getAnimeEpisodeById(Map<String,dynamic> animeData , int episodeId) async{
    final dioClient = ref.read(dioProvider);
    final response =await dioClient.getUri(ElementAPI.getAnimeEpisodeById(animeData['mal_id'] as int, episodeId));
    var episodeData = response.data ['data'] as Map<String,dynamic>;
    final animeImages = animeData['images'] as Map<String,dynamic>;
    if(episodeData.isEmpty) {
      episodeData= {
        'title': animeData['title']?? animeData['titles'].first['title'],
        'mal_id': episodeId,
        'filler': false,
        'recap': false,
        'url': animeData['url']
      };
    }
    episodeData.addAll({'images' : animeImages , 'anime_data' : animeData});
    Episode episode =  Episode.fromJson(episodeData);

    return Episode.fromJson(episodeData);
  }


  Future<List<Map<String,dynamic>>> getAnimeEpisodesImages(int animeId)async{
    final dioClient = ref.read(dioProvider);
    final response =await dioClient.getUri(ElementAPI.getAnimeEpisodesImages(animeId));
    return List<Map<String,dynamic>>.from(response.data ['data'] as Iterable<dynamic>);
  }

  Future<List<Episode>> getRecentEpisodes()async{

    final dioClient = ref.read(dioProvider);
  try {
        final response = await dioClient.getUri(ElementAPI.getRecentEpisodes());

        List<dynamic> episodesData =
        (response.data as Map<String, dynamic>)['data'] as List<dynamic>;
        List<Episode> episodes = [];
        for (var e in episodesData) {
          while(true) {
            try {
              Map<String, dynamic> map = e as Map<String, dynamic>;
              final animeData = map['entry'] as Map<String, dynamic>;
              final episodeId = (map['episodes'] as List<dynamic>)
                  .first['mal_id'];
              final episode = await getAnimeEpisodeById(
                  animeData, episodeId as int);
              // if (!cachedEpisodes.contains(episode)) cachedEpisodes.add(episode);
              await cacheObject(object: episode , table : 'episode');
              episodes.add(episode);
              break;
            } on DioException catch(e){
              if (!(e.type == DioExceptionType.badResponse &&
                  e.response?.statusCode == 429)) {
                rethrow;
              } else {
                await Future.delayed(const Duration(seconds: 2));
              }
            } catch (e) {
              print(e);
              rethrow;
            }
          }
        }
        return episodes;
      } catch (e) {
        print(e);
        rethrow;
    }
  }
  Future<List<Episode>> getAnimeEpisodes(int id)async{

    try {
      final dioClient = ref.read(dioProvider);
      final response = await dioClient.getUri(ElementAPI.getAnimeEpisodes(id));

      List<dynamic> episodesData = (response.data as Map<String,
          dynamic>)['data'] as List<dynamic>;

      List<Map<String, dynamic>> images = await getAnimeEpisodesImages(id);
      List<Episode> episodes = [];
      for (var e in episodesData) {
        try {
          Map<String, dynamic> map = e as Map<String, dynamic>;
          Map<String, dynamic>? image = images.where((element) => element['mal_id'] == map['mal_id'],).firstOrNull;
          if(image != null) map.addAll({'images' : image['images']});
          final episode = Episode.fromJson(map);
          await cacheObject(object: episode , table : 'episode');
          episodes.add(episode);
        } catch (e) {
          print(e);
        }
      }
      return episodes;
    }catch(e){
      print(e);
      rethrow;
    }
  }

  Future<Map<dynamic, dynamic>> getAnimeThemes(int id)async{

    try {
      final dioClient = ref.read(dioProvider);
      final response = await dioClient.getUri(ElementAPI.getAnimeThemes(id));

      Map<dynamic, dynamic> themesData =(response.data as Map<String,
          dynamic>)['data'] as Map<dynamic, dynamic>;

      return themesData;
    }catch(e){
      print(e);
      rethrow;
    }
  }


  Future<List<Map<String,dynamic>>> getElementCharacters({required int id , required ElementType elementType}) async{
    final dioClient = ref.read(dioProvider);
    final response =await dioClient.getUri(ElementAPI.getElementCharacters(id: id , elementType: elementType)) ;
    List<Map<String, dynamic>> charactersData = List<Map<String,dynamic>>.from((response.data as Map<String ,dynamic>)['data'] as List);

    return charactersData;
  }

  Future<List<Review>> getElementReviews({required int id , required ElementType elementType}) async{
    final dioClient = ref.read(dioProvider);
    try {

      final response =await dioClient.getUri(ElementAPI.getElementReviews(id: id, elementType: elementType)) ;
      List<dynamic> reviewsData = (response.data as Map<String,
          dynamic>)['data'] as List<dynamic>;

      return reviewsData.map<Review>((e) {
        Map<String, dynamic> map = e as Map<String, dynamic>;
        return Review.fromJson(map);
      }).toList();
    }catch(e){
      print(e);
      rethrow;
    }
  }

  Future<List<Map<dynamic, dynamic>>> getElementRecommendations({required int id , required ElementType elementType}) async{
    final dioClient = ref.read(dioProvider);
   try {
        final response = await dioClient.getUri(ElementAPI.getElementRecommendations(id:id , elementType: elementType));
        List<Map<dynamic, dynamic>> recommendationsData = List<
            Map<dynamic, dynamic>>.from((response.data as Map<String,
            dynamic>)['data'] as List<dynamic>);

        return recommendationsData;
      } catch (e) {
        rethrow;
      }
  }

  Future<List<Map<dynamic, dynamic>>> getElementRelations({required int id , required ElementType elementType}) async{
    final dioClient = ref.read(dioProvider);
    try {
        final response = await dioClient.getUri(ElementAPI.getElementRelations(id:id , elementType: elementType));
        List<Map<dynamic, dynamic>> relationsData = List<
            Map<dynamic, dynamic>>.from((response.data as Map<String,
            dynamic>)['data'] as List<dynamic>);

        return relationsData;
      } catch (e) {
        rethrow;
    }
  }

  Future<List<News>> getElementNews({required int id , required ElementType elementType}) async{
    final dioClient = ref.read(dioProvider);
  try {
        final response = await dioClient.getUri(ElementAPI.getElementNews(id: id , elementType: elementType));
        List<Map<String, dynamic>> newsData = List<
            Map<String, dynamic>>.from((response.data as Map<String,
            dynamic>)['data'] as List<dynamic>);

        return newsData.map((e) => News.fromJson(e),).toList();
      } catch (e) {
        rethrow;
    }
  }

  Future<List<Forum>> getElementForum({required int id , required ElementType elementType}) async{
    final dioClient = ref.read(dioProvider);
    try {
        final response = await dioClient.getUri(ElementAPI.getElementForum(id: id , elementType: elementType));
        List<Map<String, dynamic>> forumData = List<
            Map<String, dynamic>>.from((response.data as Map<String,
            dynamic>)['data'] as List<dynamic>);

        return forumData.map((e) => Forum.fromJson(e),).toList();
      } catch (e) {
        print(e);
        rethrow;
      }
  }


  Future<List<Map<String,dynamic>>> getRecentRecommendations({required ElementType elementType}) async{
    final dioClient = ref.read(dioProvider);
    try {
        final response = await dioClient.getUri(ElementAPI.getRecentRecommendations(elementType: elementType));
        return List<Map<String,dynamic>>.from((response.data as Map<String, dynamic>)['data'] as List);
      } catch (e) {
        rethrow;
      }
  }


  Future<List<Review>> getRecentReviews({required ElementType elementType}) async{
    final dioClient = ref.read(dioProvider);
   try {
        final response = await dioClient.getUri(ElementAPI.getRecentReviews(elementType: elementType));
        List<dynamic> reviewsData =
        (response.data as Map<String, dynamic>)['data'] as List<dynamic>;

        return reviewsData.map<Review>((e) {
          Map<String, dynamic> map = e as Map<String, dynamic>;
          return Review.fromJson(map);
        }).toList();
      }catch (e) {
        rethrow;
    }
  }


  Future<void>  cacheObject({required object , required String table})async{
    final db = ref.read(databaseProvider);
    await db.insert(table, (object.toJson() as Map<String, dynamic>).map((key, value) {
      if (value is Map || value is List) {
        return MapEntry(key, jsonEncode(value));
      }
      else if (value is bool) {
        return MapEntry(key, value ? 1 : 0);
      }
      return MapEntry(key, value);
    },), conflictAlgorithm: ConflictAlgorithm.replace);
  }


  Future<Element> getCachedElement({
    required int malId,
    required ElementType elementType
  })async{
    final db = ref.read(databaseProvider);
    final results = await db.query(
        elementType == ElementType.anime ? 'anime' : 'manga', where: 'mal_id = ?', whereArgs: [malId]);
    if (results.isEmpty) throw Exception('Couldn\'t find the anime');
    final elementData = results.first.map((key, value) {
      if(['titles' , 'authors', 'serializations' , 'demographics' , 'themes' , 'studios' , 'genres' , 'streaming' , 'external' , 'relations'].contains(key) ){
        return MapEntry(key, List<Map>.from(json.decode(value as String? ?? '[]') as List));
      }
      else if(['images' , 'aired' , 'theme','trailer' , 'published'].contains(key)){
        return MapEntry(key, json.decode(value as String? ?? '{}') as Map);
      }
      else if(['approved' , 'airing', 'publishing'].contains(key)){
        return MapEntry(key, value == 1);
      }

      return MapEntry(key, value);
    },);
    Element element;
    if(elementType == ElementType.anime) {
      element = Anime.fromJson(elementData);
    } else {
      element = Manga.fromJson(elementData);
    }

    return element;
  }


  Future<ElementCollection> getElementList({required Uri uri , required String cacheKey , required ElementType elementType})async{
    final dioClient = ref.read(dioProvider);

    final sharedPref = ref.read(sharedPreferencesProvider);
   try {
        final response = await dioClient.getUri(uri);
        if (response.statusCode == HttpStatus.ok) {
          ElementCollection elementCollection = ElementCollection.fromJson(json:response.data as Map<String,dynamic>, elementType: elementType);
          final elementsData =
          (response.data as Map<String, dynamic>)['data'] as List<dynamic>;
          for (var e in elementCollection.elements) {
            await cacheObject(object: e , table: elementType == ElementType.anime? 'anime' : 'manga');
          }

          sharedPref.setStringList(cacheKey, elementCollection.elements.map((e) {
            if(e is Anime){
              return e.malId.toString();
            }
            if(e is Manga){
              return e.malId.toString();
            }
            return '';
          }).toList());
          return elementCollection;
        } else {
          throw HttpException(response.statusMessage ?? '');
        }
      } on DioException catch (e) {
      if(e.type == DioExceptionType.connectionError){

          final elementIds = sharedPref.getStringList(cacheKey);
          if(elementIds == null) {
            rethrow;
          }
          else{
            List<Element> elements = [];
            for(var id in elementIds){
              int elementId = int.parse(id);
              final Element anime = await getCachedElement(malId:elementId, elementType: elementType);
              elements.add(anime);
            }
            return ElementCollection(lastVisiblePage: 1, elements: elements);
          }
        }
      rethrow;
      } catch(e){
        print(e);
        rethrow;
      }
  }
}


