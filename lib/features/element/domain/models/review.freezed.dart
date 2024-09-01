// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  Map<String, dynamic> get user => throw _privateConstructorUsedError;
  Map<String, dynamic>? get entry => throw _privateConstructorUsedError;
  @JsonKey(name: 'mal_id')
  int get malId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get reactions => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get review => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_spoiler')
  bool get isSpoiler => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_preliminary')
  bool get isPreliminary => throw _privateConstructorUsedError;
  @JsonKey(name: 'episodes_watched')
  int? get episodesWatched => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {Map<String, dynamic> user,
      Map<String, dynamic>? entry,
      @JsonKey(name: 'mal_id') int malId,
      String url,
      String type,
      Map<String, dynamic> reactions,
      String date,
      String review,
      int? score,
      List<String> tags,
      @JsonKey(name: 'is_spoiler') bool isSpoiler,
      @JsonKey(name: 'is_preliminary') bool isPreliminary,
      @JsonKey(name: 'episodes_watched') int? episodesWatched});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? entry = freezed,
    Object? malId = null,
    Object? url = null,
    Object? type = null,
    Object? reactions = null,
    Object? date = null,
    Object? review = null,
    Object? score = freezed,
    Object? tags = null,
    Object? isSpoiler = null,
    Object? isPreliminary = null,
    Object? episodesWatched = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      entry: freezed == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      malId: null == malId
          ? _value.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reactions: null == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isSpoiler: null == isSpoiler
          ? _value.isSpoiler
          : isSpoiler // ignore: cast_nullable_to_non_nullable
              as bool,
      isPreliminary: null == isPreliminary
          ? _value.isPreliminary
          : isPreliminary // ignore: cast_nullable_to_non_nullable
              as bool,
      episodesWatched: freezed == episodesWatched
          ? _value.episodesWatched
          : episodesWatched // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> user,
      Map<String, dynamic>? entry,
      @JsonKey(name: 'mal_id') int malId,
      String url,
      String type,
      Map<String, dynamic> reactions,
      String date,
      String review,
      int? score,
      List<String> tags,
      @JsonKey(name: 'is_spoiler') bool isSpoiler,
      @JsonKey(name: 'is_preliminary') bool isPreliminary,
      @JsonKey(name: 'episodes_watched') int? episodesWatched});
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? entry = freezed,
    Object? malId = null,
    Object? url = null,
    Object? type = null,
    Object? reactions = null,
    Object? date = null,
    Object? review = null,
    Object? score = freezed,
    Object? tags = null,
    Object? isSpoiler = null,
    Object? isPreliminary = null,
    Object? episodesWatched = freezed,
  }) {
    return _then(_$ReviewImpl(
      user: null == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      entry: freezed == entry
          ? _value._entry
          : entry // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      malId: null == malId
          ? _value.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reactions: null == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isSpoiler: null == isSpoiler
          ? _value.isSpoiler
          : isSpoiler // ignore: cast_nullable_to_non_nullable
              as bool,
      isPreliminary: null == isPreliminary
          ? _value.isPreliminary
          : isPreliminary // ignore: cast_nullable_to_non_nullable
              as bool,
      episodesWatched: freezed == episodesWatched
          ? _value.episodesWatched
          : episodesWatched // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  _$ReviewImpl(
      {required final Map<String, dynamic> user,
      final Map<String, dynamic>? entry,
      @JsonKey(name: 'mal_id') required this.malId,
      required this.url,
      required this.type,
      required final Map<String, dynamic> reactions,
      required this.date,
      required this.review,
      this.score,
      required final List<String> tags,
      @JsonKey(name: 'is_spoiler') required this.isSpoiler,
      @JsonKey(name: 'is_preliminary') required this.isPreliminary,
      @JsonKey(name: 'episodes_watched') this.episodesWatched})
      : _user = user,
        _entry = entry,
        _reactions = reactions,
        _tags = tags;

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  final Map<String, dynamic> _user;
  @override
  Map<String, dynamic> get user {
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_user);
  }

  final Map<String, dynamic>? _entry;
  @override
  Map<String, dynamic>? get entry {
    final value = _entry;
    if (value == null) return null;
    if (_entry is EqualUnmodifiableMapView) return _entry;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'mal_id')
  final int malId;
  @override
  final String url;
  @override
  final String type;
  final Map<String, dynamic> _reactions;
  @override
  Map<String, dynamic> get reactions {
    if (_reactions is EqualUnmodifiableMapView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_reactions);
  }

  @override
  final String date;
  @override
  final String review;
  @override
  final int? score;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey(name: 'is_spoiler')
  final bool isSpoiler;
  @override
  @JsonKey(name: 'is_preliminary')
  final bool isPreliminary;
  @override
  @JsonKey(name: 'episodes_watched')
  final int? episodesWatched;

  @override
  String toString() {
    return 'Review(user: $user, entry: $entry, malId: $malId, url: $url, type: $type, reactions: $reactions, date: $date, review: $review, score: $score, tags: $tags, isSpoiler: $isSpoiler, isPreliminary: $isPreliminary, episodesWatched: $episodesWatched)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            const DeepCollectionEquality().equals(other._user, _user) &&
            const DeepCollectionEquality().equals(other._entry, _entry) &&
            (identical(other.malId, malId) || other.malId == malId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isSpoiler, isSpoiler) ||
                other.isSpoiler == isSpoiler) &&
            (identical(other.isPreliminary, isPreliminary) ||
                other.isPreliminary == isPreliminary) &&
            (identical(other.episodesWatched, episodesWatched) ||
                other.episodesWatched == episodesWatched));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_user),
      const DeepCollectionEquality().hash(_entry),
      malId,
      url,
      type,
      const DeepCollectionEquality().hash(_reactions),
      date,
      review,
      score,
      const DeepCollectionEquality().hash(_tags),
      isSpoiler,
      isPreliminary,
      episodesWatched);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  factory _Review(
          {required final Map<String, dynamic> user,
          final Map<String, dynamic>? entry,
          @JsonKey(name: 'mal_id') required final int malId,
          required final String url,
          required final String type,
          required final Map<String, dynamic> reactions,
          required final String date,
          required final String review,
          final int? score,
          required final List<String> tags,
          @JsonKey(name: 'is_spoiler') required final bool isSpoiler,
          @JsonKey(name: 'is_preliminary') required final bool isPreliminary,
          @JsonKey(name: 'episodes_watched') final int? episodesWatched}) =
      _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  Map<String, dynamic> get user;
  @override
  Map<String, dynamic>? get entry;
  @override
  @JsonKey(name: 'mal_id')
  int get malId;
  @override
  String get url;
  @override
  String get type;
  @override
  Map<String, dynamic> get reactions;
  @override
  String get date;
  @override
  String get review;
  @override
  int? get score;
  @override
  List<String> get tags;
  @override
  @JsonKey(name: 'is_spoiler')
  bool get isSpoiler;
  @override
  @JsonKey(name: 'is_preliminary')
  bool get isPreliminary;
  @override
  @JsonKey(name: 'episodes_watched')
  int? get episodesWatched;
  @override
  @JsonKey(ignore: true)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
