import 'package:animezone/features/element/data/repository/element_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/models/images.dart';
import 'anime.dart';
import 'manga.dart';

class Element extends Equatable {
  final int malId;
  final String url;
  final Image image;
  final bool approved;
  final List<Map<String, String>> titles;
  final String? status;
  final List<Map<String, dynamic>> demographics;
  final List<Map<String, dynamic>> themes;
  final String? type;
  final double? score;
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String? synopsis;
  final String? background;
  final List<Map> genres;
  final List<Map>? external;
  final List<Map>? relations;

  const Element(
      {required this.malId,
      required this.url,
      required this.image,
      required this.approved,
      required this.titles,
      this.status,
      required this.demographics,
      required this.themes,
      this.type,
      this.score,
      this.scoredBy,
      this.rank,
      this.popularity,
      this.members,
      this.favorites,
      this.synopsis,
      this.background,
      required this.genres,
      this.external,
      this.relations});

  @override
  List<Object> get props => [malId];
}

class ElementCollection {
  final int lastVisiblePage;
  final List<Element> elements;

  ElementCollection({required this.lastVisiblePage, required this.elements});

  static ElementCollection fromJson(
          {required Map<String, dynamic> json,
          required ElementType elementType}) =>
      ElementCollection(
        lastVisiblePage: json['pagination']['last_visible_page'] as int,
        elements: List.generate(
          (json['data'] as List<dynamic>).length,
          (index) => switch (elementType) {
            ElementType.anime => Anime.fromJson(List<Map<String, dynamic>>.from(
                json['data'] as List<dynamic>)[index]),
            ElementType.manga => Manga.fromJson(List<Map<String, dynamic>>.from(
                json['data'] as List<dynamic>)[index]),
          },
        ),
      );

}
