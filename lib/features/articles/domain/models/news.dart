import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/images.dart';

part 'news.g.dart';
part 'news.freezed.dart';


@freezed
class NewsContainer with _$NewsContainer{
  factory NewsContainer({
    @JsonKey(name: 'last_visible_page')  required int lastVisiblePage,
    @NewsConverter() required List<News> data
  }) = _NewsContainer;

  factory NewsContainer.fromJson(Map<String, dynamic> json) => _$NewsContainerFromJson(json);
}
@freezed
class News with _$News {
  factory News({
    @JsonKey(name: 'mal_id') required int malId,
    required String url,
    required String title,
    required String date,
    @JsonKey(name: 'author_username') required String authorUsername,
   @JsonKey(name: 'author_url') required String authorUrl,
    @JsonKey(name: 'forum_url') required String forumUrl,
    @JsonKey(name: 'images') @ImagesConverter() required Image image,

   required int comments,
    required String excerpt
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}



class ImagesConverter extends JsonConverter<Image, Map<String, dynamic>> {
  const ImagesConverter();
  @override
  Image fromJson(Map<String, dynamic> json) => Image.fromJson(json);

  @override
  Map<String, dynamic> toJson(Image object) => {};
}



class NewsConverter extends JsonConverter<List<News>, List<dynamic>> {
  const NewsConverter();
  @override
  List<News> fromJson(List<dynamic> json) => List.generate(json.length, (index) => News.fromJson(List<Map<String, dynamic>>.from(json)[index]),);

  @override
  List<dynamic> toJson(List<News> object) => List.generate(object.length, (index) => object[index].toJson(),);
}
