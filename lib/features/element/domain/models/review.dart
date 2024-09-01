import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.g.dart';
part 'review.freezed.dart';

@freezed
class Review with _$Review {
  factory Review({
    required Map<String, dynamic> user,
    Map<String, dynamic>? entry,
    @JsonKey(name: 'mal_id') required int malId,
    required String url,
    required String type,
    required Map<String, dynamic> reactions,
    required String date,
    required String review,
    int? score,
    required List<String> tags,
    @JsonKey(name: 'is_spoiler') required bool isSpoiler,
    @JsonKey(name: 'is_preliminary') required bool isPreliminary,
    @JsonKey(name: 'episodes_watched') int? episodesWatched,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

}
