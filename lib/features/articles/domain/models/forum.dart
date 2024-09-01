import 'package:freezed_annotation/freezed_annotation.dart';


part 'forum.g.dart';
part 'forum.freezed.dart';



@freezed
class ForumContainer with _$ForumContainer{
  factory ForumContainer({
    @JsonKey(name: 'last_visible_page')  required int lastVisiblePage,
    @ForumConverter() required List<Forum> data
  }) = _ForumContainer;

  factory ForumContainer.fromJson(Map<String, dynamic> json) => _$ForumContainerFromJson(json);
}
@freezed
class Forum with _$Forum {
  factory Forum({
    @JsonKey(name: 'mal_id') required int malId,
    required String url,
    required String title,
    required String date,
    @JsonKey(name: 'author_username') required String authorUsername,
    @JsonKey(name: 'author_url') required String authorUrl,

    Map<String,dynamic>? entry,
    Map<String,dynamic>? board,
    required int comments,
    @JsonKey(name: 'last_comment') required Map<String,dynamic> lastComment
  }) = _Forum;

  factory Forum.fromJson(Map<String, dynamic> json) => _$ForumFromJson(json);
}


class ForumConverter extends JsonConverter<List<Forum>, List<dynamic>> {
  const ForumConverter();
  @override
  List<Forum> fromJson(List<dynamic> json) => List.generate(json.length, (index) => Forum.fromJson(List<Map<String, dynamic>>.from(json)[index]),);

  @override
  List<dynamic> toJson(List<Forum> object) => List.generate(object.length, (index) => object[index].toJson(),);
}
