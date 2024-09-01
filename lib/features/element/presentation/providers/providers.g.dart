// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$elementRepositoryHash() => r'96cb857d6dd24c96501e97649318e898e555a82c';

/// See also [elementRepository].
@ProviderFor(elementRepository)
final elementRepositoryProvider =
    AutoDisposeProvider<ElementRepository>.internal(
  elementRepository,
  name: r'elementRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$elementRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ElementRepositoryRef = AutoDisposeProviderRef<ElementRepository>;
String _$topElementHash() => r'5eedfc6c05dbedf0a1fd95b67f8d5de598adbbbb';

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

/// See also [topElement].
@ProviderFor(topElement)
const topElementProvider = TopElementFamily();

/// See also [topElement].
class TopElementFamily extends Family<AsyncValue<ElementCollection>> {
  /// See also [topElement].
  const TopElementFamily();

  /// See also [topElement].
  TopElementProvider call({
    required ElementType elementType,
    bool sfw = true,
    int? page,
    int? limit,
    String? type,
    String? rating,
    String? filter,
  }) {
    return TopElementProvider(
      elementType: elementType,
      sfw: sfw,
      page: page,
      limit: limit,
      type: type,
      rating: rating,
      filter: filter,
    );
  }

  @override
  TopElementProvider getProviderOverride(
    covariant TopElementProvider provider,
  ) {
    return call(
      elementType: provider.elementType,
      sfw: provider.sfw,
      page: provider.page,
      limit: provider.limit,
      type: provider.type,
      rating: provider.rating,
      filter: provider.filter,
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
  String? get name => r'topElementProvider';
}

/// See also [topElement].
class TopElementProvider extends FutureProvider<ElementCollection> {
  /// See also [topElement].
  TopElementProvider({
    required ElementType elementType,
    bool sfw = true,
    int? page,
    int? limit,
    String? type,
    String? rating,
    String? filter,
  }) : this._internal(
          (ref) => topElement(
            ref as TopElementRef,
            elementType: elementType,
            sfw: sfw,
            page: page,
            limit: limit,
            type: type,
            rating: rating,
            filter: filter,
          ),
          from: topElementProvider,
          name: r'topElementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$topElementHash,
          dependencies: TopElementFamily._dependencies,
          allTransitiveDependencies:
              TopElementFamily._allTransitiveDependencies,
          elementType: elementType,
          sfw: sfw,
          page: page,
          limit: limit,
          type: type,
          rating: rating,
          filter: filter,
        );

  TopElementProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.elementType,
    required this.sfw,
    required this.page,
    required this.limit,
    required this.type,
    required this.rating,
    required this.filter,
  }) : super.internal();

  final ElementType elementType;
  final bool sfw;
  final int? page;
  final int? limit;
  final String? type;
  final String? rating;
  final String? filter;

  @override
  Override overrideWith(
    FutureOr<ElementCollection> Function(TopElementRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TopElementProvider._internal(
        (ref) => create(ref as TopElementRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        elementType: elementType,
        sfw: sfw,
        page: page,
        limit: limit,
        type: type,
        rating: rating,
        filter: filter,
      ),
    );
  }

  @override
  FutureProviderElement<ElementCollection> createElement() {
    return _TopElementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopElementProvider &&
        other.elementType == elementType &&
        other.sfw == sfw &&
        other.page == page &&
        other.limit == limit &&
        other.type == type &&
        other.rating == rating &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);
    hash = _SystemHash.combine(hash, sfw.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, rating.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TopElementRef on FutureProviderRef<ElementCollection> {
  /// The parameter `elementType` of this provider.
  ElementType get elementType;

  /// The parameter `sfw` of this provider.
  bool get sfw;

  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `limit` of this provider.
  int? get limit;

  /// The parameter `type` of this provider.
  String? get type;

  /// The parameter `rating` of this provider.
  String? get rating;

  /// The parameter `filter` of this provider.
  String? get filter;
}

class _TopElementProviderElement
    extends FutureProviderElement<ElementCollection> with TopElementRef {
  _TopElementProviderElement(super.provider);

  @override
  ElementType get elementType => (origin as TopElementProvider).elementType;
  @override
  bool get sfw => (origin as TopElementProvider).sfw;
  @override
  int? get page => (origin as TopElementProvider).page;
  @override
  int? get limit => (origin as TopElementProvider).limit;
  @override
  String? get type => (origin as TopElementProvider).type;
  @override
  String? get rating => (origin as TopElementProvider).rating;
  @override
  String? get filter => (origin as TopElementProvider).filter;
}

String _$seasonAnimeHash() => r'84b6314dd9569e17cffcec9f3827f03f358df901';

/// See also [seasonAnime].
@ProviderFor(seasonAnime)
const seasonAnimeProvider = SeasonAnimeFamily();

/// See also [seasonAnime].
class SeasonAnimeFamily extends Family<AsyncValue<ElementCollection>> {
  /// See also [seasonAnime].
  const SeasonAnimeFamily();

  /// See also [seasonAnime].
  SeasonAnimeProvider call({
    int? page,
  }) {
    return SeasonAnimeProvider(
      page: page,
    );
  }

  @override
  SeasonAnimeProvider getProviderOverride(
    covariant SeasonAnimeProvider provider,
  ) {
    return call(
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
  String? get name => r'seasonAnimeProvider';
}

/// See also [seasonAnime].
class SeasonAnimeProvider extends AutoDisposeFutureProvider<ElementCollection> {
  /// See also [seasonAnime].
  SeasonAnimeProvider({
    int? page,
  }) : this._internal(
          (ref) => seasonAnime(
            ref as SeasonAnimeRef,
            page: page,
          ),
          from: seasonAnimeProvider,
          name: r'seasonAnimeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$seasonAnimeHash,
          dependencies: SeasonAnimeFamily._dependencies,
          allTransitiveDependencies:
              SeasonAnimeFamily._allTransitiveDependencies,
          page: page,
        );

  SeasonAnimeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int? page;

  @override
  Override overrideWith(
    FutureOr<ElementCollection> Function(SeasonAnimeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SeasonAnimeProvider._internal(
        (ref) => create(ref as SeasonAnimeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ElementCollection> createElement() {
    return _SeasonAnimeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SeasonAnimeProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SeasonAnimeRef on AutoDisposeFutureProviderRef<ElementCollection> {
  /// The parameter `page` of this provider.
  int? get page;
}

class _SeasonAnimeProviderElement
    extends AutoDisposeFutureProviderElement<ElementCollection>
    with SeasonAnimeRef {
  _SeasonAnimeProviderElement(super.provider);

  @override
  int? get page => (origin as SeasonAnimeProvider).page;
}

String _$mangaCollectionHash() => r'3bcc5d646ed983057f737efb046632bd0cfa9a00';

/// See also [mangaCollection].
@ProviderFor(mangaCollection)
const mangaCollectionProvider = MangaCollectionFamily();

/// See also [mangaCollection].
class MangaCollectionFamily extends Family<AsyncValue<ElementCollection>> {
  /// See also [mangaCollection].
  const MangaCollectionFamily();

  /// See also [mangaCollection].
  MangaCollectionProvider call({
    required String collection,
    String? ordering,
    int? page,
  }) {
    return MangaCollectionProvider(
      collection: collection,
      ordering: ordering,
      page: page,
    );
  }

  @override
  MangaCollectionProvider getProviderOverride(
    covariant MangaCollectionProvider provider,
  ) {
    return call(
      collection: provider.collection,
      ordering: provider.ordering,
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
  String? get name => r'mangaCollectionProvider';
}

/// See also [mangaCollection].
class MangaCollectionProvider
    extends AutoDisposeFutureProvider<ElementCollection> {
  /// See also [mangaCollection].
  MangaCollectionProvider({
    required String collection,
    String? ordering,
    int? page,
  }) : this._internal(
          (ref) => mangaCollection(
            ref as MangaCollectionRef,
            collection: collection,
            ordering: ordering,
            page: page,
          ),
          from: mangaCollectionProvider,
          name: r'mangaCollectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mangaCollectionHash,
          dependencies: MangaCollectionFamily._dependencies,
          allTransitiveDependencies:
              MangaCollectionFamily._allTransitiveDependencies,
          collection: collection,
          ordering: ordering,
          page: page,
        );

  MangaCollectionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collection,
    required this.ordering,
    required this.page,
  }) : super.internal();

  final String collection;
  final String? ordering;
  final int? page;

  @override
  Override overrideWith(
    FutureOr<ElementCollection> Function(MangaCollectionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MangaCollectionProvider._internal(
        (ref) => create(ref as MangaCollectionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collection: collection,
        ordering: ordering,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ElementCollection> createElement() {
    return _MangaCollectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MangaCollectionProvider &&
        other.collection == collection &&
        other.ordering == ordering &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collection.hashCode);
    hash = _SystemHash.combine(hash, ordering.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MangaCollectionRef on AutoDisposeFutureProviderRef<ElementCollection> {
  /// The parameter `collection` of this provider.
  String get collection;

  /// The parameter `ordering` of this provider.
  String? get ordering;

  /// The parameter `page` of this provider.
  int? get page;
}

class _MangaCollectionProviderElement
    extends AutoDisposeFutureProviderElement<ElementCollection>
    with MangaCollectionRef {
  _MangaCollectionProviderElement(super.provider);

  @override
  String get collection => (origin as MangaCollectionProvider).collection;
  @override
  String? get ordering => (origin as MangaCollectionProvider).ordering;
  @override
  int? get page => (origin as MangaCollectionProvider).page;
}

String _$genreElementHash() => r'3b442d560060f0b83750ebbc56b559934142f5fb';

/// See also [genreElement].
@ProviderFor(genreElement)
const genreElementProvider = GenreElementFamily();

/// See also [genreElement].
class GenreElementFamily extends Family<AsyncValue<ElementCollection>> {
  /// See also [genreElement].
  const GenreElementFamily();

  /// See also [genreElement].
  GenreElementProvider call({
    required String genre,
    required ElementType elementType,
    String? ordering,
    int? page,
  }) {
    return GenreElementProvider(
      genre: genre,
      elementType: elementType,
      ordering: ordering,
      page: page,
    );
  }

  @override
  GenreElementProvider getProviderOverride(
    covariant GenreElementProvider provider,
  ) {
    return call(
      genre: provider.genre,
      elementType: provider.elementType,
      ordering: provider.ordering,
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
  String? get name => r'genreElementProvider';
}

/// See also [genreElement].
class GenreElementProvider
    extends AutoDisposeFutureProvider<ElementCollection> {
  /// See also [genreElement].
  GenreElementProvider({
    required String genre,
    required ElementType elementType,
    String? ordering,
    int? page,
  }) : this._internal(
          (ref) => genreElement(
            ref as GenreElementRef,
            genre: genre,
            elementType: elementType,
            ordering: ordering,
            page: page,
          ),
          from: genreElementProvider,
          name: r'genreElementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$genreElementHash,
          dependencies: GenreElementFamily._dependencies,
          allTransitiveDependencies:
              GenreElementFamily._allTransitiveDependencies,
          genre: genre,
          elementType: elementType,
          ordering: ordering,
          page: page,
        );

  GenreElementProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.genre,
    required this.elementType,
    required this.ordering,
    required this.page,
  }) : super.internal();

  final String genre;
  final ElementType elementType;
  final String? ordering;
  final int? page;

  @override
  Override overrideWith(
    FutureOr<ElementCollection> Function(GenreElementRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenreElementProvider._internal(
        (ref) => create(ref as GenreElementRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        genre: genre,
        elementType: elementType,
        ordering: ordering,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ElementCollection> createElement() {
    return _GenreElementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenreElementProvider &&
        other.genre == genre &&
        other.elementType == elementType &&
        other.ordering == ordering &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, genre.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);
    hash = _SystemHash.combine(hash, ordering.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GenreElementRef on AutoDisposeFutureProviderRef<ElementCollection> {
  /// The parameter `genre` of this provider.
  String get genre;

  /// The parameter `elementType` of this provider.
  ElementType get elementType;

  /// The parameter `ordering` of this provider.
  String? get ordering;

  /// The parameter `page` of this provider.
  int? get page;
}

class _GenreElementProviderElement
    extends AutoDisposeFutureProviderElement<ElementCollection>
    with GenreElementRef {
  _GenreElementProviderElement(super.provider);

  @override
  String get genre => (origin as GenreElementProvider).genre;
  @override
  ElementType get elementType => (origin as GenreElementProvider).elementType;
  @override
  String? get ordering => (origin as GenreElementProvider).ordering;
  @override
  int? get page => (origin as GenreElementProvider).page;
}

String _$elementHash() => r'89fd5b0f272b8077a57cd642ef64595929e17b5c';

/// See also [element].
@ProviderFor(element)
const elementProvider = ElementFamily();

/// See also [element].
class ElementFamily extends Family<AsyncValue<Element>> {
  /// See also [element].
  const ElementFamily();

  /// See also [element].
  ElementProvider call({
    required int id,
    required ElementType elementType,
  }) {
    return ElementProvider(
      id: id,
      elementType: elementType,
    );
  }

  @override
  ElementProvider getProviderOverride(
    covariant ElementProvider provider,
  ) {
    return call(
      id: provider.id,
      elementType: provider.elementType,
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
  String? get name => r'elementProvider';
}

/// See also [element].
class ElementProvider extends FutureProvider<Element> {
  /// See also [element].
  ElementProvider({
    required int id,
    required ElementType elementType,
  }) : this._internal(
          (ref) => element(
            ref as ElementRef,
            id: id,
            elementType: elementType,
          ),
          from: elementProvider,
          name: r'elementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$elementHash,
          dependencies: ElementFamily._dependencies,
          allTransitiveDependencies: ElementFamily._allTransitiveDependencies,
          id: id,
          elementType: elementType,
        );

  ElementProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.elementType,
  }) : super.internal();

  final int id;
  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<Element> Function(ElementRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ElementProvider._internal(
        (ref) => create(ref as ElementRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<Element> createElement() {
    return _ElementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ElementProvider &&
        other.id == id &&
        other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ElementRef on FutureProviderRef<Element> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _ElementProviderElement extends FutureProviderElement<Element>
    with ElementRef {
  _ElementProviderElement(super.provider);

  @override
  int get id => (origin as ElementProvider).id;
  @override
  ElementType get elementType => (origin as ElementProvider).elementType;
}

String _$fullElementHash() => r'b29c6b48b10fb66b62b3bca3410ce39f18702c2a';

/// See also [fullElement].
@ProviderFor(fullElement)
const fullElementProvider = FullElementFamily();

/// See also [fullElement].
class FullElementFamily extends Family<AsyncValue<Element>> {
  /// See also [fullElement].
  const FullElementFamily();

  /// See also [fullElement].
  FullElementProvider call({
    required int id,
    required ElementType elementType,
  }) {
    return FullElementProvider(
      id: id,
      elementType: elementType,
    );
  }

  @override
  FullElementProvider getProviderOverride(
    covariant FullElementProvider provider,
  ) {
    return call(
      id: provider.id,
      elementType: provider.elementType,
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
  String? get name => r'fullElementProvider';
}

/// See also [fullElement].
class FullElementProvider extends FutureProvider<Element> {
  /// See also [fullElement].
  FullElementProvider({
    required int id,
    required ElementType elementType,
  }) : this._internal(
          (ref) => fullElement(
            ref as FullElementRef,
            id: id,
            elementType: elementType,
          ),
          from: fullElementProvider,
          name: r'fullElementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fullElementHash,
          dependencies: FullElementFamily._dependencies,
          allTransitiveDependencies:
              FullElementFamily._allTransitiveDependencies,
          id: id,
          elementType: elementType,
        );

  FullElementProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.elementType,
  }) : super.internal();

  final int id;
  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<Element> Function(FullElementRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FullElementProvider._internal(
        (ref) => create(ref as FullElementRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<Element> createElement() {
    return _FullElementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FullElementProvider &&
        other.id == id &&
        other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FullElementRef on FutureProviderRef<Element> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _FullElementProviderElement extends FutureProviderElement<Element>
    with FullElementRef {
  _FullElementProviderElement(super.provider);

  @override
  int get id => (origin as FullElementProvider).id;
  @override
  ElementType get elementType => (origin as FullElementProvider).elementType;
}

String _$randomElementHash() => r'61dcea257522e5c464d33607cbbb5620dfe70746';

/// See also [randomElement].
@ProviderFor(randomElement)
const randomElementProvider = RandomElementFamily();

/// See also [randomElement].
class RandomElementFamily extends Family<AsyncValue<Element>> {
  /// See also [randomElement].
  const RandomElementFamily();

  /// See also [randomElement].
  RandomElementProvider call({
    required ElementType elementType,
  }) {
    return RandomElementProvider(
      elementType: elementType,
    );
  }

  @override
  RandomElementProvider getProviderOverride(
    covariant RandomElementProvider provider,
  ) {
    return call(
      elementType: provider.elementType,
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
  String? get name => r'randomElementProvider';
}

/// See also [randomElement].
class RandomElementProvider extends FutureProvider<Element> {
  /// See also [randomElement].
  RandomElementProvider({
    required ElementType elementType,
  }) : this._internal(
          (ref) => randomElement(
            ref as RandomElementRef,
            elementType: elementType,
          ),
          from: randomElementProvider,
          name: r'randomElementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$randomElementHash,
          dependencies: RandomElementFamily._dependencies,
          allTransitiveDependencies:
              RandomElementFamily._allTransitiveDependencies,
          elementType: elementType,
        );

  RandomElementProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.elementType,
  }) : super.internal();

  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<Element> Function(RandomElementRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RandomElementProvider._internal(
        (ref) => create(ref as RandomElementRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<Element> createElement() {
    return _RandomElementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RandomElementProvider && other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RandomElementRef on FutureProviderRef<Element> {
  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _RandomElementProviderElement extends FutureProviderElement<Element>
    with RandomElementRef {
  _RandomElementProviderElement(super.provider);

  @override
  ElementType get elementType => (origin as RandomElementProvider).elementType;
}

String _$elementSearchHash() => r'f8947f5a242952c49162e7d4ccb668266e5f616f';

/// See also [elementSearch].
@ProviderFor(elementSearch)
const elementSearchProvider = ElementSearchFamily();

/// See also [elementSearch].
class ElementSearchFamily extends Family<AsyncValue<ElementCollection>> {
  /// See also [elementSearch].
  const ElementSearchFamily();

  /// See also [elementSearch].
  ElementSearchProvider call({
    required ElementType elementType,
    required String q,
    bool sfw = true,
    String? status,
    bool? unapproved,
    int? page,
    int? limit,
    String? type,
    double? score,
    String? ordering,
    String? rating,
    String? genres,
  }) {
    return ElementSearchProvider(
      elementType: elementType,
      q: q,
      sfw: sfw,
      status: status,
      unapproved: unapproved,
      page: page,
      limit: limit,
      type: type,
      score: score,
      ordering: ordering,
      rating: rating,
      genres: genres,
    );
  }

  @override
  ElementSearchProvider getProviderOverride(
    covariant ElementSearchProvider provider,
  ) {
    return call(
      elementType: provider.elementType,
      q: provider.q,
      sfw: provider.sfw,
      status: provider.status,
      unapproved: provider.unapproved,
      page: provider.page,
      limit: provider.limit,
      type: provider.type,
      score: provider.score,
      ordering: provider.ordering,
      rating: provider.rating,
      genres: provider.genres,
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
  String? get name => r'elementSearchProvider';
}

/// See also [elementSearch].
class ElementSearchProvider
    extends AutoDisposeFutureProvider<ElementCollection> {
  /// See also [elementSearch].
  ElementSearchProvider({
    required ElementType elementType,
    required String q,
    bool sfw = true,
    String? status,
    bool? unapproved,
    int? page,
    int? limit,
    String? type,
    double? score,
    String? ordering,
    String? rating,
    String? genres,
  }) : this._internal(
          (ref) => elementSearch(
            ref as ElementSearchRef,
            elementType: elementType,
            q: q,
            sfw: sfw,
            status: status,
            unapproved: unapproved,
            page: page,
            limit: limit,
            type: type,
            score: score,
            ordering: ordering,
            rating: rating,
            genres: genres,
          ),
          from: elementSearchProvider,
          name: r'elementSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$elementSearchHash,
          dependencies: ElementSearchFamily._dependencies,
          allTransitiveDependencies:
              ElementSearchFamily._allTransitiveDependencies,
          elementType: elementType,
          q: q,
          sfw: sfw,
          status: status,
          unapproved: unapproved,
          page: page,
          limit: limit,
          type: type,
          score: score,
          ordering: ordering,
          rating: rating,
          genres: genres,
        );

  ElementSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.elementType,
    required this.q,
    required this.sfw,
    required this.status,
    required this.unapproved,
    required this.page,
    required this.limit,
    required this.type,
    required this.score,
    required this.ordering,
    required this.rating,
    required this.genres,
  }) : super.internal();

  final ElementType elementType;
  final String q;
  final bool sfw;
  final String? status;
  final bool? unapproved;
  final int? page;
  final int? limit;
  final String? type;
  final double? score;
  final String? ordering;
  final String? rating;
  final String? genres;

  @override
  Override overrideWith(
    FutureOr<ElementCollection> Function(ElementSearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ElementSearchProvider._internal(
        (ref) => create(ref as ElementSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        elementType: elementType,
        q: q,
        sfw: sfw,
        status: status,
        unapproved: unapproved,
        page: page,
        limit: limit,
        type: type,
        score: score,
        ordering: ordering,
        rating: rating,
        genres: genres,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ElementCollection> createElement() {
    return _ElementSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ElementSearchProvider &&
        other.elementType == elementType &&
        other.q == q &&
        other.sfw == sfw &&
        other.status == status &&
        other.unapproved == unapproved &&
        other.page == page &&
        other.limit == limit &&
        other.type == type &&
        other.score == score &&
        other.ordering == ordering &&
        other.rating == rating &&
        other.genres == genres;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);
    hash = _SystemHash.combine(hash, q.hashCode);
    hash = _SystemHash.combine(hash, sfw.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);
    hash = _SystemHash.combine(hash, unapproved.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, score.hashCode);
    hash = _SystemHash.combine(hash, ordering.hashCode);
    hash = _SystemHash.combine(hash, rating.hashCode);
    hash = _SystemHash.combine(hash, genres.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ElementSearchRef on AutoDisposeFutureProviderRef<ElementCollection> {
  /// The parameter `elementType` of this provider.
  ElementType get elementType;

  /// The parameter `q` of this provider.
  String get q;

  /// The parameter `sfw` of this provider.
  bool get sfw;

  /// The parameter `status` of this provider.
  String? get status;

  /// The parameter `unapproved` of this provider.
  bool? get unapproved;

  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `limit` of this provider.
  int? get limit;

  /// The parameter `type` of this provider.
  String? get type;

  /// The parameter `score` of this provider.
  double? get score;

  /// The parameter `ordering` of this provider.
  String? get ordering;

  /// The parameter `rating` of this provider.
  String? get rating;

  /// The parameter `genres` of this provider.
  String? get genres;
}

class _ElementSearchProviderElement
    extends AutoDisposeFutureProviderElement<ElementCollection>
    with ElementSearchRef {
  _ElementSearchProviderElement(super.provider);

  @override
  ElementType get elementType => (origin as ElementSearchProvider).elementType;
  @override
  String get q => (origin as ElementSearchProvider).q;
  @override
  bool get sfw => (origin as ElementSearchProvider).sfw;
  @override
  String? get status => (origin as ElementSearchProvider).status;
  @override
  bool? get unapproved => (origin as ElementSearchProvider).unapproved;
  @override
  int? get page => (origin as ElementSearchProvider).page;
  @override
  int? get limit => (origin as ElementSearchProvider).limit;
  @override
  String? get type => (origin as ElementSearchProvider).type;
  @override
  double? get score => (origin as ElementSearchProvider).score;
  @override
  String? get ordering => (origin as ElementSearchProvider).ordering;
  @override
  String? get rating => (origin as ElementSearchProvider).rating;
  @override
  String? get genres => (origin as ElementSearchProvider).genres;
}

String _$recentEpisodesHash() => r'0e245b72f2bac6d99a047086ab123733679685e3';

/// See also [recentEpisodes].
@ProviderFor(recentEpisodes)
final recentEpisodesProvider =
    AutoDisposeFutureProvider<List<Episode>>.internal(
  recentEpisodes,
  name: r'recentEpisodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recentEpisodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RecentEpisodesRef = AutoDisposeFutureProviderRef<List<Episode>>;
String _$elementGenresHash() => r'4e44e607abffa1659d6ddb96dcdfb2aec26fe00e';

/// See also [elementGenres].
@ProviderFor(elementGenres)
const elementGenresProvider = ElementGenresFamily();

/// See also [elementGenres].
class ElementGenresFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [elementGenres].
  const ElementGenresFamily();

  /// See also [elementGenres].
  ElementGenresProvider call({
    required ElementType elementType,
  }) {
    return ElementGenresProvider(
      elementType: elementType,
    );
  }

  @override
  ElementGenresProvider getProviderOverride(
    covariant ElementGenresProvider provider,
  ) {
    return call(
      elementType: provider.elementType,
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
  String? get name => r'elementGenresProvider';
}

/// See also [elementGenres].
class ElementGenresProvider extends FutureProvider<List<dynamic>> {
  /// See also [elementGenres].
  ElementGenresProvider({
    required ElementType elementType,
  }) : this._internal(
          (ref) => elementGenres(
            ref as ElementGenresRef,
            elementType: elementType,
          ),
          from: elementGenresProvider,
          name: r'elementGenresProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$elementGenresHash,
          dependencies: ElementGenresFamily._dependencies,
          allTransitiveDependencies:
              ElementGenresFamily._allTransitiveDependencies,
          elementType: elementType,
        );

  ElementGenresProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.elementType,
  }) : super.internal();

  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(ElementGenresRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ElementGenresProvider._internal(
        (ref) => create(ref as ElementGenresRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<List<dynamic>> createElement() {
    return _ElementGenresProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ElementGenresProvider && other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ElementGenresRef on FutureProviderRef<List<dynamic>> {
  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _ElementGenresProviderElement extends FutureProviderElement<List<dynamic>>
    with ElementGenresRef {
  _ElementGenresProviderElement(super.provider);

  @override
  ElementType get elementType => (origin as ElementGenresProvider).elementType;
}

String _$elementPicturesHash() => r'7434ae321f9ea94c8422368a8cdf402df6d212e8';

/// See also [elementPictures].
@ProviderFor(elementPictures)
const elementPicturesProvider = ElementPicturesFamily();

/// See also [elementPictures].
class ElementPicturesFamily extends Family<AsyncValue<List<Image>>> {
  /// See also [elementPictures].
  const ElementPicturesFamily();

  /// See also [elementPictures].
  ElementPicturesProvider call({
    required int id,
    required ElementType elementType,
  }) {
    return ElementPicturesProvider(
      id: id,
      elementType: elementType,
    );
  }

  @override
  ElementPicturesProvider getProviderOverride(
    covariant ElementPicturesProvider provider,
  ) {
    return call(
      id: provider.id,
      elementType: provider.elementType,
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
  String? get name => r'elementPicturesProvider';
}

/// See also [elementPictures].
class ElementPicturesProvider extends FutureProvider<List<Image>> {
  /// See also [elementPictures].
  ElementPicturesProvider({
    required int id,
    required ElementType elementType,
  }) : this._internal(
          (ref) => elementPictures(
            ref as ElementPicturesRef,
            id: id,
            elementType: elementType,
          ),
          from: elementPicturesProvider,
          name: r'elementPicturesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$elementPicturesHash,
          dependencies: ElementPicturesFamily._dependencies,
          allTransitiveDependencies:
              ElementPicturesFamily._allTransitiveDependencies,
          id: id,
          elementType: elementType,
        );

  ElementPicturesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.elementType,
  }) : super.internal();

  final int id;
  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<List<Image>> Function(ElementPicturesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ElementPicturesProvider._internal(
        (ref) => create(ref as ElementPicturesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<List<Image>> createElement() {
    return _ElementPicturesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ElementPicturesProvider &&
        other.id == id &&
        other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ElementPicturesRef on FutureProviderRef<List<Image>> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _ElementPicturesProviderElement extends FutureProviderElement<List<Image>>
    with ElementPicturesRef {
  _ElementPicturesProviderElement(super.provider);

  @override
  int get id => (origin as ElementPicturesProvider).id;
  @override
  ElementType get elementType =>
      (origin as ElementPicturesProvider).elementType;
}

String _$animeVideosHash() => r'805c7f22f8ed313764472006c60b207df241422b';

/// See also [animeVideos].
@ProviderFor(animeVideos)
const animeVideosProvider = AnimeVideosFamily();

/// See also [animeVideos].
class AnimeVideosFamily extends Family<AsyncValue<Map<String, List<Video>>>> {
  /// See also [animeVideos].
  const AnimeVideosFamily();

  /// See also [animeVideos].
  AnimeVideosProvider call({
    required int id,
  }) {
    return AnimeVideosProvider(
      id: id,
    );
  }

  @override
  AnimeVideosProvider getProviderOverride(
    covariant AnimeVideosProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'animeVideosProvider';
}

/// See also [animeVideos].
class AnimeVideosProvider extends FutureProvider<Map<String, List<Video>>> {
  /// See also [animeVideos].
  AnimeVideosProvider({
    required int id,
  }) : this._internal(
          (ref) => animeVideos(
            ref as AnimeVideosRef,
            id: id,
          ),
          from: animeVideosProvider,
          name: r'animeVideosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$animeVideosHash,
          dependencies: AnimeVideosFamily._dependencies,
          allTransitiveDependencies:
              AnimeVideosFamily._allTransitiveDependencies,
          id: id,
        );

  AnimeVideosProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Map<String, List<Video>>> Function(AnimeVideosRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnimeVideosProvider._internal(
        (ref) => create(ref as AnimeVideosRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<Map<String, List<Video>>> createElement() {
    return _AnimeVideosProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnimeVideosProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AnimeVideosRef on FutureProviderRef<Map<String, List<Video>>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _AnimeVideosProviderElement
    extends FutureProviderElement<Map<String, List<Video>>>
    with AnimeVideosRef {
  _AnimeVideosProviderElement(super.provider);

  @override
  int get id => (origin as AnimeVideosProvider).id;
}

String _$elementCharactersHash() => r'f264c528f154371d588358c5174e2dbe556d4212';

/// See also [elementCharacters].
@ProviderFor(elementCharacters)
const elementCharactersProvider = ElementCharactersFamily();

/// See also [elementCharacters].
class ElementCharactersFamily
    extends Family<AsyncValue<List<Map<String, dynamic>>>> {
  /// See also [elementCharacters].
  const ElementCharactersFamily();

  /// See also [elementCharacters].
  ElementCharactersProvider call({
    required int id,
    required ElementType elementType,
  }) {
    return ElementCharactersProvider(
      id: id,
      elementType: elementType,
    );
  }

  @override
  ElementCharactersProvider getProviderOverride(
    covariant ElementCharactersProvider provider,
  ) {
    return call(
      id: provider.id,
      elementType: provider.elementType,
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
  String? get name => r'elementCharactersProvider';
}

/// See also [elementCharacters].
class ElementCharactersProvider
    extends FutureProvider<List<Map<String, dynamic>>> {
  /// See also [elementCharacters].
  ElementCharactersProvider({
    required int id,
    required ElementType elementType,
  }) : this._internal(
          (ref) => elementCharacters(
            ref as ElementCharactersRef,
            id: id,
            elementType: elementType,
          ),
          from: elementCharactersProvider,
          name: r'elementCharactersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$elementCharactersHash,
          dependencies: ElementCharactersFamily._dependencies,
          allTransitiveDependencies:
              ElementCharactersFamily._allTransitiveDependencies,
          id: id,
          elementType: elementType,
        );

  ElementCharactersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.elementType,
  }) : super.internal();

  final int id;
  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<List<Map<String, dynamic>>> Function(ElementCharactersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ElementCharactersProvider._internal(
        (ref) => create(ref as ElementCharactersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<List<Map<String, dynamic>>> createElement() {
    return _ElementCharactersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ElementCharactersProvider &&
        other.id == id &&
        other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ElementCharactersRef on FutureProviderRef<List<Map<String, dynamic>>> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _ElementCharactersProviderElement
    extends FutureProviderElement<List<Map<String, dynamic>>>
    with ElementCharactersRef {
  _ElementCharactersProviderElement(super.provider);

  @override
  int get id => (origin as ElementCharactersProvider).id;
  @override
  ElementType get elementType =>
      (origin as ElementCharactersProvider).elementType;
}

String _$elementReviewsHash() => r'7f84f887cbb24b0d2eb45e7191e1ade384a7a7ee';

/// See also [elementReviews].
@ProviderFor(elementReviews)
const elementReviewsProvider = ElementReviewsFamily();

/// See also [elementReviews].
class ElementReviewsFamily extends Family<AsyncValue<List<Review>>> {
  /// See also [elementReviews].
  const ElementReviewsFamily();

  /// See also [elementReviews].
  ElementReviewsProvider call({
    required int id,
    required ElementType elementType,
  }) {
    return ElementReviewsProvider(
      id: id,
      elementType: elementType,
    );
  }

  @override
  ElementReviewsProvider getProviderOverride(
    covariant ElementReviewsProvider provider,
  ) {
    return call(
      id: provider.id,
      elementType: provider.elementType,
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
  String? get name => r'elementReviewsProvider';
}

/// See also [elementReviews].
class ElementReviewsProvider extends FutureProvider<List<Review>> {
  /// See also [elementReviews].
  ElementReviewsProvider({
    required int id,
    required ElementType elementType,
  }) : this._internal(
          (ref) => elementReviews(
            ref as ElementReviewsRef,
            id: id,
            elementType: elementType,
          ),
          from: elementReviewsProvider,
          name: r'elementReviewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$elementReviewsHash,
          dependencies: ElementReviewsFamily._dependencies,
          allTransitiveDependencies:
              ElementReviewsFamily._allTransitiveDependencies,
          id: id,
          elementType: elementType,
        );

  ElementReviewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.elementType,
  }) : super.internal();

  final int id;
  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<List<Review>> Function(ElementReviewsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ElementReviewsProvider._internal(
        (ref) => create(ref as ElementReviewsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<List<Review>> createElement() {
    return _ElementReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ElementReviewsProvider &&
        other.id == id &&
        other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ElementReviewsRef on FutureProviderRef<List<Review>> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _ElementReviewsProviderElement extends FutureProviderElement<List<Review>>
    with ElementReviewsRef {
  _ElementReviewsProviderElement(super.provider);

  @override
  int get id => (origin as ElementReviewsProvider).id;
  @override
  ElementType get elementType => (origin as ElementReviewsProvider).elementType;
}

String _$elementRecommendationsHash() =>
    r'7d7c073c7be874d79402836d0017a64dd52223fc';

/// See also [elementRecommendations].
@ProviderFor(elementRecommendations)
const elementRecommendationsProvider = ElementRecommendationsFamily();

/// See also [elementRecommendations].
class ElementRecommendationsFamily
    extends Family<AsyncValue<List<Map<dynamic, dynamic>>>> {
  /// See also [elementRecommendations].
  const ElementRecommendationsFamily();

  /// See also [elementRecommendations].
  ElementRecommendationsProvider call({
    required int id,
    required ElementType elementType,
  }) {
    return ElementRecommendationsProvider(
      id: id,
      elementType: elementType,
    );
  }

  @override
  ElementRecommendationsProvider getProviderOverride(
    covariant ElementRecommendationsProvider provider,
  ) {
    return call(
      id: provider.id,
      elementType: provider.elementType,
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
  String? get name => r'elementRecommendationsProvider';
}

/// See also [elementRecommendations].
class ElementRecommendationsProvider
    extends FutureProvider<List<Map<dynamic, dynamic>>> {
  /// See also [elementRecommendations].
  ElementRecommendationsProvider({
    required int id,
    required ElementType elementType,
  }) : this._internal(
          (ref) => elementRecommendations(
            ref as ElementRecommendationsRef,
            id: id,
            elementType: elementType,
          ),
          from: elementRecommendationsProvider,
          name: r'elementRecommendationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$elementRecommendationsHash,
          dependencies: ElementRecommendationsFamily._dependencies,
          allTransitiveDependencies:
              ElementRecommendationsFamily._allTransitiveDependencies,
          id: id,
          elementType: elementType,
        );

  ElementRecommendationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.elementType,
  }) : super.internal();

  final int id;
  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<List<Map<dynamic, dynamic>>> Function(
            ElementRecommendationsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ElementRecommendationsProvider._internal(
        (ref) => create(ref as ElementRecommendationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<List<Map<dynamic, dynamic>>> createElement() {
    return _ElementRecommendationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ElementRecommendationsProvider &&
        other.id == id &&
        other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ElementRecommendationsRef
    on FutureProviderRef<List<Map<dynamic, dynamic>>> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _ElementRecommendationsProviderElement
    extends FutureProviderElement<List<Map<dynamic, dynamic>>>
    with ElementRecommendationsRef {
  _ElementRecommendationsProviderElement(super.provider);

  @override
  int get id => (origin as ElementRecommendationsProvider).id;
  @override
  ElementType get elementType =>
      (origin as ElementRecommendationsProvider).elementType;
}

String _$elementRelationsHash() => r'5221c660edffe5c9a9cf8dcfc0a57ce985f6156f';

/// See also [elementRelations].
@ProviderFor(elementRelations)
const elementRelationsProvider = ElementRelationsFamily();

/// See also [elementRelations].
class ElementRelationsFamily
    extends Family<AsyncValue<List<Map<dynamic, dynamic>>>> {
  /// See also [elementRelations].
  const ElementRelationsFamily();

  /// See also [elementRelations].
  ElementRelationsProvider call({
    required int id,
    required ElementType elementType,
  }) {
    return ElementRelationsProvider(
      id: id,
      elementType: elementType,
    );
  }

  @override
  ElementRelationsProvider getProviderOverride(
    covariant ElementRelationsProvider provider,
  ) {
    return call(
      id: provider.id,
      elementType: provider.elementType,
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
  String? get name => r'elementRelationsProvider';
}

/// See also [elementRelations].
class ElementRelationsProvider
    extends FutureProvider<List<Map<dynamic, dynamic>>> {
  /// See also [elementRelations].
  ElementRelationsProvider({
    required int id,
    required ElementType elementType,
  }) : this._internal(
          (ref) => elementRelations(
            ref as ElementRelationsRef,
            id: id,
            elementType: elementType,
          ),
          from: elementRelationsProvider,
          name: r'elementRelationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$elementRelationsHash,
          dependencies: ElementRelationsFamily._dependencies,
          allTransitiveDependencies:
              ElementRelationsFamily._allTransitiveDependencies,
          id: id,
          elementType: elementType,
        );

  ElementRelationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.elementType,
  }) : super.internal();

  final int id;
  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<List<Map<dynamic, dynamic>>> Function(ElementRelationsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ElementRelationsProvider._internal(
        (ref) => create(ref as ElementRelationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<List<Map<dynamic, dynamic>>> createElement() {
    return _ElementRelationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ElementRelationsProvider &&
        other.id == id &&
        other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ElementRelationsRef on FutureProviderRef<List<Map<dynamic, dynamic>>> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _ElementRelationsProviderElement
    extends FutureProviderElement<List<Map<dynamic, dynamic>>>
    with ElementRelationsRef {
  _ElementRelationsProviderElement(super.provider);

  @override
  int get id => (origin as ElementRelationsProvider).id;
  @override
  ElementType get elementType =>
      (origin as ElementRelationsProvider).elementType;
}

String _$elementNewsHash() => r'32a9248940f1ae25ff9d14d01b027b314f1bcbff';

/// See also [elementNews].
@ProviderFor(elementNews)
const elementNewsProvider = ElementNewsFamily();

/// See also [elementNews].
class ElementNewsFamily extends Family<AsyncValue<List<News>>> {
  /// See also [elementNews].
  const ElementNewsFamily();

  /// See also [elementNews].
  ElementNewsProvider call({
    required int id,
    required ElementType elementType,
  }) {
    return ElementNewsProvider(
      id: id,
      elementType: elementType,
    );
  }

  @override
  ElementNewsProvider getProviderOverride(
    covariant ElementNewsProvider provider,
  ) {
    return call(
      id: provider.id,
      elementType: provider.elementType,
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
  String? get name => r'elementNewsProvider';
}

/// See also [elementNews].
class ElementNewsProvider extends FutureProvider<List<News>> {
  /// See also [elementNews].
  ElementNewsProvider({
    required int id,
    required ElementType elementType,
  }) : this._internal(
          (ref) => elementNews(
            ref as ElementNewsRef,
            id: id,
            elementType: elementType,
          ),
          from: elementNewsProvider,
          name: r'elementNewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$elementNewsHash,
          dependencies: ElementNewsFamily._dependencies,
          allTransitiveDependencies:
              ElementNewsFamily._allTransitiveDependencies,
          id: id,
          elementType: elementType,
        );

  ElementNewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.elementType,
  }) : super.internal();

  final int id;
  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<List<News>> Function(ElementNewsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ElementNewsProvider._internal(
        (ref) => create(ref as ElementNewsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<List<News>> createElement() {
    return _ElementNewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ElementNewsProvider &&
        other.id == id &&
        other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ElementNewsRef on FutureProviderRef<List<News>> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _ElementNewsProviderElement extends FutureProviderElement<List<News>>
    with ElementNewsRef {
  _ElementNewsProviderElement(super.provider);

  @override
  int get id => (origin as ElementNewsProvider).id;
  @override
  ElementType get elementType => (origin as ElementNewsProvider).elementType;
}

String _$elementForumHash() => r'df6e6100e6a15e64381136429d9b06cd4fb1eaca';

/// See also [elementForum].
@ProviderFor(elementForum)
const elementForumProvider = ElementForumFamily();

/// See also [elementForum].
class ElementForumFamily extends Family<AsyncValue<List<Forum>>> {
  /// See also [elementForum].
  const ElementForumFamily();

  /// See also [elementForum].
  ElementForumProvider call({
    required int id,
    required ElementType elementType,
  }) {
    return ElementForumProvider(
      id: id,
      elementType: elementType,
    );
  }

  @override
  ElementForumProvider getProviderOverride(
    covariant ElementForumProvider provider,
  ) {
    return call(
      id: provider.id,
      elementType: provider.elementType,
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
  String? get name => r'elementForumProvider';
}

/// See also [elementForum].
class ElementForumProvider extends FutureProvider<List<Forum>> {
  /// See also [elementForum].
  ElementForumProvider({
    required int id,
    required ElementType elementType,
  }) : this._internal(
          (ref) => elementForum(
            ref as ElementForumRef,
            id: id,
            elementType: elementType,
          ),
          from: elementForumProvider,
          name: r'elementForumProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$elementForumHash,
          dependencies: ElementForumFamily._dependencies,
          allTransitiveDependencies:
              ElementForumFamily._allTransitiveDependencies,
          id: id,
          elementType: elementType,
        );

  ElementForumProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.elementType,
  }) : super.internal();

  final int id;
  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<List<Forum>> Function(ElementForumRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ElementForumProvider._internal(
        (ref) => create(ref as ElementForumRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<List<Forum>> createElement() {
    return _ElementForumProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ElementForumProvider &&
        other.id == id &&
        other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ElementForumRef on FutureProviderRef<List<Forum>> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _ElementForumProviderElement extends FutureProviderElement<List<Forum>>
    with ElementForumRef {
  _ElementForumProviderElement(super.provider);

  @override
  int get id => (origin as ElementForumProvider).id;
  @override
  ElementType get elementType => (origin as ElementForumProvider).elementType;
}

String _$recentRecommendationsHash() =>
    r'186f4522c88ad1cae0ba0604de27132ec2c46bcd';

/// See also [recentRecommendations].
@ProviderFor(recentRecommendations)
const recentRecommendationsProvider = RecentRecommendationsFamily();

/// See also [recentRecommendations].
class RecentRecommendationsFamily
    extends Family<AsyncValue<List<Map<String, dynamic>>>> {
  /// See also [recentRecommendations].
  const RecentRecommendationsFamily();

  /// See also [recentRecommendations].
  RecentRecommendationsProvider call({
    required ElementType elementType,
  }) {
    return RecentRecommendationsProvider(
      elementType: elementType,
    );
  }

  @override
  RecentRecommendationsProvider getProviderOverride(
    covariant RecentRecommendationsProvider provider,
  ) {
    return call(
      elementType: provider.elementType,
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
  String? get name => r'recentRecommendationsProvider';
}

/// See also [recentRecommendations].
class RecentRecommendationsProvider
    extends FutureProvider<List<Map<String, dynamic>>> {
  /// See also [recentRecommendations].
  RecentRecommendationsProvider({
    required ElementType elementType,
  }) : this._internal(
          (ref) => recentRecommendations(
            ref as RecentRecommendationsRef,
            elementType: elementType,
          ),
          from: recentRecommendationsProvider,
          name: r'recentRecommendationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recentRecommendationsHash,
          dependencies: RecentRecommendationsFamily._dependencies,
          allTransitiveDependencies:
              RecentRecommendationsFamily._allTransitiveDependencies,
          elementType: elementType,
        );

  RecentRecommendationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.elementType,
  }) : super.internal();

  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<List<Map<String, dynamic>>> Function(
            RecentRecommendationsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecentRecommendationsProvider._internal(
        (ref) => create(ref as RecentRecommendationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<List<Map<String, dynamic>>> createElement() {
    return _RecentRecommendationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecentRecommendationsProvider &&
        other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecentRecommendationsRef
    on FutureProviderRef<List<Map<String, dynamic>>> {
  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _RecentRecommendationsProviderElement
    extends FutureProviderElement<List<Map<String, dynamic>>>
    with RecentRecommendationsRef {
  _RecentRecommendationsProviderElement(super.provider);

  @override
  ElementType get elementType =>
      (origin as RecentRecommendationsProvider).elementType;
}

String _$recentReviewsHash() => r'1f1075c13dd8c9a1d2402150138088c0031324ad';

/// See also [recentReviews].
@ProviderFor(recentReviews)
const recentReviewsProvider = RecentReviewsFamily();

/// See also [recentReviews].
class RecentReviewsFamily extends Family<AsyncValue<List<Review>>> {
  /// See also [recentReviews].
  const RecentReviewsFamily();

  /// See also [recentReviews].
  RecentReviewsProvider call({
    required ElementType elementType,
  }) {
    return RecentReviewsProvider(
      elementType: elementType,
    );
  }

  @override
  RecentReviewsProvider getProviderOverride(
    covariant RecentReviewsProvider provider,
  ) {
    return call(
      elementType: provider.elementType,
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
  String? get name => r'recentReviewsProvider';
}

/// See also [recentReviews].
class RecentReviewsProvider extends FutureProvider<List<Review>> {
  /// See also [recentReviews].
  RecentReviewsProvider({
    required ElementType elementType,
  }) : this._internal(
          (ref) => recentReviews(
            ref as RecentReviewsRef,
            elementType: elementType,
          ),
          from: recentReviewsProvider,
          name: r'recentReviewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recentReviewsHash,
          dependencies: RecentReviewsFamily._dependencies,
          allTransitiveDependencies:
              RecentReviewsFamily._allTransitiveDependencies,
          elementType: elementType,
        );

  RecentReviewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.elementType,
  }) : super.internal();

  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<List<Review>> Function(RecentReviewsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecentReviewsProvider._internal(
        (ref) => create(ref as RecentReviewsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        elementType: elementType,
      ),
    );
  }

  @override
  FutureProviderElement<List<Review>> createElement() {
    return _RecentReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecentReviewsProvider && other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecentReviewsRef on FutureProviderRef<List<Review>> {
  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _RecentReviewsProviderElement extends FutureProviderElement<List<Review>>
    with RecentReviewsRef {
  _RecentReviewsProviderElement(super.provider);

  @override
  ElementType get elementType => (origin as RecentReviewsProvider).elementType;
}

String _$animeEpisodesHash() => r'143ffe8f8f3257e225b676cd2ed67e5b4a9a4446';

/// See also [animeEpisodes].
@ProviderFor(animeEpisodes)
const animeEpisodesProvider = AnimeEpisodesFamily();

/// See also [animeEpisodes].
class AnimeEpisodesFamily extends Family<AsyncValue<List<Episode>>> {
  /// See also [animeEpisodes].
  const AnimeEpisodesFamily();

  /// See also [animeEpisodes].
  AnimeEpisodesProvider call({
    required int id,
  }) {
    return AnimeEpisodesProvider(
      id: id,
    );
  }

  @override
  AnimeEpisodesProvider getProviderOverride(
    covariant AnimeEpisodesProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'animeEpisodesProvider';
}

/// See also [animeEpisodes].
class AnimeEpisodesProvider extends FutureProvider<List<Episode>> {
  /// See also [animeEpisodes].
  AnimeEpisodesProvider({
    required int id,
  }) : this._internal(
          (ref) => animeEpisodes(
            ref as AnimeEpisodesRef,
            id: id,
          ),
          from: animeEpisodesProvider,
          name: r'animeEpisodesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$animeEpisodesHash,
          dependencies: AnimeEpisodesFamily._dependencies,
          allTransitiveDependencies:
              AnimeEpisodesFamily._allTransitiveDependencies,
          id: id,
        );

  AnimeEpisodesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<List<Episode>> Function(AnimeEpisodesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnimeEpisodesProvider._internal(
        (ref) => create(ref as AnimeEpisodesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<List<Episode>> createElement() {
    return _AnimeEpisodesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnimeEpisodesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AnimeEpisodesRef on FutureProviderRef<List<Episode>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _AnimeEpisodesProviderElement extends FutureProviderElement<List<Episode>>
    with AnimeEpisodesRef {
  _AnimeEpisodesProviderElement(super.provider);

  @override
  int get id => (origin as AnimeEpisodesProvider).id;
}

String _$animeThemesHash() => r'eb4b6cc27f4c79ea40cbc94a6bd897977494f86a';

/// See also [animeThemes].
@ProviderFor(animeThemes)
const animeThemesProvider = AnimeThemesFamily();

/// See also [animeThemes].
class AnimeThemesFamily extends Family<AsyncValue<Map<dynamic, dynamic>>> {
  /// See also [animeThemes].
  const AnimeThemesFamily();

  /// See also [animeThemes].
  AnimeThemesProvider call({
    required int id,
  }) {
    return AnimeThemesProvider(
      id: id,
    );
  }

  @override
  AnimeThemesProvider getProviderOverride(
    covariant AnimeThemesProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'animeThemesProvider';
}

/// See also [animeThemes].
class AnimeThemesProvider extends FutureProvider<Map<dynamic, dynamic>> {
  /// See also [animeThemes].
  AnimeThemesProvider({
    required int id,
  }) : this._internal(
          (ref) => animeThemes(
            ref as AnimeThemesRef,
            id: id,
          ),
          from: animeThemesProvider,
          name: r'animeThemesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$animeThemesHash,
          dependencies: AnimeThemesFamily._dependencies,
          allTransitiveDependencies:
              AnimeThemesFamily._allTransitiveDependencies,
          id: id,
        );

  AnimeThemesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Map<dynamic, dynamic>> Function(AnimeThemesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnimeThemesProvider._internal(
        (ref) => create(ref as AnimeThemesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<Map<dynamic, dynamic>> createElement() {
    return _AnimeThemesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnimeThemesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AnimeThemesRef on FutureProviderRef<Map<dynamic, dynamic>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _AnimeThemesProviderElement
    extends FutureProviderElement<Map<dynamic, dynamic>> with AnimeThemesRef {
  _AnimeThemesProviderElement(super.provider);

  @override
  int get id => (origin as AnimeThemesProvider).id;
}

String _$elementWallpaperHash() => r'f6b8647a0fb3a985668c216bdb97f947022f8e62';

/// See also [elementWallpaper].
@ProviderFor(elementWallpaper)
const elementWallpaperProvider = ElementWallpaperFamily();

/// See also [elementWallpaper].
class ElementWallpaperFamily extends Family<AsyncValue<String>> {
  /// See also [elementWallpaper].
  const ElementWallpaperFamily();

  /// See also [elementWallpaper].
  ElementWallpaperProvider call({
    required String title,
    required int id,
    required ElementType elementType,
  }) {
    return ElementWallpaperProvider(
      title: title,
      id: id,
      elementType: elementType,
    );
  }

  @override
  ElementWallpaperProvider getProviderOverride(
    covariant ElementWallpaperProvider provider,
  ) {
    return call(
      title: provider.title,
      id: provider.id,
      elementType: provider.elementType,
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
  String? get name => r'elementWallpaperProvider';
}

/// See also [elementWallpaper].
class ElementWallpaperProvider extends AutoDisposeFutureProvider<String> {
  /// See also [elementWallpaper].
  ElementWallpaperProvider({
    required String title,
    required int id,
    required ElementType elementType,
  }) : this._internal(
          (ref) => elementWallpaper(
            ref as ElementWallpaperRef,
            title: title,
            id: id,
            elementType: elementType,
          ),
          from: elementWallpaperProvider,
          name: r'elementWallpaperProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$elementWallpaperHash,
          dependencies: ElementWallpaperFamily._dependencies,
          allTransitiveDependencies:
              ElementWallpaperFamily._allTransitiveDependencies,
          title: title,
          id: id,
          elementType: elementType,
        );

  ElementWallpaperProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
    required this.id,
    required this.elementType,
  }) : super.internal();

  final String title;
  final int id;
  final ElementType elementType;

  @override
  Override overrideWith(
    FutureOr<String> Function(ElementWallpaperRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ElementWallpaperProvider._internal(
        (ref) => create(ref as ElementWallpaperRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
        id: id,
        elementType: elementType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _ElementWallpaperProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ElementWallpaperProvider &&
        other.title == title &&
        other.id == id &&
        other.elementType == elementType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, elementType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ElementWallpaperRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `elementType` of this provider.
  ElementType get elementType;
}

class _ElementWallpaperProviderElement
    extends AutoDisposeFutureProviderElement<String> with ElementWallpaperRef {
  _ElementWallpaperProviderElement(super.provider);

  @override
  String get title => (origin as ElementWallpaperProvider).title;
  @override
  int get id => (origin as ElementWallpaperProvider).id;
  @override
  ElementType get elementType =>
      (origin as ElementWallpaperProvider).elementType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
