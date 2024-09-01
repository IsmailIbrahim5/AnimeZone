// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      malId: (json['mal_id'] as num).toInt(),
      url: json['url'] as String,
      image: const ImagesConverter()
          .fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String,
      nameKanji: json['name_kanji'] as String?,
      nicknames: (json['nicknames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      about: json['about'] as String?,
      favorites: (json['favorites'] as num?)?.toInt(),
      anime: (json['anime'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      manga: (json['manga'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      voices: (json['voices'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url,
      'images': const ImagesConverter().toJson(instance.image),
      'name': instance.name,
      'name_kanji': instance.nameKanji,
      'nicknames': instance.nicknames,
      'about': instance.about,
      'favorites': instance.favorites,
      'anime': instance.anime,
      'manga': instance.manga,
      'voices': instance.voices,
    };
