// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsContainerImpl _$$NewsContainerImplFromJson(Map<String, dynamic> json) =>
    _$NewsContainerImpl(
      lastVisiblePage: (json['last_visible_page'] as num).toInt(),
      data: const NewsConverter().fromJson(json['data'] as List),
    );

Map<String, dynamic> _$$NewsContainerImplToJson(_$NewsContainerImpl instance) =>
    <String, dynamic>{
      'last_visible_page': instance.lastVisiblePage,
      'data': const NewsConverter().toJson(instance.data),
    };

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      malId: (json['mal_id'] as num).toInt(),
      url: json['url'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      authorUsername: json['author_username'] as String,
      authorUrl: json['author_url'] as String,
      forumUrl: json['forum_url'] as String,
      image: const ImagesConverter()
          .fromJson(json['images'] as Map<String, dynamic>),
      comments: (json['comments'] as num).toInt(),
      excerpt: json['excerpt'] as String,
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url,
      'title': instance.title,
      'date': instance.date,
      'author_username': instance.authorUsername,
      'author_url': instance.authorUrl,
      'forum_url': instance.forumUrl,
      'images': const ImagesConverter().toJson(instance.image),
      'comments': instance.comments,
      'excerpt': instance.excerpt,
    };
