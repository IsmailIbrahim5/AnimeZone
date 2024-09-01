import 'package:animezone/core/models/images.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'element.dart';

class Anime extends Element {
  final String? trailer;
  final String? source;
  final int? episodes;
  final bool airing;
  final Map<String, dynamic> aired;
  final Map<String, dynamic>? theme;
  final List<Map<String, dynamic>> studios;
  final String? rating;
  final List<Map>? streaming;
  final String? duration;
  final String? season;
  final int? year;
  const Anime(
      {this.trailer,
      this.source,
      this.episodes,
        this.rating,
      required this.airing,
      required this.aired,
      this.theme,
      required this.studios,
      this.streaming,
      this.duration,
        this.season,
        this.year,
      required super.malId,
      required super.url,
      required super.image,
      required super.approved,
      required super.titles,
      required super.demographics,
      required super.themes,
      required super.genres,
        super.status,
        super.score,
        super.scoredBy,
        super.rank,
        super.popularity,
        super.members,
        super.favorites,
        super.synopsis,
        super.background,
        super.external,
        super.relations,
        super.type,
      });

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
    malId: (json['mal_id'] as num).toInt(),
    url: json['url'] as String,
    image: Image.fromJson(json['images'] as Map<String, dynamic>),
    trailer: json['trailer']['youtube_id'] as String?,
    approved: json['approved'] as bool,
    titles: (json['titles'] as List<dynamic>)
        .map((e) => Map<String, String>.from(e as Map))
        .toList(),
    type: json['type'] as String?,
    source: json['source'] as String?,
    episodes: (json['episodes'] as num?)?.toInt(),
    status: json['status'] as String?,
    airing: json['airing'] as bool,
    aired: json['aired'] as Map<String, dynamic>,
    demographics: (json['demographics'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    themes: (json['themes'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    theme: json['theme'] as Map<String, dynamic>?,
    studios: (json['studios'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    duration: json['duration'] as String?,
    rating: json['rating'] as String?,
    score: (json['score'] as num?)?.toDouble(),
    scoredBy: (json['scored_by'] as num?)?.toInt(),
    rank: (json['rank'] as num?)?.toInt(),
    popularity: (json['popularity'] as num?)?.toInt(),
    members: (json['members'] as num?)?.toInt(),
    favorites: (json['favorites'] as num?)?.toInt(),
    synopsis: json['synopsis'] as String?,
    background: json['background'] as String?,
    season: json['season'] as String?,
    year: (json['year'] as num?)?.toInt(),
    genres: (json['genres'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    streaming: (json['streaming'] as List<dynamic>?)
        ?.map((e) => e as Map<String, dynamic>)
        .toList(),
    external: (json['external'] as List<dynamic>?)
        ?.map((e) => e as Map<String, dynamic>)
        .toList(),
    relations: (json['relations'] as List<dynamic>?)
        ?.map((e) => e as Map<String, dynamic>)
        .toList(),
  );

  factory Anime.fromEntry(Map<String, dynamic> json) => Anime(
        malId: json['mal_id'] as int,
        url: json['url'] as String,
        image: Image.fromJson(json['images'] as Map<String, dynamic>),
        approved: true,
        genres: json['genres'] as List<Map<dynamic, dynamic>>,
        titles: [
          {'type': 'english', 'title': json['title'] as String}
        ],
        airing: true,
        aired: const {},
        demographics: const [],
        themes: const [],
        theme: const {},
        studios: const [],
        scoredBy: 0,
      );

  Map<String,dynamic> toJson()=><String, dynamic>{
    'mal_id': malId,
    'url': url,
    'images': image.toJson(),
    'trailer': {'youtube_id': trailer},
    'approved': approved,
    'titles': titles,
    'type': type,
    'source': source,
    'episodes': episodes,
    'status': status,
    'airing': airing,
    'aired': aired,
    'demographics': demographics,
    'themes': themes,
    'theme': theme,
    'studios': studios,
    'duration': duration,
    'rating': rating,
    'score': score,
    'scored_by': scoredBy,
    'rank': rank,
    'popularity': popularity,
    'members': members,
    'favorites': favorites,
    'synopsis': synopsis,
    'background': background,
    'season': season,
    'year': year,
    'genres': genres,
    'streaming': streaming,
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

class ImagesConverter extends JsonConverter<Image, Map<String, dynamic>> {
  const ImagesConverter();
  @override
  Image fromJson(Map<String, dynamic> json) => Image.fromJson(json);

  @override
  Map<String, dynamic> toJson(Image object) => object.toJson();
}

class TrailerConverter extends JsonConverter<String?, Map<String, dynamic>> {
  const TrailerConverter();
  @override
  String? fromJson(Map<String, dynamic> json) => json['youtube_id'] as String?;

  @override
  Map<String, dynamic> toJson(String? object) => {'youtube_id': object};
}
