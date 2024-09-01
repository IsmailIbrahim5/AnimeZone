// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recentNewsHash() => r'5980773b508389cdca59fce8023c2a44b3931b79';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [recentNews].
@ProviderFor(recentNews)
const recentNewsProvider = RecentNewsFamily();

/// See also [recentNews].
class RecentNewsFamily extends Family<AsyncValue<NewsContainer>> {
  /// See also [recentNews].
  const RecentNewsFamily();

  /// See also [recentNews].
  RecentNewsProvider call({
    String filters = '',
    int? page,
  }) {
    return RecentNewsProvider(
      filters: filters,
      page: page,
    );
  }

  @override
  RecentNewsProvider getProviderOverride(
    covariant RecentNewsProvider provider,
  ) {
    return call(
      filters: provider.filters,
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recentNewsProvider';
}

/// See also [recentNews].
class RecentNewsProvider extends FutureProvider<NewsContainer> {
  /// See also [recentNews].
  RecentNewsProvider({
    String filters = '',
    int? page,
  }) : this._internal(
          (ref) => recentNews(
            ref as RecentNewsRef,
            filters: filters,
            page: page,
          ),
          from: recentNewsProvider,
          name: r'recentNewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recentNewsHash,
          dependencies: RecentNewsFamily._dependencies,
          allTransitiveDependencies:
              RecentNewsFamily._allTransitiveDependencies,
          filters: filters,
          page: page,
        );

  RecentNewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filters,
    required this.page,
  }) : super.internal();

  final String filters;
  final int? page;

  @override
  Override overrideWith(
    FutureOr<NewsContainer> Function(RecentNewsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecentNewsProvider._internal(
        (ref) => create(ref as RecentNewsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filters: filters,
        page: page,
      ),
    );
  }

  @override
  FutureProviderElement<NewsContainer> createElement() {
    return _RecentNewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecentNewsProvider &&
        other.filters == filters &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filters.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecentNewsRef on FutureProviderRef<NewsContainer> {
  /// The parameter `filters` of this provider.
  String get filters;

  /// The parameter `page` of this provider.
  int? get page;
}

class _RecentNewsProviderElement extends FutureProviderElement<NewsContainer>
    with RecentNewsRef {
  _RecentNewsProviderElement(super.provider);

  @override
  String get filters => (origin as RecentNewsProvider).filters;
  @override
  int? get page => (origin as RecentNewsProvider).page;
}

String _$tagNewsHash() => r'd237c16882d5a06a6b017c6275e7959571577164';

/// See also [tagNews].
@ProviderFor(tagNews)
const tagNewsProvider = TagNewsFamily();

/// See also [tagNews].
class TagNewsFamily extends Family<AsyncValue<NewsContainer>> {
  /// See also [tagNews].
  const TagNewsFamily();

  /// See also [tagNews].
  TagNewsProvider call({
    String filters = '',
    required String tag,
    int? page,
  }) {
    return TagNewsProvider(
      filters: filters,
      tag: tag,
      page: page,
    );
  }

  @override
  TagNewsProvider getProviderOverride(
    covariant TagNewsProvider provider,
  ) {
    return call(
      filters: provider.filters,
      tag: provider.tag,
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tagNewsProvider';
}

/// See also [tagNews].
class TagNewsProvider extends FutureProvider<NewsContainer> {
  /// See also [tagNews].
  TagNewsProvider({
    String filters = '',
    required String tag,
    int? page,
  }) : this._internal(
          (ref) => tagNews(
            ref as TagNewsRef,
            filters: filters,
            tag: tag,
            page: page,
          ),
          from: tagNewsProvider,
          name: r'tagNewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tagNewsHash,
          dependencies: TagNewsFamily._dependencies,
          allTransitiveDependencies: TagNewsFamily._allTransitiveDependencies,
          filters: filters,
          tag: tag,
          page: page,
        );

  TagNewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filters,
    required this.tag,
    required this.page,
  }) : super.internal();

  final String filters;
  final String tag;
  final int? page;

  @override
  Override overrideWith(
    FutureOr<NewsContainer> Function(TagNewsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TagNewsProvider._internal(
        (ref) => create(ref as TagNewsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filters: filters,
        tag: tag,
        page: page,
      ),
    );
  }

  @override
  FutureProviderElement<NewsContainer> createElement() {
    return _TagNewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TagNewsProvider &&
        other.filters == filters &&
        other.tag == tag &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filters.hashCode);
    hash = _SystemHash.combine(hash, tag.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TagNewsRef on FutureProviderRef<NewsContainer> {
  /// The parameter `filters` of this provider.
  String get filters;

  /// The parameter `tag` of this provider.
  String get tag;

  /// The parameter `page` of this provider.
  int? get page;
}

class _TagNewsProviderElement extends FutureProviderElement<NewsContainer>
    with TagNewsRef {
  _TagNewsProviderElement(super.provider);

  @override
  String get filters => (origin as TagNewsProvider).filters;
  @override
  String get tag => (origin as TagNewsProvider).tag;
  @override
  int? get page => (origin as TagNewsProvider).page;
}

String _$forumsHash() => r'f25d2eb0841b2b1951ec62052a84c6287eb1dd61';

/// See also [forums].
@ProviderFor(forums)
const forumsProvider = ForumsFamily();

/// See also [forums].
class ForumsFamily extends Family<AsyncValue<ForumContainer>> {
  /// See also [forums].
  const ForumsFamily();

  /// See also [forums].
  ForumsProvider call({
    bool? recent,
    int? id,
    bool? isSeries,
    int? page,
  }) {
    return ForumsProvider(
      recent: recent,
      id: id,
      isSeries: isSeries,
      page: page,
    );
  }

  @override
  ForumsProvider getProviderOverride(
    covariant ForumsProvider provider,
  ) {
    return call(
      recent: provider.recent,
      id: provider.id,
      isSeries: provider.isSeries,
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'forumsProvider';
}

/// See also [forums].
class ForumsProvider extends FutureProvider<ForumContainer> {
  /// See also [forums].
  ForumsProvider({
    bool? recent,
    int? id,
    bool? isSeries,
    int? page,
  }) : this._internal(
          (ref) => forums(
            ref as ForumsRef,
            recent: recent,
            id: id,
            isSeries: isSeries,
            page: page,
          ),
          from: forumsProvider,
          name: r'forumsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$forumsHash,
          dependencies: ForumsFamily._dependencies,
          allTransitiveDependencies: ForumsFamily._allTransitiveDependencies,
          recent: recent,
          id: id,
          isSeries: isSeries,
          page: page,
        );

  ForumsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recent,
    required this.id,
    required this.isSeries,
    required this.page,
  }) : super.internal();

  final bool? recent;
  final int? id;
  final bool? isSeries;
  final int? page;

  @override
  Override overrideWith(
    FutureOr<ForumContainer> Function(ForumsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ForumsProvider._internal(
        (ref) => create(ref as ForumsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recent: recent,
        id: id,
        isSeries: isSeries,
        page: page,
      ),
    );
  }

  @override
  FutureProviderElement<ForumContainer> createElement() {
    return _ForumsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ForumsProvider &&
        other.recent == recent &&
        other.id == id &&
        other.isSeries == isSeries &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recent.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, isSeries.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ForumsRef on FutureProviderRef<ForumContainer> {
  /// The parameter `recent` of this provider.
  bool? get recent;

  /// The parameter `id` of this provider.
  int? get id;

  /// The parameter `isSeries` of this provider.
  bool? get isSeries;

  /// The parameter `page` of this provider.
  int? get page;
}

class _ForumsProviderElement extends FutureProviderElement<ForumContainer>
    with ForumsRef {
  _ForumsProviderElement(super.provider);

  @override
  bool? get recent => (origin as ForumsProvider).recent;
  @override
  int? get id => (origin as ForumsProvider).id;
  @override
  bool? get isSeries => (origin as ForumsProvider).isSeries;
  @override
  int? get page => (origin as ForumsProvider).page;
}

String _$discussionHash() => r'86db0318ac27ffd31db370f668259d136520fe5d';

/// See also [discussion].
@ProviderFor(discussion)
const discussionProvider = DiscussionFamily();

/// See also [discussion].
class DiscussionFamily extends Family<AsyncValue<Discussion>> {
  /// See also [discussion].
  const DiscussionFamily();

  /// See also [discussion].
  DiscussionProvider call({
    required int id,
    int? page,
  }) {
    return DiscussionProvider(
      id: id,
      page: page,
    );
  }

  @override
  DiscussionProvider getProviderOverride(
    covariant DiscussionProvider provider,
  ) {
    return call(
      id: provider.id,
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'discussionProvider';
}

/// See also [discussion].
class DiscussionProvider extends FutureProvider<Discussion> {
  /// See also [discussion].
  DiscussionProvider({
    required int id,
    int? page,
  }) : this._internal(
          (ref) => discussion(
            ref as DiscussionRef,
            id: id,
            page: page,
          ),
          from: discussionProvider,
          name: r'discussionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$discussionHash,
          dependencies: DiscussionFamily._dependencies,
          allTransitiveDependencies:
              DiscussionFamily._allTransitiveDependencies,
          id: id,
          page: page,
        );

  DiscussionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.page,
  }) : super.internal();

  final int id;
  final int? page;

  @override
  Override overrideWith(
    FutureOr<Discussion> Function(DiscussionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DiscussionProvider._internal(
        (ref) => create(ref as DiscussionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        page: page,
      ),
    );
  }

  @override
  FutureProviderElement<Discussion> createElement() {
    return _DiscussionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DiscussionProvider && other.id == id && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DiscussionRef on FutureProviderRef<Discussion> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `page` of this provider.
  int? get page;
}

class _DiscussionProviderElement extends FutureProviderElement<Discussion>
    with DiscussionRef {
  _DiscussionProviderElement(super.provider);

  @override
  int get id => (origin as DiscussionProvider).id;
  @override
  int? get page => (origin as DiscussionProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
