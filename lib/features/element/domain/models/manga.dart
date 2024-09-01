import 'package:animezone/core/models/images.dart';
import 'package:animezone/features/element/domain/models/element.dart';

class Manga extends Element {
  final int? chapters;
  final int? volumes;
  final bool publishing;
  final Map<String, dynamic> published;
  final List<Map<String, dynamic>>? authors;
  final List<Map<String, dynamic>>? serializations;
  const Manga({
    this.chapters,
    this.volumes,
    required this.publishing,
    required this.published,
    this.authors,
    this.serializations,
    required super.malId,
    required super.url,
    required super.image,
    required super.approved,
    required super.titles,
    super.status,
    super.score,
    super.scoredBy,
    required super.demographics,
    required super.themes,
    super.rank,
    super.popularity,
    super.members,
    super.favorites,
    super.synopsis,
    super.background,
    required super.genres,
    super.external,
    super.relations,
    super.type,
  });

  factory Manga.fromJson(Map<String, dynamic> json) => Manga(
        malId: (json['mal_id'] as num).toInt(),
        url: json['url'] as String,
        image: Image.fromJson(json['images'] as Map<String, dynamic>),
        approved: json['approved'] as bool,
        titles: (json['titles'] as List<dynamic>)
            .map((e) => Map<String, String>.from(e as Map))
            .toList(),
        type: json['type'] as String?,
        chapters: (json['chapters'] as num?)?.toInt(),
        volumes: (json['volumes'] as num?)?.toInt(),
        status: json['status'] as String?,
        publishing: json['publishing'] as bool,
        published: json['published'] as Map<String, dynamic>,
        score: (json['score'] as num?)?.toDouble(),
        scoredBy: (json['scored_by'] as num?)?.toInt(),
        rank: (json['rank'] as num?)?.toInt(),
        popularity: (json['popularity'] as num?)?.toInt(),
        members: (json['members'] as num?)?.toInt(),
        favorites: (json['favorites'] as num?)?.toInt(),
        synopsis: json['synopsis'] as String?,
        background: json['background'] as String?,
        authors: (json['authors'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        serializations: (json['serializations'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        demographics: (json['demographics'] as List<dynamic>)
            .map((e) => e as Map<String, dynamic>)
            .toList(),
        themes: (json['themes'] as List<dynamic>)
            .map((e) => e as Map<String, dynamic>)
            .toList(),
        genres: (json['genres'] as List<dynamic>)
            .map((e) => e as Map<String, dynamic>)
            .toList(),
        external: (json['external'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
        relations: (json['relations'] as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
      );

  factory Manga.fromEntry(Map<String, dynamic> json) => Manga(
        malId: json['mal_id'] as int,
        url: json['url'] as String,
        image: Image.fromJson(json['images'] as Map<String, dynamic>),
        approved: true,
        genres: json['genres'] as List<Map<dynamic, dynamic>>,
        titles: [
          {'type': 'english', 'title': json['title'] as String}
        ],
        demographics: const [],
        themes: const [],
        scoredBy: 0,
        publishing: false,
        status: '', published: const {},
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'mal_id': malId,
        'url': url,
        'images': image.toJson(),
        'approved': approved,
        'titles': titles,
        'type': type,
        'chapters': chapters,
        'volumes': volumes,
        'status': status,
        'publishing': publishing,
        'published': published,
        'score': score,
        'scored_by': scoredBy,
        'rank': rank,
        'popularity': popularity,
        'members': members,
        'favorites': favorites,
        'synopsis': synopsis,
        'background': background,
        'authors': authors,
        'serializations': serializations,
        'demographics': demographics,
        'themes': themes,
        'genres': genres,
        'external': external,
        'relations': relations,
      };
/*factory Anime.fromDatabase(Map<String, dynamic> json) => Anime(
    malId: json['mal_id'] as int,
    url: json['url'] as String,
    image: Image.fromJson(json['images'] ),
    approved: true,
    genres:  [],
    titles: [],
    airing: true,
    aired: json['aired'] ,
    demographics: [],
    themes: [],
    theme: json['theme'] ,
    studios: [],
    scoredBy: 0,
  );*/
}
