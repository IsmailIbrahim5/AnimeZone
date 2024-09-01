// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsContainer _$NewsContainerFromJson(Map<String, dynamic> json) {
  return _NewsContainer.fromJson(json);
}

/// @nodoc
mixin _$NewsContainer {
  @JsonKey(name: 'last_visible_page')
  int get lastVisiblePage => throw _privateConstructorUsedError;
  @NewsConverter()
  List<News> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsContainerCopyWith<NewsContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsContainerCopyWith<$Res> {
  factory $NewsContainerCopyWith(
          NewsContainer value, $Res Function(NewsContainer) then) =
      _$NewsContainerCopyWithImpl<$Res, NewsContainer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'last_visible_page') int lastVisiblePage,
      @NewsConverter() List<News> data});
}

/// @nodoc
class _$NewsContainerCopyWithImpl<$Res, $Val extends NewsContainer>
    implements $NewsContainerCopyWith<$Res> {
  _$NewsContainerCopyWithImpl(this._value, this._then);

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
              as List<News>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsContainerImplCopyWith<$Res>
    implements $NewsContainerCopyWith<$Res> {
  factory _$$NewsContainerImplCopyWith(
          _$NewsContainerImpl value, $Res Function(_$NewsContainerImpl) then) =
      __$$NewsContainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'last_visible_page') int lastVisiblePage,
      @NewsConverter() List<News> data});
}

/// @nodoc
class __$$NewsContainerImplCopyWithImpl<$Res>
    extends _$NewsContainerCopyWithImpl<$Res, _$NewsContainerImpl>
    implements _$$NewsContainerImplCopyWith<$Res> {
  __$$NewsContainerImplCopyWithImpl(
      _$NewsContainerImpl _value, $Res Function(_$NewsContainerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastVisiblePage = null,
    Object? data = null,
  }) {
    return _then(_$NewsContainerImpl(
      lastVisiblePage: null == lastVisiblePage
          ? _value.lastVisiblePage
          : lastVisiblePage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<News>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsContainerImpl implements _NewsContainer {
  _$NewsContainerImpl(
      {@JsonKey(name: 'last_visible_page') required this.lastVisiblePage,
      @NewsConverter() required final List<News> data})
      : _data = data;

  factory _$NewsContainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsContainerImplFromJson(json);

  @override
  @JsonKey(name: 'last_visible_page')
  final int lastVisiblePage;
  final List<News> _data;
  @override
  @NewsConverter()
  List<News> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'NewsContainer(lastVisiblePage: $lastVisiblePage, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsContainerImpl &&
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
  _$$NewsContainerImplCopyWith<_$NewsContainerImpl> get copyWith =>
      __$$NewsContainerImplCopyWithImpl<_$NewsContainerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsContainerImplToJson(
      this,
    );
  }
}

abstract class _NewsContainer implements NewsContainer {
  factory _NewsContainer(
      {@JsonKey(name: 'last_visible_page') required final int lastVisiblePage,
      @NewsConverter() required final List<News> data}) = _$NewsContainerImpl;

  factory _NewsContainer.fromJson(Map<String, dynamic> json) =
      _$NewsContainerImpl.fromJson;

  @override
  @JsonKey(name: 'last_visible_page')
  int get lastVisiblePage;
  @override
  @NewsConverter()
  List<News> get data;
  @override
  @JsonKey(ignore: true)
  _$$NewsContainerImplCopyWith<_$NewsContainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
mixin _$News {
  @JsonKey(name: 'mal_id')
  int get malId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_username')
  String get authorUsername => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_url')
  String get authorUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'forum_url')
  String get forumUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  @ImagesConverter()
  Image get image => throw _privateConstructorUsedError;
  int get comments => throw _privateConstructorUsedError;
  String get excerpt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res, News>;
  @useResult
  $Res call(
      {@JsonKey(name: 'mal_id') int malId,
      String url,
      String title,
      String date,
      @JsonKey(name: 'author_username') String authorUsername,
      @JsonKey(name: 'author_url') String authorUrl,
      @JsonKey(name: 'forum_url') String forumUrl,
      @JsonKey(name: 'images') @ImagesConverter() Image image,
      int comments,
      String excerpt});
}

/// @nodoc
class _$NewsCopyWithImpl<$Res, $Val extends News>
    implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

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
    Object? forumUrl = null,
    Object? image = null,
    Object? comments = null,
    Object? excerpt = null,
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
      forumUrl: null == forumUrl
          ? _value.forumUrl
          : forumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      excerpt: null == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$$NewsImplCopyWith(
          _$NewsImpl value, $Res Function(_$NewsImpl) then) =
      __$$NewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mal_id') int malId,
      String url,
      String title,
      String date,
      @JsonKey(name: 'author_username') String authorUsername,
      @JsonKey(name: 'author_url') String authorUrl,
      @JsonKey(name: 'forum_url') String forumUrl,
      @JsonKey(name: 'images') @ImagesConverter() Image image,
      int comments,
      String excerpt});
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res>
    extends _$NewsCopyWithImpl<$Res, _$NewsImpl>
    implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then)
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
    Object? forumUrl = null,
    Object? image = null,
    Object? comments = null,
    Object? excerpt = null,
  }) {
    return _then(_$NewsImpl(
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
      forumUrl: null == forumUrl
          ? _value.forumUrl
          : forumUrl // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      excerpt: null == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsImpl implements _News {
  _$NewsImpl(
      {@JsonKey(name: 'mal_id') required this.malId,
      required this.url,
      required this.title,
      required this.date,
      @JsonKey(name: 'author_username') required this.authorUsername,
      @JsonKey(name: 'author_url') required this.authorUrl,
      @JsonKey(name: 'forum_url') required this.forumUrl,
      @JsonKey(name: 'images') @ImagesConverter() required this.image,
      required this.comments,
      required this.excerpt});

  factory _$NewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsImplFromJson(json);

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
  @override
  @JsonKey(name: 'forum_url')
  final String forumUrl;
  @override
  @JsonKey(name: 'images')
  @ImagesConverter()
  final Image image;
  @override
  final int comments;
  @override
  final String excerpt;

  @override
  String toString() {
    return 'News(malId: $malId, url: $url, title: $title, date: $date, authorUsername: $authorUsername, authorUrl: $authorUrl, forumUrl: $forumUrl, image: $image, comments: $comments, excerpt: $excerpt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            (identical(other.malId, malId) || other.malId == malId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.authorUsername, authorUsername) ||
                other.authorUsername == authorUsername) &&
            (identical(other.authorUrl, authorUrl) ||
                other.authorUrl == authorUrl) &&
            (identical(other.forumUrl, forumUrl) ||
                other.forumUrl == forumUrl) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.excerpt, excerpt) || other.excerpt == excerpt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, malId, url, title, date,
      authorUsername, authorUrl, forumUrl, image, comments, excerpt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsImplToJson(
      this,
    );
  }
}

abstract class _News implements News {
  factory _News(
      {@JsonKey(name: 'mal_id') required final int malId,
      required final String url,
      required final String title,
      required final String date,
      @JsonKey(name: 'author_username') required final String authorUsername,
      @JsonKey(name: 'author_url') required final String authorUrl,
      @JsonKey(name: 'forum_url') required final String forumUrl,
      @JsonKey(name: 'images') @ImagesConverter() required final Image image,
      required final int comments,
      required final String excerpt}) = _$NewsImpl;

  factory _News.fromJson(Map<String, dynamic> json) = _$NewsImpl.fromJson;

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
  @JsonKey(name: 'forum_url')
  String get forumUrl;
  @override
  @JsonKey(name: 'images')
  @ImagesConverter()
  Image get image;
  @override
  int get comments;
  @override
  String get excerpt;
  @override
  @JsonKey(ignore: true)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
