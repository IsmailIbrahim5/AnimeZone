// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeImpl _$$EpisodeImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeImpl(
      malId: (json['mal_id'] as num).toInt(),
      url: json['url'] as String?,
      animeData: json['anime_data'] as Map<String, dynamic>?,
      title: json['title'] as String,
      image: _$JsonConverterFromJson<Map<String, dynamic>, Image>(
          json['images'], const ImagesConverter().fromJson),
      japaneseTitle: json['title_japanese'] as String?,
      romanjiTitle: json['title_romanji'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      aired: json['aired'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      filler: json['filler'] as bool?,
      recap: json['recap'] as bool?,
      synopsis: json['synopsis'] as String?,
      forumUrl: json['forum_url'] as String?,
    );

Map<String, dynamic> _$$EpisodeImplToJson(_$EpisodeImpl instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url,
      if (instance.animeData case final value?) 'anime_data': value,
      'title': instance.title,
      if (_$JsonConverterToJson<Map<String, dynamic>, Image>(
              instance.image, const ImagesConverter().toJson)
          case final value?)
        'images': value,
      'title_japanese': instance.japaneseTitle,
      'title_romanji': instance.romanjiTitle,
      'duration': instance.duration,
      'aired': instance.aired,
      'score': instance.score,
      'filler': instance.filler,
      'recap': instance.recap,
      'synopsis': instance.synopsis,
      'forum_url': instance.forumUrl,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
