import 'package:animezone/core/models/images.dart';
import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:animezone/features/articles/domain/models/news.dart';
import 'package:animezone/features/element/domain/models/review.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/video.dart';
import '../../../../core/providers/providers.dart';
import '../../domain/models/element.dart';
import '../../../articles/domain/models/forum.dart';
import '../../domain/models/episode.dart';
part 'providers.g.dart';


@riverpod
ElementRepository elementRepository (ElementRepositoryRef ref) {
  return ElementRepository(ref: ref);
}



@Riverpod(keepAlive: true)
Future<ElementCollection> topElement(
    TopElementRef ref, {
      required ElementType elementType,
      bool sfw = true,
      int? page,
      int? limit,
      String? type,
      String? rating,
      String? filter,
    }) {
  return ref.read(elementRepositoryProvider).getTopElement(
    elementType: elementType,
    sfw: sfw,
    page: page,
    limit: limit,
    type: type,
    rating: rating,
    filter: filter,
  );
}



@riverpod
Future<ElementCollection> seasonAnime(
    SeasonAnimeRef ref,{int? page}) {
  return ref.read(elementRepositoryProvider).getSeasonAnime(page: page);
}

@riverpod
Future<ElementCollection> mangaCollection(
    MangaCollectionRef ref, {required String collection , String? ordering , int? page}) {
  return ref.read(elementRepositoryProvider).getElementSearch(q: '', elementType: ElementType.manga , type: collection ,status: 'publishing', ordering: ordering??'members',page: page);
}

@riverpod
Future<ElementCollection> genreElement(
    GenreElementRef ref , {required String genre , required ElementType elementType , String? ordering , int? page}) {
  return ref.read(elementRepositoryProvider).getGenreElement(genre: genre ,elementType: elementType , ordering: ordering , page: page);
}

@Riverpod(keepAlive: true)
Future<Element> element(
    ElementRef ref, {
      required int id,
      required ElementType elementType
    }) {
  return ref.read(elementRepositoryProvider).getElement(id: id , elementType: elementType);
}

@Riverpod(keepAlive: true)
Future<Element> fullElement(
    FullElementRef ref, {
      required int id,
      required ElementType elementType
    }) {
  return ref.read(elementRepositoryProvider).getElementFull(id: id , elementType: elementType);
}

@Riverpod(keepAlive: true)
Future<Element> randomElement(RandomElementRef ref , {required ElementType elementType}) {
  return ref.read(elementRepositoryProvider).getRandomElement(elementType: elementType);
}

@riverpod
Future<ElementCollection> elementSearch(
    ElementSearchRef ref, {
      required ElementType elementType,
      required String q,
      bool sfw = true,
      String? status,
      bool? unapproved,
      int? page,
      int? limit,
      String? type,
      double? score,
      String? ordering,
      String? rating,
      String? genres,
    }) {
  return ref.read(elementRepositoryProvider).getElementSearch(q: q ,elementType:elementType, sfw: sfw , unapproved: unapproved , page: page , limit: limit , type: type , score: score , status: status , rating: rating , ordering: ordering , genres: genres);
}

@riverpod
Future<List<Episode>> recentEpisodes(RecentEpisodesRef ref ) {
  return ref.read(elementRepositoryProvider).getRecentEpisodes();
}

@Riverpod(keepAlive: true)
Future<List<dynamic>> elementGenres(ElementGenresRef ref , {required ElementType elementType}) {
  return ref.read(elementRepositoryProvider).getElementGenres(elementType:elementType);
}

@Riverpod(keepAlive: true)
Future<List<Image>> elementPictures(
    ElementPicturesRef ref, {
      required int id,
      required ElementType elementType
    }) {
  return ref.read(elementRepositoryProvider).getElementPictures(id: id, elementType: elementType);
}

@Riverpod(keepAlive: true)
Future<Map<String,List<Video>>> animeVideos(
    AnimeVideosRef ref, {
      required int id
    }) {
  return ref.read(elementRepositoryProvider).getAnimeVideos(id);
}

@Riverpod(keepAlive: true)
Future<List<Map<String,dynamic>>> elementCharacters(
    ElementCharactersRef ref, {
      required int id,
      required ElementType elementType
    }) {
  return ref.read(elementRepositoryProvider).getElementCharacters(id:id , elementType: elementType);
}

@Riverpod(keepAlive: true)
Future<List<Review>> elementReviews(
    ElementReviewsRef ref, {
      required int id,
      required ElementType elementType
    }) {
  return ref.read(elementRepositoryProvider).getElementReviews(id: id, elementType: elementType);
}

@Riverpod(keepAlive: true)
Future<List<Map<dynamic, dynamic>>> elementRecommendations(
    ElementRecommendationsRef ref, {
      required int id,
      required ElementType elementType
    }) {
  return ref.read(elementRepositoryProvider).getElementRecommendations(id: id , elementType: elementType);
}


@Riverpod(keepAlive: true)
Future<List<Map<dynamic, dynamic>>> elementRelations(
    ElementRelationsRef ref, {
      required int id,
      required ElementType elementType
    }) {
  return ref.read(elementRepositoryProvider).getElementRelations(id: id , elementType: elementType);
}

@Riverpod(keepAlive: true)
Future<List<News>> elementNews(
    ElementNewsRef ref, {
      required int id,
      required ElementType elementType
    }) {
  return ref.read(elementRepositoryProvider).getElementNews(id:id , elementType: elementType);
}

@Riverpod(keepAlive: true)
Future<List<Forum>> elementForum(
    ElementForumRef ref, {
      required int id,
      required ElementType elementType
    }) {
  return ref.read(elementRepositoryProvider).getElementForum(id:id , elementType: elementType);
}


@Riverpod(keepAlive: true)
Future<List<Map<String,dynamic>>> recentRecommendations(
    RecentRecommendationsRef ref , {required ElementType elementType}) {
  return ref.read(elementRepositoryProvider).getRecentRecommendations(elementType:elementType);
}

@Riverpod(keepAlive: true)
Future<List<Review>> recentReviews(
    RecentReviewsRef ref , {required ElementType elementType}) {
  return ref.read(elementRepositoryProvider).getRecentReviews(elementType: elementType);
}

@Riverpod(keepAlive: true)
Future<List<Episode>> animeEpisodes(
    AnimeEpisodesRef ref, {
      required int id
    }) {
  return ref.read(elementRepositoryProvider).getAnimeEpisodes(id);
}


@Riverpod(keepAlive: true)
Future<Map<dynamic, dynamic>> animeThemes(
    AnimeThemesRef ref, {
      required int id
    }) {
  return ref.read(elementRepositoryProvider).getAnimeThemes(id);
}

@riverpod
Future<String> elementWallpaper(
    ElementWallpaperRef ref, {
      required String title,
      required int id,
      required ElementType elementType
    }) {
  return ref.read(wallpaperProvider).getWallpaper(title: title , malId: id , type: elementType == ElementType.anime ? 'anime': 'manga');
}


