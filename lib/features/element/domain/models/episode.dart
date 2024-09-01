import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/images.dart';


part 'episode.g.dart';
part 'episode.freezed.dart';


@freezed
class Episode with _$Episode {
  factory Episode({
    @JsonKey(name: 'mal_id') required int malId,
      String? url,
    @JsonKey(name: 'anime_data', includeIfNull: false)  Map<String,dynamic>? animeData,
      required String title,
    @JsonKey(name: 'images', includeIfNull: false) @ImagesConverter() Image? image,
      @JsonKey(name: 'title_japanese') String? japaneseTitle,
      @JsonKey(name: 'title_romanji') String? romanjiTitle,
      int? duration,
      String? aired,
    double? score,
    bool? filler,
    bool? recap,
    String? synopsis,
      @JsonKey(name: 'forum_url') String? forumUrl}) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);
}



class ImagesConverter extends JsonConverter<Image, Map<String, dynamic>> {
  const ImagesConverter();
  @override
  Image fromJson(Map<String, dynamic> json) => Image.fromJson(json);

  @override
  Map<String, dynamic> toJson(Image object) => {
    'jpg' : object.toJson()
  };
}


