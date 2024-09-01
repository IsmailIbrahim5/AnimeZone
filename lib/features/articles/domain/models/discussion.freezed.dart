// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discussion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Discussion _$DiscussionFromJson(Map<String, dynamic> json) {
  return _Discussion.fromJson(json);
}

/// @nodoc
mixin _$Discussion {
  String get url => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DiscussionElement get topic => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_visible_page')
  int get lastVisiblePage => throw _privateConstructorUsedError;
  List<DiscussionElement> get replies => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscussionCopyWith<Discussion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscussionCopyWith<$Res> {
  factory $DiscussionCopyWith(
          Discussion value, $Res Function(Discussion) then) =
      _$DiscussionCopyWithImpl<$Res, Discussion>;
  @useResult
  $Res call(
      {String url,
      String title,
      DiscussionElement topic,
      @JsonKey(name: 'last_visible_page') int lastVisiblePage,
      List<DiscussionElement> replies});

  $DiscussionElementCopyWith<$Res> get topic;
}

/// @nodoc
class _$DiscussionCopyWithImpl<$Res, $Val extends Discussion>
    implements $DiscussionCopyWith<$Res> {
  _$DiscussionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? title = null,
    Object? topic = null,
    Object? lastVisiblePage = null,
    Object? replies = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as DiscussionElement,
      lastVisiblePage: null == lastVisiblePage
          ? _value.lastVisiblePage
          : lastVisiblePage // ignore: cast_nullable_to_non_nullable
              as int,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<DiscussionElement>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscussionElementCopyWith<$Res> get topic {
    return $DiscussionElementCopyWith<$Res>(_value.topic, (value) {
      return _then(_value.copyWith(topic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiscussionImplCopyWith<$Res>
    implements $DiscussionCopyWith<$Res> {
  factory _$$DiscussionImplCopyWith(
          _$DiscussionImpl value, $Res Function(_$DiscussionImpl) then) =
      __$$DiscussionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      String title,
      DiscussionElement topic,
      @JsonKey(name: 'last_visible_page') int lastVisiblePage,
      List<DiscussionElement> replies});

  @override
  $DiscussionElementCopyWith<$Res> get topic;
}

/// @nodoc
class __$$DiscussionImplCopyWithImpl<$Res>
    extends _$DiscussionCopyWithImpl<$Res, _$DiscussionImpl>
    implements _$$DiscussionImplCopyWith<$Res> {
  __$$DiscussionImplCopyWithImpl(
      _$DiscussionImpl _value, $Res Function(_$DiscussionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? title = null,
    Object? topic = null,
    Object? lastVisiblePage = null,
    Object? replies = null,
  }) {
    return _then(_$DiscussionImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as DiscussionElement,
      lastVisiblePage: null == lastVisiblePage
          ? _value.lastVisiblePage
          : lastVisiblePage // ignore: cast_nullable_to_non_nullable
              as int,
      replies: null == replies
          ? _value._replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<DiscussionElement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscussionImpl implements _Discussion {
  _$DiscussionImpl(
      {required this.url,
      required this.title,
      required this.topic,
      @JsonKey(name: 'last_visible_page') required this.lastVisiblePage,
      required final List<DiscussionElement> replies})
      : _replies = replies;

  factory _$DiscussionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscussionImplFromJson(json);

  @override
  final String url;
  @override
  final String title;
  @override
  final DiscussionElement topic;
  @override
  @JsonKey(name: 'last_visible_page')
  final int lastVisiblePage;
  final List<DiscussionElement> _replies;
  @override
  List<DiscussionElement> get replies {
    if (_replies is EqualUnmodifiableListView) return _replies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replies);
  }

  @override
  String toString() {
    return 'Discussion(url: $url, title: $title, topic: $topic, lastVisiblePage: $lastVisiblePage, replies: $replies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscussionImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.lastVisiblePage, lastVisiblePage) ||
                other.lastVisiblePage == lastVisiblePage) &&
            const DeepCollectionEquality().equals(other._replies, _replies));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, title, topic,
      lastVisiblePage, const DeepCollectionEquality().hash(_replies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscussionImplCopyWith<_$DiscussionImpl> get copyWith =>
      __$$DiscussionImplCopyWithImpl<_$DiscussionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscussionImplToJson(
      this,
    );
  }
}

abstract class _Discussion implements Discussion {
  factory _Discussion(
      {required final String url,
      required final String title,
      required final DiscussionElement topic,
      @JsonKey(name: 'last_visible_page') required final int lastVisiblePage,
      required final List<DiscussionElement> replies}) = _$DiscussionImpl;

  factory _Discussion.fromJson(Map<String, dynamic> json) =
      _$DiscussionImpl.fromJson;

  @override
  String get url;
  @override
  String get title;
  @override
  DiscussionElement get topic;
  @override
  @JsonKey(name: 'last_visible_page')
  int get lastVisiblePage;
  @override
  List<DiscussionElement> get replies;
  @override
  @JsonKey(ignore: true)
  _$$DiscussionImplCopyWith<_$DiscussionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiscussionElement _$DiscussionElementFromJson(Map<String, dynamic> json) {
  return _DiscussionElement.fromJson(json);
}

/// @nodoc
mixin _$DiscussionElement {
  int get date => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userUrl => throw _privateConstructorUsedError;
  String get userStatus => throw _privateConstructorUsedError;
  String get userJoined => throw _privateConstructorUsedError;
  String? get userIcon => throw _privateConstructorUsedError;
  int get postsCount => throw _privateConstructorUsedError;
  Map<String, dynamic>? get reply => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get content => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get followContent =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscussionElementCopyWith<DiscussionElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscussionElementCopyWith<$Res> {
  factory $DiscussionElementCopyWith(
          DiscussionElement value, $Res Function(DiscussionElement) then) =
      _$DiscussionElementCopyWithImpl<$Res, DiscussionElement>;
  @useResult
  $Res call(
      {int date,
      String userName,
      String userUrl,
      String userStatus,
      String userJoined,
      String? userIcon,
      int postsCount,
      Map<String, dynamic>? reply,
      List<Map<String, dynamic>> content,
      List<Map<String, dynamic>>? followContent});
}

/// @nodoc
class _$DiscussionElementCopyWithImpl<$Res, $Val extends DiscussionElement>
    implements $DiscussionElementCopyWith<$Res> {
  _$DiscussionElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? userName = null,
    Object? userUrl = null,
    Object? userStatus = null,
    Object? userJoined = null,
    Object? userIcon = freezed,
    Object? postsCount = null,
    Object? reply = freezed,
    Object? content = null,
    Object? followContent = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userUrl: null == userUrl
          ? _value.userUrl
          : userUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as String,
      userJoined: null == userJoined
          ? _value.userJoined
          : userJoined // ignore: cast_nullable_to_non_nullable
              as String,
      userIcon: freezed == userIcon
          ? _value.userIcon
          : userIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      postsCount: null == postsCount
          ? _value.postsCount
          : postsCount // ignore: cast_nullable_to_non_nullable
              as int,
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      followContent: freezed == followContent
          ? _value.followContent
          : followContent // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscussionElementImplCopyWith<$Res>
    implements $DiscussionElementCopyWith<$Res> {
  factory _$$DiscussionElementImplCopyWith(_$DiscussionElementImpl value,
          $Res Function(_$DiscussionElementImpl) then) =
      __$$DiscussionElementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int date,
      String userName,
      String userUrl,
      String userStatus,
      String userJoined,
      String? userIcon,
      int postsCount,
      Map<String, dynamic>? reply,
      List<Map<String, dynamic>> content,
      List<Map<String, dynamic>>? followContent});
}

/// @nodoc
class __$$DiscussionElementImplCopyWithImpl<$Res>
    extends _$DiscussionElementCopyWithImpl<$Res, _$DiscussionElementImpl>
    implements _$$DiscussionElementImplCopyWith<$Res> {
  __$$DiscussionElementImplCopyWithImpl(_$DiscussionElementImpl _value,
      $Res Function(_$DiscussionElementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? userName = null,
    Object? userUrl = null,
    Object? userStatus = null,
    Object? userJoined = null,
    Object? userIcon = freezed,
    Object? postsCount = null,
    Object? reply = freezed,
    Object? content = null,
    Object? followContent = freezed,
  }) {
    return _then(_$DiscussionElementImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userUrl: null == userUrl
          ? _value.userUrl
          : userUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userStatus: null == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as String,
      userJoined: null == userJoined
          ? _value.userJoined
          : userJoined // ignore: cast_nullable_to_non_nullable
              as String,
      userIcon: freezed == userIcon
          ? _value.userIcon
          : userIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      postsCount: null == postsCount
          ? _value.postsCount
          : postsCount // ignore: cast_nullable_to_non_nullable
              as int,
      reply: freezed == reply
          ? _value._reply
          : reply // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      followContent: freezed == followContent
          ? _value._followContent
          : followContent // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscussionElementImpl implements _DiscussionElement {
  _$DiscussionElementImpl(
      {required this.date,
      required this.userName,
      required this.userUrl,
      required this.userStatus,
      required this.userJoined,
      this.userIcon,
      required this.postsCount,
      final Map<String, dynamic>? reply,
      required final List<Map<String, dynamic>> content,
      final List<Map<String, dynamic>>? followContent})
      : _reply = reply,
        _content = content,
        _followContent = followContent;

  factory _$DiscussionElementImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscussionElementImplFromJson(json);

  @override
  final int date;
  @override
  final String userName;
  @override
  final String userUrl;
  @override
  final String userStatus;
  @override
  final String userJoined;
  @override
  final String? userIcon;
  @override
  final int postsCount;
  final Map<String, dynamic>? _reply;
  @override
  Map<String, dynamic>? get reply {
    final value = _reply;
    if (value == null) return null;
    if (_reply is EqualUnmodifiableMapView) return _reply;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Map<String, dynamic>> _content;
  @override
  List<Map<String, dynamic>> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  final List<Map<String, dynamic>>? _followContent;
  @override
  List<Map<String, dynamic>>? get followContent {
    final value = _followContent;
    if (value == null) return null;
    if (_followContent is EqualUnmodifiableListView) return _followContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DiscussionElement(date: $date, userName: $userName, userUrl: $userUrl, userStatus: $userStatus, userJoined: $userJoined, userIcon: $userIcon, postsCount: $postsCount, reply: $reply, content: $content, followContent: $followContent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscussionElementImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userUrl, userUrl) || other.userUrl == userUrl) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.userJoined, userJoined) ||
                other.userJoined == userJoined) &&
            (identical(other.userIcon, userIcon) ||
                other.userIcon == userIcon) &&
            (identical(other.postsCount, postsCount) ||
                other.postsCount == postsCount) &&
            const DeepCollectionEquality().equals(other._reply, _reply) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            const DeepCollectionEquality()
                .equals(other._followContent, _followContent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      userName,
      userUrl,
      userStatus,
      userJoined,
      userIcon,
      postsCount,
      const DeepCollectionEquality().hash(_reply),
      const DeepCollectionEquality().hash(_content),
      const DeepCollectionEquality().hash(_followContent));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscussionElementImplCopyWith<_$DiscussionElementImpl> get copyWith =>
      __$$DiscussionElementImplCopyWithImpl<_$DiscussionElementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscussionElementImplToJson(
      this,
    );
  }
}

abstract class _DiscussionElement implements DiscussionElement {
  factory _DiscussionElement(
          {required final int date,
          required final String userName,
          required final String userUrl,
          required final String userStatus,
          required final String userJoined,
          final String? userIcon,
          required final int postsCount,
          final Map<String, dynamic>? reply,
          required final List<Map<String, dynamic>> content,
          final List<Map<String, dynamic>>? followContent}) =
      _$DiscussionElementImpl;

  factory _DiscussionElement.fromJson(Map<String, dynamic> json) =
      _$DiscussionElementImpl.fromJson;

  @override
  int get date;
  @override
  String get userName;
  @override
  String get userUrl;
  @override
  String get userStatus;
  @override
  String get userJoined;
  @override
  String? get userIcon;
  @override
  int get postsCount;
  @override
  Map<String, dynamic>? get reply;
  @override
  List<Map<String, dynamic>> get content;
  @override
  List<Map<String, dynamic>>? get followContent;
  @override
  @JsonKey(ignore: true)
  _$$DiscussionElementImplCopyWith<_$DiscussionElementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
