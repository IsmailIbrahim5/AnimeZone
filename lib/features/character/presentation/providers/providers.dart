import 'package:animezone/features/character/data/repository/character_repository.dart';
import 'package:animezone/features/character/domain/models/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/images.dart';
part 'providers.g.dart';

final characterRepositoryProvider = Provider<CharacterRepository>(
      (ref) => CharacterRepository(
   ref: ref,
  ),
);

@Riverpod(keepAlive: true)
Future<List<Character>> topCharacter(
    TopCharacterRef ref, {
      int? page,
      int? limit,
    }) {
  return ref.read(characterRepositoryProvider).getTopCharacters(
    page: page,
    limit: limit,
  );
}


@Riverpod(keepAlive: true)
Future<Character> character(
    CharacterRef ref, {
      required int id
    }) {
  return ref.read(characterRepositoryProvider).getCharacterFull(id);
}

@Riverpod(keepAlive: true)
Future<List<Image>> characterPictures(
    CharacterPicturesRef ref, {
      required int id
    }) {
  return ref.read(characterRepositoryProvider).getCharacterPictures(id);
}

@Riverpod(keepAlive: true)
Future<List<Map<String, dynamic>>> characterAnime(
    CharacterAnimeRef ref, {
      required int id
    }) {
  return ref.read(characterRepositoryProvider).getCharacterAnime(id);
}