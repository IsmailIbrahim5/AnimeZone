import 'dart:io';

import 'package:animezone/core/models/video.dart';
import 'package:dio/dio.dart';

import '../../models/images.dart';


class ImageRepository{

  final Dio dioClient;
  final List<Image> cachedImages = [];
  final List<Video> cachedVideos = [];

  ImageRepository({required this.dioClient});

  Future<List<Image>> getExtraImages({ required Uri uri}) async{
    while(true) {
      try {
        final response = await dioClient.getUri(uri);
        if (response.statusCode == HttpStatus.ok) {
          final imagesData = (response.data as Map<String,
              dynamic>)['data'] as List<dynamic>;
          List<Image> images = imagesData.map((e) =>
              Image.fromJson(e as Map<String, dynamic>)).toList();
          for (Image image in images) {
            if (!cachedImages.contains(image)) cachedImages.add(image);
          }
          return images;
        } else {
          throw HttpException(response.statusMessage ?? '');
        }
      } on DioException catch (e) {
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

  Future<Map<String,List<Video>>> getAnimeVideos({ required Uri uri}) async{
    while(true) {
      try {
        final response = await dioClient.getUri(uri);
        if (response.statusCode == HttpStatus.ok) {
          final videosData = (response.data as Map<String,
              dynamic>)['data'] as Map<String,dynamic>;
          List<Video> promos = List<Map<String,dynamic>>.from(videosData['promo'] as List).map((e) =>
              Video.fromJson(e)).toList();
          List<Video> musicVideos = List<Map<String,dynamic>>.from(videosData['music_videos'] as List).map((e) =>
              Video.fromJson(e)).toList();
          for (Video video in promos) {
            if (!cachedVideos.contains(video)) cachedVideos.add(video);
          }
          return {
            'promos': promos,
            'music_videos': musicVideos
          };
        } else {
          throw HttpException(response.statusMessage ?? '');
        }
      } on DioException catch (e) {
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

}

