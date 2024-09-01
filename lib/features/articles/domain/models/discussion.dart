import 'package:freezed_annotation/freezed_annotation.dart';


part 'discussion.g.dart';
part 'discussion.freezed.dart';

@freezed
class Discussion with _$Discussion {
  factory Discussion({
    required String url,
    required String title,
    required DiscussionElement topic,
    @JsonKey(name: 'last_visible_page') required int lastVisiblePage,
    required List<DiscussionElement> replies,
  }) = _Discussion;

  factory Discussion.fromJson(Map<String, dynamic> json) => _$DiscussionFromJson(json);
}


@freezed
class DiscussionElement with _$DiscussionElement {
  factory DiscussionElement({
    required int date,
    required String userName,
    required String userUrl,
    required String userStatus,
    required String userJoined,
    String? userIcon,
    required int postsCount,
    Map<String,dynamic>? reply,
    required List<Map<String,dynamic>> content,
    List<Map<String,dynamic>>? followContent,
  }) = _DiscussionElement;

  factory DiscussionElement.fromJson(Map<String, dynamic> json) => _$DiscussionElementFromJson(json);
}

