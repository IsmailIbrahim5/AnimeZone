// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscussionImpl _$$DiscussionImplFromJson(Map<String, dynamic> json) =>
    _$DiscussionImpl(
      url: json['url'] as String,
      title: json['title'] as String,
      topic: DiscussionElement.fromJson(json['topic'] as Map<String, dynamic>),
      lastVisiblePage: (json['last_visible_page'] as num).toInt(),
      replies: (json['replies'] as List<dynamic>)
          .map((e) => DiscussionElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DiscussionImplToJson(_$DiscussionImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'topic': instance.topic,
      'last_visible_page': instance.lastVisiblePage,
      'replies': instance.replies,
    };

_$DiscussionElementImpl _$$DiscussionElementImplFromJson(
        Map<String, dynamic> json) =>
    _$DiscussionElementImpl(
      date: (json['date'] as num).toInt(),
      userName: json['userName'] as String,
      userUrl: json['userUrl'] as String,
      userStatus: json['userStatus'] as String,
      userJoined: json['userJoined'] as String,
      userIcon: json['userIcon'] as String?,
      postsCount: (json['postsCount'] as num).toInt(),
      reply: json['reply'] as Map<String, dynamic>?,
      content: (json['content'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      followContent: (json['followContent'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$DiscussionElementImplToJson(
        _$DiscussionElementImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'userName': instance.userName,
      'userUrl': instance.userUrl,
      'userStatus': instance.userStatus,
      'userJoined': instance.userJoined,
      'userIcon': instance.userIcon,
      'postsCount': instance.postsCount,
      'reply': instance.reply,
      'content': instance.content,
      'followContent': instance.followContent,
    };
