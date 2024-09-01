// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForumContainerImpl _$$ForumContainerImplFromJson(Map<String, dynamic> json) =>
    _$ForumContainerImpl(
      lastVisiblePage: (json['last_visible_page'] as num).toInt(),
      data: const ForumConverter().fromJson(json['data'] as List),
    );

Map<String, dynamic> _$$ForumContainerImplToJson(
        _$ForumContainerImpl instance) =>
    <String, dynamic>{
      'last_visible_page': instance.lastVisiblePage,
      'data': const ForumConverter().toJson(instance.data),
    };

_$ForumImpl _$$ForumImplFromJson(Map<String, dynamic> json) => _$ForumImpl(
      malId: (json['mal_id'] as num).toInt(),
      url: json['url'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      authorUsername: json['author_username'] as String,
      authorUrl: json['author_url'] as String,
      entry: json['entry'] as Map<String, dynamic>?,
      board: json['board'] as Map<String, dynamic>?,
      comments: (json['comments'] as num).toInt(),
      lastComment: json['last_comment'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$ForumImplToJson(_$ForumImpl instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url,
      'title': instance.title,
      'date': instance.date,
      'author_username': instance.authorUsername,
      'author_url': instance.authorUrl,
      'entry': instance.entry,
      'board': instance.board,
      'comments': instance.comments,
      'last_comment': instance.lastComment,
    };
