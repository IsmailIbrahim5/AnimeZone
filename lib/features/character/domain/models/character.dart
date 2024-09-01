import 'package:animezone/core/models/images.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



part 'character.g.dart';
part 'character.freezed.dart';

@freezed
class Character with _$Character{
  factory Character({
    @JsonKey(name: 'mal_id' ) required int malId,
    required String url,
    @JsonKey(name: 'images') @ImagesConverter() required Image image,
    required String name,
    @JsonKey(name: 'name_kanji') String? nameKanji,
    List< String>? nicknames,
    String? about,
    int? favorites,
    List<Map<String,dynamic>>? anime,
    List<Map<String,dynamic>>? manga,
    List<Map<String,dynamic>>? voices,

  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
}


class ImagesConverter extends JsonConverter<Image , Map<String,dynamic>>{
  const ImagesConverter();
  @override
  Image fromJson(Map<String, dynamic> json) => Image.fromJson(json);

  @override
  Map<String, dynamic> toJson(Image object) => {};

}