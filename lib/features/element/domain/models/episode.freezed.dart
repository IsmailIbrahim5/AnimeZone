// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Episode _$EpisodeFromJson(Map<String, dynamic> json) {
  return _Episode.fromJson(json);
}

/// @nodoc
mixin _$Episode {
  @JsonKey(name: 'mal_id')
  int get malId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'anime_data', includeIfNull: false)
  Map<String, dynamic>? get animeData => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'images', includeIfNull: false)
  @ImagesConverter()
  Image? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'title_japanese')
  String? get japaneseTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'title_romanji')
  String? get romanjiTitle => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  String? get aired => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  bool? get filler => throw _privateConstructorUsedError;
  bool? get recap => throw _privateConstructorUsedError;
  String? get synopsis => throw _privateConstructorUsedError;
  @JsonKey(name: 'forum_url')
  String? get forumUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeCopyWith<Episode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeCopyWith<$Res> {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) then) =
      _$EpisodeCopyWithImpl<$Res, Episode>;
  @useResult
  $Res call(
      {@JsonKey(name: 'mal_id') int malId,
      String? url,
      @JsonKey(name: 'anime_data', includeIfNull: false)
      Map<String, dynamic>? animeData,
      String title,
      @JsonKey(name: 'images', includeIfNull: false)
      @ImagesConverter()
      Image? image,
      @JsonKey(name: 'title_japanese') String? japaneseTitle,
      @JsonKey(name: 'title_romanji') String? romanjiTitle,
      int? duration,
      String? aired,
      double? score,
      bool? filler,
      bool? recap,
      String? synopsis,
      @JsonKey(name: 'forum_url') String? forumUrl});
}

/// @nodoc
class _$EpisodeCopyWithImpl<$Res, $Val extends Episode>
    implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malId = null,
    Object? url = freezed,
    Object? animeData = freezed,
    Object? title = null,
    Object? image = freezed,
    Object? japaneseTitle = freezed,
    Object? romanjiTitle = freezed,
    Object? duration = freezed,
    Object? aired = freezed,
    Object? score = freezed,
    Object? filler = freezed,
    Object? recap = freezed,
    Object? synopsis = freezed,
    Object? forumUrl = freezed,
  }) {
    return _then(_value.copyWith(
      malId: null == malId
          ? _value.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      animeData: freezed == animeData
          ? _value.animeData
          : animeData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
      japaneseTitle: freezed == japaneseTitle
          ? _value.japaneseTitle
          : japaneseTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      romanjiTitle: freezed == romanjiTitle
          ? _value.romanjiTitle
          : romanjiTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      aired: freezed == aired
          ? _value.aired
          : aired // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      filler: freezed == filler
          ? _value.filler
          : filler // ignore: cast_nullable_to_non_nullable
              as bool?,
      recap: freezed == recap
          ? _value.recap
          : recap // ignore: cast_nullable_to_non_nullable
              as bool?,
      synopsis: freezed == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String?,
      forumUrl: freezed == forumUrl
          ? _value.forumUrl
          : forumUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpisodeImplCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$$EpisodeImplCopyWith(
          _$EpisodeImpl value, $Res Function(_$EpisodeImpl) then) =
      __$$EpisodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mal_id') int malId,
      String? url,
      @JsonKey(name: 'anime_data', includeIfNull: false)
      Map<String, dynamic>? animeData,
      String title,
      @JsonKey(name: 'images', includeIfNull: false)
      @ImagesConverter()
      Image? image,
      @JsonKey(name: 'title_japanese') String? japaneseTitle,
      @JsonKey(name: 'title_romanji') String? romanjiTitle,
      int? duration,
      String? aired,
      double? score,
      bool? filler,
      bool? recap,
      String? synopsis,
      @JsonKey(name: 'forum_url') String? forumUrl});
}

/// @nodoc
class __$$EpisodeImplCopyWithImpl<$Res>
    extends _$EpisodeCopyWithImpl<$Res, _$EpisodeImpl>
    implements _$$EpisodeImplCopyWith<$Res> {
  __$$EpisodeImplCopyWithImpl(
      _$EpisodeImpl _value, $Res Function(_$EpisodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malId = null,
    Object? url = freezed,
    Object? animeData = freezed,
    Object? title = null,
    Object? image = freezed,
    Object? japaneseTitle = freezed,
    Object? romanjiTitle = freezed,
    Object? duration = freezed,
    Object? aired = freezed,
    Object? score = freezed,
    Object? filler = freezed,
    Object? recap = freezed,
    Object? synopsis = freezed,
    Object? forumUrl = freezed,
  }) {
    return _then(_$EpisodeImpl(
      malId: null == malId
          ? _value.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      animeData: freezed == animeData
          ? _value._animeData
          : animeData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
      japaneseTitle: freezed == japaneseTitle
          ? _value.japaneseTitle
          : japaneseTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      romanjiTitle: freezed == romanjiTitle
          ? _value.romanjiTitle
          : romanjiTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      aired: freezed == aired
          ? _value.aired
          : aired // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      filler: freezed == filler
          ? _value.filler
          : filler // ignore: cast_nullable_to_non_nullable
              as bool?,
      recap: freezed == recap
          ? _value.recap
          : recap // ignore: cast_nullable_to_non_nullable
              as bool?,
      synopsis: freezed == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String?,
      forumUrl: freezed == forumUrl
          ? _value.forumUrl
          : forumUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeImpl implements _Episode {
  _$EpisodeImpl(
      {@JsonKey(name: 'mal_id') required this.malId,
      this.url,
      @JsonKey(name: 'anime_data', includeIfNull: false)
      final Map<String, dynamic>? animeData,
      required this.title,
      @JsonKey(name: 'images', includeIfNull: false)
      @ImagesConverter()
      this.image,
      @JsonKey(name: 'title_japanese') this.japaneseTitle,
      @JsonKey(name: 'title_romanji') this.romanjiTitle,
      this.duration,
      this.aired,
      this.score,
      this.filler,
      this.recap,
      this.synopsis,
      @JsonKey(name: 'forum_url') this.forumUrl})
      : _animeData = animeData;

  factory _$EpisodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeImplFromJson(json);

  @override
  @JsonKey(name: 'mal_id')
  final int malId;
  @override
  final String? url;
  final Map<String, dynamic>? _animeData;
  @override
  @JsonKey(name: 'anime_data', includeIfNull: false)
  Map<String, dynamic>? get animeData {
    final value = _animeData;
    if (value == null) return null;
    if (_animeData is EqualUnmodifiableMapView) return _animeData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String title;
  @override
  @JsonKey(name: 'images', includeIfNull: false)
  @ImagesConverter()
  final Image? image;
  @override
  @JsonKey(name: 'title_japanese')
  final String? japaneseTitle;
  @override
  @JsonKey(name: 'title_romanji')
  final String? romanjiTitle;
  @override
  final int? duration;
  @override
  final String? aired;
  @override
  final double? score;
  @override
  final bool? filler;
  @override
  final bool? recap;
  @override
  final String? synopsis;
  @override
  @JsonKey(name: 'forum_url')
  final String? forumUrl;

  @override
  String toString() {
    return 'Episode(malId: $malId, url: $url, animeData: $animeData, title: $title, image: $image, japaneseTitle: $japaneseTitle, romanjiTitle: $romanjiTitle, duration: $duration, aired: $aired, score: $score, filler: $filler, recap: $recap, synopsis: $synopsis, forumUrl: $forumUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeImpl &&
            (identical(other.malId, malId) || other.malId == malId) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality()
                .equals(other._animeData, _animeData) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.japaneseTitle, japaneseTitle) ||
                other.japaneseTitle == japaneseTitle) &&
            (identical(other.romanjiTitle, romanjiTitle) ||
                other.romanjiTitle == romanjiTitle) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.aired, aired) || other.aired == aired) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.filler, filler) || other.filler == filler) &&
            (identical(other.recap, recap) || other.recap == recap) &&
            (identical(other.synopsis, synopsis) ||
                other.synopsis == synopsis) &&
            (identical(other.forumUrl, forumUrl) ||
                other.forumUrl == forumUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      malId,
      url,
      const DeepCollectionEquality().hash(_animeData),
      title,
      image,
      japaneseTitle,
      romanjiTitle,
      duration,
      aired,
      score,
      filler,
      recap,
      synopsis,
      forumUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      __$$EpisodeImplCopyWithImpl<_$EpisodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeImplToJson(
      this,
    );
  }
}

abstract class _Episode implements Episode {
  factory _Episode(
      {@JsonKey(name: 'mal_id') required final int malId,
      final String? url,
      @JsonKey(name: 'anime_data', includeIfNull: false)
      final Map<String, dynamic>? animeData,
      required final String title,
      @JsonKey(name: 'images', includeIfNull: false)
      @ImagesConverter()
      final Image? image,
      @JsonKey(name: 'title_japanese') final String? japaneseTitle,
      @JsonKey(name: 'title_romanji') final String? romanjiTitle,
      final int? duration,
      final String? aired,
      final double? score,
      final bool? filler,
      final bool? recap,
      final String? synopsis,
      @JsonKey(name: 'forum_url') final String? forumUrl}) = _$EpisodeImpl;

  factory _Episode.fromJson(Map<String, dynamic> json) = _$EpisodeImpl.fromJson;

  @override
  @JsonKey(name: 'mal_id')
  int get malId;
  @override
  String? get url;
  @override
  @JsonKey(name: 'anime_data', includeIfNull: false)
  Map<String, dynamic>? get animeData;
  @override
  String get title;
  @override
  @JsonKey(name: 'images', includeIfNull: false)
  @ImagesConverter()
  Image? get image;
  @override
  @JsonKey(name: 'title_japanese')
  String? get japaneseTitle;
  @override
  @JsonKey(name: 'title_romanji')
  String? get romanjiTitle;
  @override
  int? get duration;
  @override
  String? get aired;
  @override
  double? get score;
  @override
  bool? get filler;
  @override
  bool? get recap;
  @override
  String? get synopsis;
  @override
  @JsonKey(name: 'forum_url')
  String? get forumUrl;
  @override
  @JsonKey(ignore: true)
  _$$EpisodeImplCopyWith<_$EpisodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
