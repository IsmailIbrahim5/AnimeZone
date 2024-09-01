// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForumContainer _$ForumContainerFromJson(Map<String, dynamic> json) {
  return _ForumContainer.fromJson(json);
}

/// @nodoc
mixin _$ForumContainer {
  @JsonKey(name: 'last_visible_page')
  int get lastVisiblePage => throw _privateConstructorUsedError;
  @ForumConverter()
  List<Forum> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForumContainerCopyWith<ForumContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumContainerCopyWith<$Res> {
  factory $ForumContainerCopyWith(
          ForumContainer value, $Res Function(ForumContainer) then) =
      _$ForumContainerCopyWithImpl<$Res, ForumContainer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'last_visible_page') int lastVisiblePage,
      @ForumConverter() List<Forum> data});
}

/// @nodoc
class _$ForumContainerCopyWithImpl<$Res, $Val extends ForumContainer>
    implements $ForumContainerCopyWith<$Res> {
  _$ForumContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastVisiblePage = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      lastVisiblePage: null == lastVisiblePage
          ? _value.lastVisiblePage
          : lastVisiblePage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Forum>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumContainerImplCopyWith<$Res>
    implements $ForumContainerCopyWith<$Res> {
  factory _$$ForumContainerImplCopyWith(_$ForumContainerImpl value,
          $Res Function(_$ForumContainerImpl) then) =
      __$$ForumContainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'last_visible_page') int lastVisiblePage,
      @ForumConverter() List<Forum> data});
}

/// @nodoc
class __$$ForumContainerImplCopyWithImpl<$Res>
    extends _$ForumContainerCopyWithImpl<$Res, _$ForumContainerImpl>
    implements _$$ForumContainerImplCopyWith<$Res> {
  __$$ForumContainerImplCopyWithImpl(
      _$ForumContainerImpl _value, $Res Function(_$ForumContainerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastVisiblePage = null,
    Object? data = null,
  }) {
    return _then(_$ForumContainerImpl(
      lastVisiblePage: null == lastVisiblePage
          ? _value.lastVisiblePage
          : lastVisiblePage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Forum>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumContainerImpl implements _ForumContainer {
  _$ForumContainerImpl(
      {@JsonKey(name: 'last_visible_page') required this.lastVisiblePage,
      @ForumConverter() required final List<Forum> data})
      : _data = data;

  factory _$ForumContainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumContainerImplFromJson(json);

  @override
  @JsonKey(name: 'last_visible_page')
  final int lastVisiblePage;
  final List<Forum> _data;
  @override
  @ForumConverter()
  List<Forum> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ForumContainer(lastVisiblePage: $lastVisiblePage, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumContainerImpl &&
            (identical(other.lastVisiblePage, lastVisiblePage) ||
                other.lastVisiblePage == lastVisiblePage) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, lastVisiblePage, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumContainerImplCopyWith<_$ForumContainerImpl> get copyWith =>
      __$$ForumContainerImplCopyWithImpl<_$ForumContainerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumContainerImplToJson(
      this,
    );
  }
}

abstract class _ForumContainer implements ForumContainer {
  factory _ForumContainer(
      {@JsonKey(name: 'last_visible_page') required final int lastVisiblePage,
      @ForumConverter()
      required final List<Forum> data}) = _$ForumContainerImpl;

  factory _ForumContainer.fromJson(Map<String, dynamic> json) =
      _$ForumContainerImpl.fromJson;

  @override
  @JsonKey(name: 'last_visible_page')
  int get lastVisiblePage;
  @override
  @ForumConverter()
  List<Forum> get data;
  @override
  @JsonKey(ignore: true)
  _$$ForumContainerImplCopyWith<_$ForumContainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Forum _$ForumFromJson(Map<String, dynamic> json) {
  return _Forum.fromJson(json);
}

/// @nodoc
mixin _$Forum {
  @JsonKey(name: 'mal_id')
  int get malId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_username')
  String get authorUsername => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_url')
  String get authorUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get entry => throw _privateConstructorUsedError;
  Map<String, dynamic>? get board => throw _privateConstructorUsedError;
  int get comments => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_comment')
  Map<String, dynamic> get lastComment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForumCopyWith<Forum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumCopyWith<$Res> {
  factory $ForumCopyWith(Forum value, $Res Function(Forum) then) =
      _$ForumCopyWithImpl<$Res, Forum>;
  @useResult
  $Res call(
      {@JsonKey(name: 'mal_id') int malId,
      String url,
      String title,
      String date,
      @JsonKey(name: 'author_username') String authorUsername,
      @JsonKey(name: 'author_url') String authorUrl,
      Map<String, dynamic>? entry,
      Map<String, dynamic>? board,
      int comments,
      @JsonKey(name: 'last_comment') Map<String, dynamic> lastComment});
}

/// @nodoc
class _$ForumCopyWithImpl<$Res, $Val extends Forum>
    implements $ForumCopyWith<$Res> {
  _$ForumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malId = null,
    Object? url = null,
    Object? title = null,
    Object? date = null,
    Object? authorUsername = null,
    Object? authorUrl = null,
    Object? entry = freezed,
    Object? board = freezed,
    Object? comments = null,
    Object? lastComment = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      authorUsername: null == authorUsername
          ? _value.authorUsername
          : authorUsername // ignore: cast_nullable_to_non_nullable
              as String,
      authorUrl: null == authorUrl
          ? _value.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String,
      entry: freezed == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      board: freezed == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      lastComment: null == lastComment
          ? _value.lastComment
          : lastComment // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumImplCopyWith<$Res> implements $ForumCopyWith<$Res> {
  factory _$$ForumImplCopyWith(
          _$ForumImpl value, $Res Function(_$ForumImpl) then) =
      __$$ForumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mal_id') int malId,
      String url,
      String title,
      String date,
      @JsonKey(name: 'author_username') String authorUsername,
      @JsonKey(name: 'author_url') String authorUrl,
      Map<String, dynamic>? entry,
      Map<String, dynamic>? board,
      int comments,
      @JsonKey(name: 'last_comment') Map<String, dynamic> lastComment});
}

/// @nodoc
class __$$ForumImplCopyWithImpl<$Res>
    extends _$ForumCopyWithImpl<$Res, _$ForumImpl>
    implements _$$ForumImplCopyWith<$Res> {
  __$$ForumImplCopyWithImpl(
      _$ForumImpl _value, $Res Function(_$ForumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malId = null,
    Object? url = null,
    Object? title = null,
    Object? date = null,
    Object? authorUsername = null,
    Object? authorUrl = null,
    Object? entry = freezed,
    Object? board = freezed,
    Object? comments = null,
    Object? lastComment = null,
  }) {
    return _then(_$ForumImpl(
      malId: null == malId
          ? _value.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      authorUsername: null == authorUsername
          ? _value.authorUsername
          : authorUsername // ignore: cast_nullable_to_non_nullable
              as String,
      authorUrl: null == authorUrl
          ? _value.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String,
      entry: freezed == entry
          ? _value._entry
          : entry // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      board: freezed == board
          ? _value._board
          : board // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      lastComment: null == lastComment
          ? _value._lastComment
          : lastComment // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForumImpl implements _Forum {
  _$ForumImpl(
      {@JsonKey(name: 'mal_id') required this.malId,
      required this.url,
      required this.title,
      required this.date,
      @JsonKey(name: 'author_username') required this.authorUsername,
      @JsonKey(name: 'author_url') required this.authorUrl,
      final Map<String, dynamic>? entry,
      final Map<String, dynamic>? board,
      required this.comments,
      @JsonKey(name: 'last_comment')
      required final Map<String, dynamic> lastComment})
      : _entry = entry,
        _board = board,
        _lastComment = lastComment;

  factory _$ForumImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForumImplFromJson(json);

  @override
  @JsonKey(name: 'mal_id')
  final int malId;
  @override
  final String url;
  @override
  final String title;
  @override
  final String date;
  @override
  @JsonKey(name: 'author_username')
  final String authorUsername;
  @override
  @JsonKey(name: 'author_url')
  final String authorUrl;
  final Map<String, dynamic>? _entry;
  @override
  Map<String, dynamic>? get entry {
    final value = _entry;
    if (value == null) return null;
    if (_entry is EqualUnmodifiableMapView) return _entry;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _board;
  @override
  Map<String, dynamic>? get board {
    final value = _board;
    if (value == null) return null;
    if (_board is EqualUnmodifiableMapView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int comments;
  final Map<String, dynamic> _lastComment;
  @override
  @JsonKey(name: 'last_comment')
  Map<String, dynamic> get lastComment {
    if (_lastComment is EqualUnmodifiableMapView) return _lastComment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lastComment);
  }

  @override
  String toString() {
    return 'Forum(malId: $malId, url: $url, title: $title, date: $date, authorUsername: $authorUsername, authorUrl: $authorUrl, entry: $entry, board: $board, comments: $comments, lastComment: $lastComment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumImpl &&
            (identical(other.malId, malId) || other.malId == malId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.authorUsername, authorUsername) ||
                other.authorUsername == authorUsername) &&
            (identical(other.authorUrl, authorUrl) ||
                other.authorUrl == authorUrl) &&
            const DeepCollectionEquality().equals(other._entry, _entry) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            const DeepCollectionEquality()
                .equals(other._lastComment, _lastComment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      malId,
      url,
      title,
      date,
      authorUsername,
      authorUrl,
      const DeepCollectionEquality().hash(_entry),
      const DeepCollectionEquality().hash(_board),
      comments,
      const DeepCollectionEquality().hash(_lastComment));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumImplCopyWith<_$ForumImpl> get copyWith =>
      __$$ForumImplCopyWithImpl<_$ForumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForumImplToJson(
      this,
    );
  }
}

abstract class _Forum implements Forum {
  factory _Forum(
      {@JsonKey(name: 'mal_id') required final int malId,
      required final String url,
      required final String title,
      required final String date,
      @JsonKey(name: 'author_username') required final String authorUsername,
      @JsonKey(name: 'author_url') required final String authorUrl,
      final Map<String, dynamic>? entry,
      final Map<String, dynamic>? board,
      required final int comments,
      @JsonKey(name: 'last_comment')
      required final Map<String, dynamic> lastComment}) = _$ForumImpl;

  factory _Forum.fromJson(Map<String, dynamic> json) = _$ForumImpl.fromJson;

  @override
  @JsonKey(name: 'mal_id')
  int get malId;
  @override
  String get url;
  @override
  String get title;
  @override
  String get date;
  @override
  @JsonKey(name: 'author_username')
  String get authorUsername;
  @override
  @JsonKey(name: 'author_url')
  String get authorUrl;
  @override
  Map<String, dynamic>? get entry;
  @override
  Map<String, dynamic>? get board;
  @override
  int get comments;
  @override
  @JsonKey(name: 'last_comment')
  Map<String, dynamic> get lastComment;
  @override
  @JsonKey(ignore: true)
  _$$ForumImplCopyWith<_$ForumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
