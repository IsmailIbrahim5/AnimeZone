// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      user: json['user'] as Map<String, dynamic>,
      entry: json['entry'] as Map<String, dynamic>?,
      malId: (json['mal_id'] as num).toInt(),
      url: json['url'] as String,
      type: json['type'] as String,
      reactions: json['reactions'] as Map<String, dynamic>,
      date: json['date'] as String,
      review: json['review'] as String,
      score: (json['score'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      isSpoiler: json['is_spoiler'] as bool,
      isPreliminary: json['is_preliminary'] as bool,
      episodesWatched: (json['episodes_watched'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'entry': instance.entry,
      'mal_id': instance.malId,
      'url': instance.url,
      'type': instance.type,
      'reactions': instance.reactions,
      'date': instance.date,
      'review': instance.review,
      'score': instance.score,
      'tags': instance.tags,
      'is_spoiler': instance.isSpoiler,
      'is_preliminary': instance.isPreliminary,
      'episodes_watched': instance.episodesWatched,
    };
