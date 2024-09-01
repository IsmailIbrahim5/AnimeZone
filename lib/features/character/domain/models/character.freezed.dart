// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return _Character.fromJson(json);
}

/// @nodoc
mixin _$Character {
  @JsonKey(name: 'mal_id')
  int get malId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  @ImagesConverter()
  Image get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_kanji')
  String? get nameKanji => throw _privateConstructorUsedError;
  List<String>? get nicknames => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  int? get favorites => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get anime => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get manga => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get voices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterCopyWith<Character> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterCopyWith<$Res> {
  factory $CharacterCopyWith(Character value, $Res Function(Character) then) =
      _$CharacterCopyWithImpl<$Res, Character>;
  @useResult
  $Res call(
      {@JsonKey(name: 'mal_id') int malId,
      String url,
      @JsonKey(name: 'images') @ImagesConverter() Image image,
      String name,
      @JsonKey(name: 'name_kanji') String? nameKanji,
      List<String>? nicknames,
      String? about,
      int? favorites,
      List<Map<String, dynamic>>? anime,
      List<Map<String, dynamic>>? manga,
      List<Map<String, dynamic>>? voices});
}

/// @nodoc
class _$CharacterCopyWithImpl<$Res, $Val extends Character>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malId = null,
    Object? url = null,
    Object? image = null,
    Object? name = null,
    Object? nameKanji = freezed,
    Object? nicknames = freezed,
    Object? about = freezed,
    Object? favorites = freezed,
    Object? anime = freezed,
    Object? manga = freezed,
    Object? voices = freezed,
  }) {
    return _then(_value.copyWith(
      malId: null == malId
          ? _value.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameKanji: freezed == nameKanji
          ? _value.nameKanji
          : nameKanji // ignore: cast_nullable_to_non_nullable
              as String?,
      nicknames: freezed == nicknames
          ? _value.nicknames
          : nicknames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      favorites: freezed == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as int?,
      anime: freezed == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      manga: freezed == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      voices: freezed == voices
          ? _value.voices
          : voices // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterImplCopyWith<$Res>
    implements $CharacterCopyWith<$Res> {
  factory _$$CharacterImplCopyWith(
          _$CharacterImpl value, $Res Function(_$CharacterImpl) then) =
      __$$CharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mal_id') int malId,
      String url,
      @JsonKey(name: 'images') @ImagesConverter() Image image,
      String name,
      @JsonKey(name: 'name_kanji') String? nameKanji,
      List<String>? nicknames,
      String? about,
      int? favorites,
      List<Map<String, dynamic>>? anime,
      List<Map<String, dynamic>>? manga,
      List<Map<String, dynamic>>? voices});
}

/// @nodoc
class __$$CharacterImplCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$CharacterImpl>
    implements _$$CharacterImplCopyWith<$Res> {
  __$$CharacterImplCopyWithImpl(
      _$CharacterImpl _value, $Res Function(_$CharacterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malId = null,
    Object? url = null,
    Object? image = null,
    Object? name = null,
    Object? nameKanji = freezed,
    Object? nicknames = freezed,
    Object? about = freezed,
    Object? favorites = freezed,
    Object? anime = freezed,
    Object? manga = freezed,
    Object? voices = freezed,
  }) {
    return _then(_$CharacterImpl(
      malId: null == malId
          ? _value.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameKanji: freezed == nameKanji
          ? _value.nameKanji
          : nameKanji // ignore: cast_nullable_to_non_nullable
              as String?,
      nicknames: freezed == nicknames
          ? _value._nicknames
          : nicknames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      favorites: freezed == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as int?,
      anime: freezed == anime
          ? _value._anime
          : anime // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      manga: freezed == manga
          ? _value._manga
          : manga // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      voices: freezed == voices
          ? _value._voices
          : voices // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterImpl implements _Character {
  _$CharacterImpl(
      {@JsonKey(name: 'mal_id') required this.malId,
      required this.url,
      @JsonKey(name: 'images') @ImagesConverter() required this.image,
      required this.name,
      @JsonKey(name: 'name_kanji') this.nameKanji,
      final List<String>? nicknames,
      this.about,
      this.favorites,
      final List<Map<String, dynamic>>? anime,
      final List<Map<String, dynamic>>? manga,
      final List<Map<String, dynamic>>? voices})
      : _nicknames = nicknames,
        _anime = anime,
        _manga = manga,
        _voices = voices;

  factory _$CharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterImplFromJson(json);

  @override
  @JsonKey(name: 'mal_id')
  final int malId;
  @override
  final String url;
  @override
  @JsonKey(name: 'images')
  @ImagesConverter()
  final Image image;
  @override
  final String name;
  @override
  @JsonKey(name: 'name_kanji')
  final String? nameKanji;
  final List<String>? _nicknames;
  @override
  List<String>? get nicknames {
    final value = _nicknames;
    if (value == null) return null;
    if (_nicknames is EqualUnmodifiableListView) return _nicknames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? about;
  @override
  final int? favorites;
  final List<Map<String, dynamic>>? _anime;
  @override
  List<Map<String, dynamic>>? get anime {
    final value = _anime;
    if (value == null) return null;
    if (_anime is EqualUnmodifiableListView) return _anime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Map<String, dynamic>>? _manga;
  @override
  List<Map<String, dynamic>>? get manga {
    final value = _manga;
    if (value == null) return null;
    if (_manga is EqualUnmodifiableListView) return _manga;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Map<String, dynamic>>? _voices;
  @override
  List<Map<String, dynamic>>? get voices {
    final value = _voices;
    if (value == null) return null;
    if (_voices is EqualUnmodifiableListView) return _voices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Character(malId: $malId, url: $url, image: $image, name: $name, nameKanji: $nameKanji, nicknames: $nicknames, about: $about, favorites: $favorites, anime: $anime, manga: $manga, voices: $voices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterImpl &&
            (identical(other.malId, malId) || other.malId == malId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameKanji, nameKanji) ||
                other.nameKanji == nameKanji) &&
            const DeepCollectionEquality()
                .equals(other._nicknames, _nicknames) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.favorites, favorites) ||
                other.favorites == favorites) &&
            const DeepCollectionEquality().equals(other._anime, _anime) &&
            const DeepCollectionEquality().equals(other._manga, _manga) &&
            const DeepCollectionEquality().equals(other._voices, _voices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      malId,
      url,
      image,
      name,
      nameKanji,
      const DeepCollectionEquality().hash(_nicknames),
      about,
      favorites,
      const DeepCollectionEquality().hash(_anime),
      const DeepCollectionEquality().hash(_manga),
      const DeepCollectionEquality().hash(_voices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      __$$CharacterImplCopyWithImpl<_$CharacterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterImplToJson(
      this,
    );
  }
}

abstract class _Character implements Character {
  factory _Character(
      {@JsonKey(name: 'mal_id') required final int malId,
      required final String url,
      @JsonKey(name: 'images') @ImagesConverter() required final Image image,
      required final String name,
      @JsonKey(name: 'name_kanji') final String? nameKanji,
      final List<String>? nicknames,
      final String? about,
      final int? favorites,
      final List<Map<String, dynamic>>? anime,
      final List<Map<String, dynamic>>? manga,
      final List<Map<String, dynamic>>? voices}) = _$CharacterImpl;

  factory _Character.fromJson(Map<String, dynamic> json) =
      _$CharacterImpl.fromJson;

  @override
  @JsonKey(name: 'mal_id')
  int get malId;
  @override
  String get url;
  @override
  @JsonKey(name: 'images')
  @ImagesConverter()
  Image get image;
  @override
  String get name;
  @override
  @JsonKey(name: 'name_kanji')
  String? get nameKanji;
  @override
  List<String>? get nicknames;
  @override
  String? get about;
  @override
  int? get favorites;
  @override
  List<Map<String, dynamic>>? get anime;
  @override
  List<Map<String, dynamic>>? get manga;
  @override
  List<Map<String, dynamic>>? get voices;
  @override
  @JsonKey(ignore: true)
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
