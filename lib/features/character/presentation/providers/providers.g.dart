// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$topCharacterHash() => r'7b0c9889a726eb60dcc06639c89ccdc1eeaac1bc';

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

/// See also [topCharacter].
@ProviderFor(topCharacter)
const topCharacterProvider = TopCharacterFamily();

/// See also [topCharacter].
class TopCharacterFamily extends Family<AsyncValue<List<Character>>> {
  /// See also [topCharacter].
  const TopCharacterFamily();

  /// See also [topCharacter].
  TopCharacterProvider call({
    int? page,
    int? limit,
  }) {
    return TopCharacterProvider(
      page: page,
      limit: limit,
    );
  }

  @override
  TopCharacterProvider getProviderOverride(
    covariant TopCharacterProvider provider,
  ) {
    return call(
      page: provider.page,
      limit: provider.limit,
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
  String? get name => r'topCharacterProvider';
}

/// See also [topCharacter].
class TopCharacterProvider extends FutureProvider<List<Character>> {
  /// See also [topCharacter].
  TopCharacterProvider({
    int? page,
    int? limit,
  }) : this._internal(
          (ref) => topCharacter(
            ref as TopCharacterRef,
            page: page,
            limit: limit,
          ),
          from: topCharacterProvider,
          name: r'topCharacterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$topCharacterHash,
          dependencies: TopCharacterFamily._dependencies,
          allTransitiveDependencies:
              TopCharacterFamily._allTransitiveDependencies,
          page: page,
          limit: limit,
        );

  TopCharacterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.limit,
  }) : super.internal();

  final int? page;
  final int? limit;

  @override
  Override overrideWith(
    FutureOr<List<Character>> Function(TopCharacterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TopCharacterProvider._internal(
        (ref) => create(ref as TopCharacterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        limit: limit,
      ),
    );
  }

  @override
  FutureProviderElement<List<Character>> createElement() {
    return _TopCharacterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopCharacterProvider &&
        other.page == page &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TopCharacterRef on FutureProviderRef<List<Character>> {
  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `limit` of this provider.
  int? get limit;
}

class _TopCharacterProviderElement
    extends FutureProviderElement<List<Character>> with TopCharacterRef {
  _TopCharacterProviderElement(super.provider);

  @override
  int? get page => (origin as TopCharacterProvider).page;
  @override
  int? get limit => (origin as TopCharacterProvider).limit;
}

String _$characterHash() => r'81dea918db10673850fc717c7818ac9426a5ea4f';

/// See also [character].
@ProviderFor(character)
const characterProvider = CharacterFamily();

/// See also [character].
class CharacterFamily extends Family<AsyncValue<Character>> {
  /// See also [character].
  const CharacterFamily();

  /// See also [character].
  CharacterProvider call({
    required int id,
  }) {
    return CharacterProvider(
      id: id,
    );
  }

  @override
  CharacterProvider getProviderOverride(
    covariant CharacterProvider provider,
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
  String? get name => r'characterProvider';
}

/// See also [character].
class CharacterProvider extends FutureProvider<Character> {
  /// See also [character].
  CharacterProvider({
    required int id,
  }) : this._internal(
          (ref) => character(
            ref as CharacterRef,
            id: id,
          ),
          from: characterProvider,
          name: r'characterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$characterHash,
          dependencies: CharacterFamily._dependencies,
          allTransitiveDependencies: CharacterFamily._allTransitiveDependencies,
          id: id,
        );

  CharacterProvider._internal(
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
    FutureOr<Character> Function(CharacterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CharacterProvider._internal(
        (ref) => create(ref as CharacterRef),
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
  FutureProviderElement<Character> createElement() {
    return _CharacterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CharacterProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CharacterRef on FutureProviderRef<Character> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CharacterProviderElement extends FutureProviderElement<Character>
    with CharacterRef {
  _CharacterProviderElement(super.provider);

  @override
  int get id => (origin as CharacterProvider).id;
}

String _$characterPicturesHash() => r'ad3ae10e35470be013201f93d34ed158bf5b5fe5';

/// See also [characterPictures].
@ProviderFor(characterPictures)
const characterPicturesProvider = CharacterPicturesFamily();

/// See also [characterPictures].
class CharacterPicturesFamily extends Family<AsyncValue<List<Image>>> {
  /// See also [characterPictures].
  const CharacterPicturesFamily();

  /// See also [characterPictures].
  CharacterPicturesProvider call({
    required int id,
  }) {
    return CharacterPicturesProvider(
      id: id,
    );
  }

  @override
  CharacterPicturesProvider getProviderOverride(
    covariant CharacterPicturesProvider provider,
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
  String? get name => r'characterPicturesProvider';
}

/// See also [characterPictures].
class CharacterPicturesProvider extends FutureProvider<List<Image>> {
  /// See also [characterPictures].
  CharacterPicturesProvider({
    required int id,
  }) : this._internal(
          (ref) => characterPictures(
            ref as CharacterPicturesRef,
            id: id,
          ),
          from: characterPicturesProvider,
          name: r'characterPicturesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$characterPicturesHash,
          dependencies: CharacterPicturesFamily._dependencies,
          allTransitiveDependencies:
              CharacterPicturesFamily._allTransitiveDependencies,
          id: id,
        );

  CharacterPicturesProvider._internal(
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
    FutureOr<List<Image>> Function(CharacterPicturesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CharacterPicturesProvider._internal(
        (ref) => create(ref as CharacterPicturesRef),
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
  FutureProviderElement<List<Image>> createElement() {
    return _CharacterPicturesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CharacterPicturesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CharacterPicturesRef on FutureProviderRef<List<Image>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CharacterPicturesProviderElement
    extends FutureProviderElement<List<Image>> with CharacterPicturesRef {
  _CharacterPicturesProviderElement(super.provider);

  @override
  int get id => (origin as CharacterPicturesProvider).id;
}

String _$characterAnimeHash() => r'51c4a15ab8940065780f1007682e873636a12561';

/// See also [characterAnime].
@ProviderFor(characterAnime)
const characterAnimeProvider = CharacterAnimeFamily();

/// See also [characterAnime].
class CharacterAnimeFamily
    extends Family<AsyncValue<List<Map<String, dynamic>>>> {
  /// See also [characterAnime].
  const CharacterAnimeFamily();

  /// See also [characterAnime].
  CharacterAnimeProvider call({
    required int id,
  }) {
    return CharacterAnimeProvider(
      id: id,
    );
  }

  @override
  CharacterAnimeProvider getProviderOverride(
    covariant CharacterAnimeProvider provider,
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
  String? get name => r'characterAnimeProvider';
}

/// See also [characterAnime].
class CharacterAnimeProvider
    extends FutureProvider<List<Map<String, dynamic>>> {
  /// See also [characterAnime].
  CharacterAnimeProvider({
    required int id,
  }) : this._internal(
          (ref) => characterAnime(
            ref as CharacterAnimeRef,
            id: id,
          ),
          from: characterAnimeProvider,
          name: r'characterAnimeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$characterAnimeHash,
          dependencies: CharacterAnimeFamily._dependencies,
          allTransitiveDependencies:
              CharacterAnimeFamily._allTransitiveDependencies,
          id: id,
        );

  CharacterAnimeProvider._internal(
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
    FutureOr<List<Map<String, dynamic>>> Function(CharacterAnimeRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CharacterAnimeProvider._internal(
        (ref) => create(ref as CharacterAnimeRef),
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
  FutureProviderElement<List<Map<String, dynamic>>> createElement() {
    return _CharacterAnimeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CharacterAnimeProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CharacterAnimeRef on FutureProviderRef<List<Map<String, dynamic>>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CharacterAnimeProviderElement
    extends FutureProviderElement<List<Map<String, dynamic>>>
    with CharacterAnimeRef {
  _CharacterAnimeProviderElement(super.provider);

  @override
  int get id => (origin as CharacterAnimeProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
